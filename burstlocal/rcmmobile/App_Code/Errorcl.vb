Imports System.Collections.Generic
Imports System.Collections
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Resources
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Text

Namespace mRCMAPI
  '! \class Errorcl
  '   *  \brief 
  '   *  Used for handling errors.
  '   * 
  '   *  \details 
  '   *  This class provide functionality to handle errors.
  '   *  
  '   *  \todo 
  '   *  Implement security enhancements, may only be required for webmethods.
  '   

  Public Class Errorcl
    Private Const m_sSessionErrorFlagName As String = "sErrorMessage"
    Private m_ErrorMsg As String = ""

    Public ReadOnly Property ErrorMsg() As String
      Get
        Return m_ErrorMsg
      End Get
    End Property

    Public Sub Errorcl()
    End Sub

    '! \brief This function for handling exceptions.
    '     *  \param ex <c>passes Exception class object. </c>.
    '     *  \param ShowMessage <c>passes boolean value to show message or not. </c>.
    '     
    Public Sub Errorcl(ByVal ErrorMsg As String)
      m_ErrorMsg = ErrorMsg
    End Sub

    Public Shared Function HandleException(ByVal ex As Exception, ByVal ShowMessage As Boolean) As String
      Dim errorMessages As New StringBuilder()
      'WriteExceptionLog(ex);
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

    Public Shared Sub HandleError(ByVal sErrorMessage As String)
      HttpContext.Current.Session(m_sSessionErrorFlagName) = sErrorMessage
      HttpContext.Current.Response.Redirect("/include/error.aspx")
    End Sub

    Public Shared Function GetSessionError() As String
      Return Stringcl.GetValue(HttpContext.Current.Session(m_sSessionErrorFlagName))
    End Function

    '! \brief     Exception logging to file
    '     *  \details   Function to write exception message into log file
    '     *  \param[in] ex Exception object.
    '     

    Public Shared Sub WriteExceptionLog(ByVal ex As Exception, ByVal sLogFileName As String, ByVal sMessage As String)
      Dim oStreamWriter As New StreamWriter(Path.Combine(Environment.CurrentDirectory, sLogFileName), True)
      If oStreamWriter IsNot Nothing Then
        oStreamWriter.WriteLine(vbCr & vbLf & vbCr & vbLf & "Date: " & DateTime.Now.ToString() & vbCr & vbLf & vbCr & vbLf & sMessage & vbCr & vbLf & vbCr & vbLf & "Sorry there's a problem: " & ex.Message.ToString() & vbCr & vbLf & "Detail: " & ex.GetBaseException().ToString())
        oStreamWriter.Flush()
        oStreamWriter.Close()
      End If
    End Sub
  End Class
End Namespace
