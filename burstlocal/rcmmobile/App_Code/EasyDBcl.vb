Imports System.Collections.Generic
Imports System.Collections
Imports System.Data
Imports System.Data.SqlClient
Imports System.Resources
Imports System.Text

Namespace mRCMAPI

  Public Class EasyDBcl

    Public Enum enmDBType
      None
      RCMMain
      RCMReadOnly
      RCMWS
    End Enum

    Private m_eDBType As enmDBType = enmDBType.None
    '!< Database type. 
    Public ReadOnly Property DBType() As enmDBType
      Get
        Return m_eDBType
      End Get
    End Property


    Public Enum CmdType
      NonQuery
      Reader
      Scalar
    End Enum

    Public Enum SqlType
      Text
      SP
      Table
    End Enum

    Private m_dtTimeLastAction As DateTime = DateTime.Now
    '!< Store when last query was executed on this connection. 
    Public Property TimeLastAction() As DateTime
      Get
        Return m_dtTimeLastAction
      End Get
      Set(ByVal value As DateTime)
        m_dtTimeLastAction = value
      End Set
    End Property

    'SQL Connection objects
    Private m_oSQLConnection As SqlConnection = Nothing
    Private m_oSqlCommand As SqlCommand = Nothing
    Private m_oSQLDataReader As SqlDataReader = Nothing

    'This property stores the last executed SQL.
    Private m_sLastSQL As String = ""
    Public ReadOnly Property LastSQL() As String
      Get
        Return m_sLastSQL
      End Get
    End Property

    Private m_iConnectionId As Integer = 0
    Public Property propConnectionId() As Integer
      Get
        Return m_iConnectionId
      End Get
      Set(ByVal value As Integer)
        m_iConnectionId = value
      End Set
    End Property

    Private m_bIsInUse As Boolean = False

    Public Property propIsInUse() As Boolean
      Get
        Return m_bIsInUse
      End Get
      Set(ByVal value As Boolean)
        m_bIsInUse = value
      End Set
    End Property

    Private m_sConnectString As String = ""


    Public Sub New(ByVal eDBType As enmDBType, ByVal sConnectString As String)
      Dim DBName As String = HttpContext.Current.Session("DBName") 'GetDBName(HttpContext.Current.Session("SecureKey"))
      'Dim aCookie As New HttpCookie("userInfo")
      'aCookie.Values("Email") = HttpContext.Current.Session("Email")
      'aCookie.Values("DBName") = HttpContext.Current.Session("DBName")
      'aCookie.Values("ServerID") = HttpContext.Current.Session("ServerID")
      'HttpContext.Current.Response.Cookies.Add(aCookie)
      If eDBType = enmDBType.RCMMain Then
        If InStr(sConnectString, "CheckDB") > 0 Then
          sConnectString = Replace(sConnectString, "CheckDB", DBName)
        End If
      End If
      m_sConnectString = sConnectString
      m_dtTimeLastAction = DateTime.Now
      m_eDBType = eDBType
      If m_eDBType = enmDBType.None Then
        m_eDBType = enmDBType.RCMMain
      End If
      Me.OpenConnection()
      Me.OpenCommand()
    End Sub

    Protected Overrides Sub Finalize()
      Try
        Me.CloseReader()
      Finally
        MyBase.Finalize()
      End Try
    End Sub

    Public Function GetDataReader() As SqlDataReader
      Return m_oSQLDataReader
    End Function

    Private Sub OpenConnection()
      If m_oSQLConnection Is Nothing Then
        m_oSQLConnection = New SqlConnection(m_sConnectString)
      End If
      If m_oSQLConnection.State = ConnectionState.Closed Then
        m_oSQLConnection.Open()
      End If
    End Sub

    Private Sub CloseConnection()
      If m_oSQLConnection IsNot Nothing AndAlso m_oSQLConnection.State <> ConnectionState.Closed Then
        m_oSQLConnection.Close()
      End If
    End Sub

    Private Sub OpenCommand()
      If m_oSqlCommand Is Nothing Then
        m_oSqlCommand = New SqlCommand(m_sConnectString)
      End If
      m_oSqlCommand.Connection = m_oSQLConnection
    End Sub

    Private Sub CloseCommand()
      If m_oSqlCommand IsNot Nothing Then
        m_oSqlCommand = Nothing
      End If
    End Sub

    Public Function OpenReader(ByVal eType As SqlType, ByVal sSQL As String) As Boolean
      Dim bReturn As Boolean = False
      m_dtTimeLastAction = DateTime.Now
      m_sLastSQL = sSQL
      m_oSqlCommand.Connection = m_oSQLConnection
      m_oSqlCommand.CommandType = ConvertSqlTypeToCommandType(eType)
      m_oSqlCommand.CommandText = sSQL
      m_oSqlCommand.CommandTimeout = 200
      Try
        m_oSQLDataReader = m_oSqlCommand.ExecuteReader()
        bReturn = m_oSQLDataReader.HasRows
        If Not bReturn Then
          m_oSQLDataReader.Close()
        End If
      Catch ex As SqlException
        HandleException(ex, True)
      End Try
      Return bReturn
    End Function

    Public Sub CloseReader()
      If m_oSQLDataReader IsNot Nothing AndAlso Not m_oSQLDataReader.IsClosed Then
        m_oSQLDataReader.Close()
      End If
    End Sub

    Public Sub Close()
      Me.CloseReader()
      Me.CloseCommand()
      Me.CloseConnection()
      m_bIsInUse = False
    End Sub

    Public Function ConvertSqlTypeToCommandType(ByVal eType As SqlType) As CommandType
      If eType = SqlType.SP Then
        Return CommandType.StoredProcedure
      ElseIf eType = SqlType.Table Then
        Return CommandType.TableDirect
      ElseIf eType = SqlType.Text Then
        Return CommandType.Text
      Else
        Return CommandType.Text
      End If
    End Function

    Public Function ConvertSQLDataAdapterToDataSet(ByVal sSQL As String) As DataSet
      m_dtTimeLastAction = DateTime.Now
      m_sLastSQL = sSQL
      Dim oSqlDataAdapter As New SqlDataAdapter(sSQL, m_oSQLConnection)
      Dim dtReturn As New DataSet()
      oSqlDataAdapter.Fill(dtReturn)
      Me.CloseConnection()
      Return dtReturn
    End Function

    Public Function ConvertSQLDataAdapterToDataTable(ByVal sSQL As String) As DataTable
      m_dtTimeLastAction = DateTime.Now
      m_sLastSQL = sSQL
      'DataSet oDataSet = new DataSet();
      Dim oSqlDataAdapter As New SqlDataAdapter(sSQL, m_oSQLConnection)
      Dim oDataTable As New DataTable()
      Try
        oSqlDataAdapter.Fill(oDataTable)
        'oSqlDataAdapter.Fill(oDataSet);
        'if (oDataSet.Tables.Count > 0)
        If True Then
          'oDataTable = oDataSet.Tables[0];
        End If
      Catch ex As SqlException
        HandleException(ex, True)
      End Try
      Return oDataTable
    End Function

    Public Function GetColOrdinal(ByVal sCol As String) As Integer
      Return m_oSQLDataReader.GetOrdinal(sCol)
    End Function

    Public Function GetColValue(ByVal sCol As String) As Object
      Return m_oSQLDataReader.GetValue((GetColOrdinal(sCol)))
    End Function

    Public Function GetColValueAsBool(ByVal sCol As String) As Boolean
      Return System.Convert.ToBoolean(GetColValue(sCol))
    End Function

    Public Function GetColValueAsDecimal(ByVal sCol As String) As Decimal
      Return System.Convert.ToDecimal(GetColValue(sCol))
    End Function

    Public Function GetColValueAsInt16(ByVal sCol As String) As Int16
      Return System.Convert.ToInt16(GetColValue(sCol))
    End Function

    Public Function GetColValueAsInt32(ByVal sCol As String) As Int32
      Return System.Convert.ToInt32(GetColValue(sCol))
    End Function

    Public Function GetColValueAsInt64(ByVal sCol As String) As Int64
      Return System.Convert.ToInt64(GetColValue(sCol))
    End Function

    Public Function GetColValueAsString(ByVal sCol As String) As String
      Return System.Convert.ToString(GetColValue(sCol))
    End Function

    Public Function GetColValueAsDateTime(ByVal sCol As String) As DateTime
      Return System.Convert.ToDateTime(GetColValue(sCol))
    End Function

    Public Function HandleException(ByVal ex As Exception, ByVal ShowMessage As Boolean) As String
      Dim errorMessages As New StringBuilder()
      If ex.[GetType]().Name = "SqlException" Then
        Dim oex As SqlException = DirectCast(ex, SqlException)
        For i As Integer = 0 To oex.Errors.Count - 1
          errorMessages.Append(Convert.ToString(oex.Errors(i).Message.Split(New String() {"##"}, 2, StringSplitOptions.None).GetValue(0)) & vbLf)
        Next
      End If
      If ShowMessage Then
        'clAppl.ShowMessage(errorMessages.ToString());
        Throw ex
      End If
      Return errorMessages.ToString()
    End Function

    Public Function IsInUse() As Boolean
      Dim bReturn As Boolean = False
      If m_bIsInUse OrElse (m_oSQLDataReader IsNot Nothing AndAlso Not m_oSQLDataReader.IsClosed) OrElse m_oSQLConnection.State <> ConnectionState.Open Then
        bReturn = True
      End If
      Return bReturn
    End Function

    Public Function GetSingleColValueAsDecimal(ByVal sSQL As String, ByVal sCol As String) As Decimal
      Dim dcReturn As Decimal = 0
      If Me.OpenReader(EasyDBcl.SqlType.Text, sSQL) Then
        If m_oSQLDataReader.Read() Then
          dcReturn = GetColValueAsDecimal(sCol)
        End If
        m_oSQLDataReader.Close()
      End If
      Return dcReturn
    End Function

    Public Function GetSingleColValueAsInt32(ByVal sSQL As String, ByVal sCol As String) As Integer
      Dim iReturn As Integer = 0
      If Me.OpenReader(EasyDBcl.SqlType.Text, sSQL) Then
        If m_oSQLDataReader.Read() Then
          iReturn = GetColValueAsInt32(sCol)
        End If
        m_oSQLDataReader.Close()
      End If
      Return iReturn
    End Function

    Public Function GetSingleColValueAsString(ByVal sSQL As String, ByVal sCol As String) As String
      Dim sReturn As String = ""
      If Me.OpenReader(EasyDBcl.SqlType.Text, sSQL) Then
        If m_oSQLDataReader.Read() Then
          sReturn = GetColValueAsString(sCol)
        End If
        m_oSQLDataReader.Close()
      End If
      Return sReturn
    End Function

    Public Function GetSingleColValueAsBool(ByVal sSQL As String, ByVal sCol As String) As Boolean
      Dim bReturn As Boolean = False
      If Me.OpenReader(EasyDBcl.SqlType.Text, sSQL) Then
        If m_oSQLDataReader.Read() Then
          bReturn = GetColValueAsBool(sCol)
        End If
        m_oSQLDataReader.Close()
      End If
      Return bReturn
    End Function

    Public Function GetSingleColValueAsDateTime(ByVal sSQL As String, ByVal sCol As String) As DateTime
      Dim dtReturn As New DateTime()
      If OpenReader(EasyDBcl.SqlType.Text, sSQL) Then
        If GetDataReader().Read() Then
          dtReturn = GetColValueAsDateTime(sCol)
        End If
        GetDataReader().Close()
      End If
      Return dtReturn
    End Function
    Public Shared Function GetDBType(ByVal iDBType As Integer) As EasyDBcl.enmDBType
      Dim eDBType As EasyDBcl.enmDBType = EasyDBcl.enmDBType.None
      If iDBType = 1 Then
        eDBType = EasyDBcl.enmDBType.RCMMain
      ElseIf iDBType = 2 Then
        eDBType = EasyDBcl.enmDBType.RCMReadOnly
      ElseIf iDBType = 3 Then
        eDBType = EasyDBcl.enmDBType.RCMWS
      End If
      Return eDBType
    End Function

    Public Function GetConnectionString(ByVal eDBType As enmDBType, ByVal sConnectString As String) As String
      If eDBType = enmDBType.RCMMain Then
        Dim DBName As String = "RcmDemo7"
        If InStr(sConnectString, "CheckDB") > 0 Then
          Dim str1, str2 As String
          str1 = Mid(sConnectString, 1, InStr(sConnectString, "CheckDB") - 1)
          str2 = Mid(sConnectString, InStr(sConnectString, "CheckDB") + 7)

          sConnectString = str1 & DBName & str2
        End If
      End If
      Return sConnectString
    End Function

    Shared Function GetDBName(ByVal SecureKey As String) As String
      Dim DBName As String = ""
      Dim Sql, dsn As String
      Dim myconnection As SqlConnection
      Dim mycommand As SqlCommand
      Dim myreader As SqlDataReader
      Try
        dsn = ConfigurationManager.ConnectionStrings("RCMWS").ConnectionString
        myconnection = New SqlConnection(dsn)
        myconnection.Open()
        Sql = "Select * from WSK where Secure_Key='" & SecureKey & "' and Active='True'"
        mycommand = New SqlCommand(Sql, myconnection)
        myreader = mycommand.ExecuteReader
        If (myreader.Read() = True) Then
          DBName = myreader("Customer_DB")
        Else
          DBName = "error"
        End If
        myreader.Close()
        myreader = Nothing
        mycommand.Dispose()
        mycommand = Nothing
      Catch ex As Exception
        Throw ex
      End Try
      Return DBName
    End Function
  End Class
End Namespace
