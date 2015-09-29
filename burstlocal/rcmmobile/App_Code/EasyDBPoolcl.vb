Imports System.Collections
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text

Namespace mRCMAPI
  '! \brief This class is used for manage database connections. 
  '   

  Public Class EasyDBPoolcl
    '! \brief Constructor.
    '     

    Private Const m_iThresholdReleaseSeconds As Integer = 300
    Private Const m_bADOPoolingEnabled As Boolean = True

    Public Sub New()
    End Sub
    Protected Overrides Sub Finalize()
      Try
      Finally
        MyBase.Finalize()
      End Try
    End Sub

    '! \brief This property is used for database connection string.
    '     *  \details This property returns the database connection string and set its value also.
    '     

    Private Shared m_sDBConnectStringRCMMain As String = ""
    Private Shared oEasyDBPool As New ArrayList()

    '! \brief 
    '     *  Utility function checks all connections are intialized or not
    '     * 
    '     *  \details 
    '     *  This function checks all connections are intialized or not and return value according to it
    '     *
    '     

    Public Shared Function AreAllDBConnectionsSet() As Boolean
      Dim bReturn As Boolean = True
      If m_sDBConnectStringRCMMain = "" Then
        bReturn = False
      End If
      Return bReturn
    End Function

    '! \brief 
    '     *  Utility function Set all connections 
    '     * 
    '     *  \details 
    '     *  This function checks all connections are intialized or not and return value according to it
    '     * 
    '     * \param[in] sDBConnectStringRCMMain Connectionstring for RCM main server.
    '     * \param[in] sDBConnectStringRCMReadOnly Connectionstring for RCM main server.
    '     *
    '     

    Public Shared Sub SetAllDBConnections(ByVal sDBConnectStringRCMMain As String)
      m_sDBConnectStringRCMMain = sDBConnectStringRCMMain
    End Sub

    '! \brief 
    '     *  Utility function get connections  
    '     *
    '     *  \details 
    '     *  This function Gets Connection string for specified DBtype
    '     *
    '     * \param[in] eDBType enum defines the different database type.
    '     *
    '     * \retval sReturn Connection string
    '     

    Public Shared Function GetDBConnectionString(ByVal eDBType As EasyDBcl.enmDBType) As String
      Dim sReturn As String = ""
      If eDBType = EasyDBcl.enmDBType.RCMMain Then
        sReturn = m_sDBConnectStringRCMMain
      End If
      Return sReturn
    End Function

    '! \brief 
    '     *  Utility function to return available DB connection based on #EasyDBcl.enmDBType
    '     * 
    '     *  \details 
    '     *  This function return the available database connection from the pool.
    '     *  
    '     *  \param[in] eDBType Database type.
    '     *  \param[in] bLockConnection Exclusive access.
    '     * 
    '     *  \retval EasyDBcl Database connection object
    '     *  
    '     

    Public Shared Function GetEasyDBConnection(ByVal eDBType As EasyDBcl.enmDBType, ByVal bLockConnection As Boolean) As EasyDBcl
      Dim oEasyDBReturn As EasyDBcl = Nothing
      If Not m_bADOPoolingEnabled Then
        EasyDBPoolcl.ReleaseEasyDBConnections()

        If oEasyDBPool IsNot Nothing Then
          For Each oEasyDB As EasyDBcl In oEasyDBPool
            If oEasyDB.DBType = eDBType AndAlso Not oEasyDB.IsInUse() Then
              oEasyDBReturn = oEasyDB
              oEasyDBReturn.TimeLastAction = DateTime.Now
              Exit For
            End If
          Next
        End If
      End If
      If oEasyDBReturn Is Nothing Then
        oEasyDBReturn = New EasyDBcl(eDBType, GetDBConnectionString(eDBType))
        oEasyDBReturn.propConnectionId = oEasyDBPool.Count
        If Not m_bADOPoolingEnabled Then
          oEasyDBPool.Add(oEasyDBReturn)
        End If
      End If
      oEasyDBReturn.propIsInUse = bLockConnection
      Return oEasyDBReturn
    End Function

    '! \brief     Return available DB connection
    '     *  \details   This function return the available database connection from the pool.
    '     *  \param[in] bLockConnection Exclusive access.
    '     *  \retval EasyDBcl Database connection object
    '     

    Public Shared Function GetEasyDBConnection(ByVal bLockConnection As Boolean) As EasyDBcl
      Dim SecureKey = ""
      Return EasyDBPoolcl.GetEasyDBConnection(EasyDBcl.enmDBType.RCMMain, bLockConnection)
    End Function

    '! \brief This function is used for release database connection.
    '     *  \param iConnectionId <c>passes connection Id. </c>
    '     

    Public Shared Sub ReleaseEasyDBConnection(ByVal oEasyDB As EasyDBcl)
      If m_bADOPoolingEnabled Then
        If oEasyDB IsNot Nothing Then
          oEasyDB.Close()
        End If
      Else
        If oEasyDB IsNot Nothing Then
          oEasyDB.CloseReader()
          If oEasyDBPool IsNot Nothing Then
            oEasyDBPool.Remove(oEasyDB)
          End If
        End If
      End If
    End Sub

    Public Shared Sub ReleaseEasyDBConnections()
      If oEasyDBPool IsNot Nothing Then
        Dim tsDuration As TimeSpan
        For Each oEasyDB As EasyDBcl In oEasyDBPool
          tsDuration = DateTime.Now - oEasyDB.TimeLastAction
          If tsDuration.TotalSeconds > m_iThresholdReleaseSeconds Then
            oEasyDB.Close()
          End If
        Next
      End If
    End Sub

    '! \brief   Returns total number of connections in pool
    '     *  \details Returns total number of connections in pool
    '     

    Public Shared Function GetCount() As Integer
      Return oEasyDBPool.Count
    End Function

    '! \brief     This function execute SQL query statement.
    '     *  \details   This function execute SQL query statement.
    '     *  \param[in] sSQL SQL statement.
    '     

    Public Shared Sub ExecuteSQL(ByVal sSQL As String)
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(True)
      Try
        If oEasyDB.OpenReader(EasyDBcl.SqlType.Text, sSQL) Then
          oEasyDB.GetDataReader().Close()
        End If
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
    End Sub

    '! \brief     This function execute SQL query statement.
    '     *  \details   This function execute SQL query statement.
    '     *  \param[in] sSQL SQL statement.
    '     

    Public Shared Sub ExecuteSQL(ByVal eDBType As EasyDBcl.enmDBType, ByVal sSQL As String)
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(eDBType, True)
      Try
        If oEasyDB.OpenReader(EasyDBcl.SqlType.Text, sSQL) Then
          oEasyDB.GetDataReader().Close()
        End If
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
    End Sub

    '! \brief   This function returns reference to connection pool.
    '     *  \details This function returns reference to connection pool.
    '     

    Public Shared Function ReturnoEasyDBPool() As ArrayList
      Return oEasyDBPool
    End Function

    '! \brief   This function replaces connection pool.
    '     *  \details This function replaces connection pool.
    '     

    Public Shared Sub UpdateoEasyDBPool(ByVal oUpdatePool As ArrayList)
      oEasyDBPool = oUpdatePool
    End Sub

    '! \brief     This function execute SQL query statement and return column as integer
    '     *  \details   This function execute SQL query statement and return column as integer
    '     *  \param[in] sSQL SQL statement.
    '     *  \param[in] sCol Column name.
    '     

    Public Shared Function GetSingleColValueAsInt32(ByVal eDBType As EasyDBcl.enmDBType, ByVal sSQL As String, ByVal sCol As String) As Integer
      Dim iReturn As Integer = 0
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(eDBType, True)
      Try
        iReturn = oEasyDB.GetSingleColValueAsInt32(sSQL, sCol)
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return iReturn
    End Function

    '! \brief     This function execute SQL query statement and return column as integer
    '     *  \details   This function execute SQL query statement and return column as integer
    '     *  \param[in] sSQL SQL statement.
    '     *  \param[in] sCol Column name.
    '     

    Public Shared Function GetSingleColValueAsInt32(ByVal sSQL As String, ByVal sCol As String) As Integer
      Return EasyDBPoolcl.GetSingleColValueAsInt32(EasyDBcl.enmDBType.RCMMain, sSQL, sCol)
    End Function

    '! \brief     This function execute SQL query statement and return column as decimal
    '     *  \details   This function execute SQL query statement and return column as decimal
    '     *  \param[in] sSQL SQL statement.
    '     *  \param[in] sCol Column name.
    '     

    Public Shared Function GetSingleColValueAsDecimal(ByVal sSQL As String, ByVal sCol As String) As Decimal
      Dim dReturn As Decimal = 0D
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(True)
      Try
        dReturn = oEasyDB.GetSingleColValueAsDecimal(sSQL, sCol)
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return dReturn
    End Function

    '! \brief     This function execute SQL query statement and return column as string
    '     *  \details   This function execute SQL query statement and return column as string
    '     *  \param[in] sSQL SQL statement.
    '     *  \param[in] sCol Column name.
    '     

    Public Shared Function GetSingleColValueAsString(ByVal sSQL As String, ByVal sCol As String) As String
      Dim sReturn As String = ""
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(True)
      Try
        sReturn = oEasyDB.GetSingleColValueAsString(sSQL, sCol)
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return sReturn
    End Function

    '! \brief
    '     *  This function execute SQL query statement and return column as string
    '     *  
    '     *  \details 
    '     *  This function execute SQL query statement and return column as string
    '     *
    '     *  \param[in] eDBType Database type.
    '     *  \param[in] sSQL SQL statement.
    '     *  \param[in] sCol Column Name.
    '     

    Public Shared Function GetSingleColValueAsString(ByVal eDBType As EasyDBcl.enmDBType, ByVal sSQL As String, ByVal sCol As String) As String
      Dim sReturn As String = ""
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(eDBType, True)
      Try
        sReturn = oEasyDB.GetSingleColValueAsString(sSQL, sCol)
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return sReturn
    End Function

    '! \brief
    '     *  This function execute SQL query statement and return column as boolean
    '     *  
    '     *  \details 
    '     *  This function execute SQL query statement and return column as boolean
    '     *
    '     *  \param[in] sSQL SQL statement.
    '     *  \param[in] sCol Column name.
    '     

    Public Shared Function GetSingleColValueAsBool(ByVal sSQL As String, ByVal sCol As String) As Boolean
      Dim bReturn As Boolean = False
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(True)
      Try
        bReturn = oEasyDB.GetSingleColValueAsBool(sSQL, sCol)
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return bReturn
    End Function

    Public Shared Function GetSingleColValueAsBool(ByVal eDBType As EasyDBcl.enmDBType, ByVal sSQL As String, ByVal sCol As String) As Boolean
      Dim bReturn As Boolean = False
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(eDBType, True)
      Try
        bReturn = oEasyDB.GetSingleColValueAsBool(sSQL, sCol)
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return bReturn
    End Function

    '! \brief
    '     *  This function execute SQL query statement and return column as Datetime
    '     *  
    '     *  \details 
    '     *  This function execute SQL query statement and return column as Datetime
    '     *
    '     *  \param[in] sSQL SQL statement.
    '     *  \param[in] sCol Column name.
    '     

    Public Shared Function GetSingleColValueAsDateTime(ByVal sSQL As String, ByVal sCol As String) As DateTime
      Dim dtReturn As New DateTime()
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(True)
      Try
        dtReturn = oEasyDB.GetSingleColValueAsDateTime(sSQL, sCol)
      Catch ex As Exception
        Throw ex
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return dtReturn
    End Function

    '! \brief
    '     *  This function return the datatable for given query
    '     *  
    '     *  \details 
    '     *  This function return the datatable for given query
    '     *
    '     *  \param[in] sSQL SQL statement.
    '     

    Public Shared Function GetDataTable(ByVal sSQL As String) As DataTable
      Return GetDataTable(EasyDBcl.enmDBType.RCMMain, sSQL)
    End Function

    '! \brief
    '     *  This function return the datatable for give query
    '     *  
    '     *  \details 
    '     *  This function return the datatable for give query
    '     *
    '     *  \param[in] eDBType Database type.
    '     *  \param[in] sSQL SQL statement.
    '     

    Public Shared Function GetDataTable(ByVal eDBType As EasyDBcl.enmDBType, ByVal sSQL As String) As DataTable
      Dim dtReturn As DataTable = Nothing
      Dim oEasyDB As EasyDBcl = EasyDBPoolcl.GetEasyDBConnection(eDBType, True)
      Try
        dtReturn = oEasyDB.ConvertSQLDataAdapterToDataTable(sSQL)
      Catch ex As Exception
        Errorcl.HandleException(ex, True)
      Finally
        EasyDBPoolcl.ReleaseEasyDBConnection(oEasyDB)
      End Try
      Return dtReturn
    End Function

  End Class
End Namespace
