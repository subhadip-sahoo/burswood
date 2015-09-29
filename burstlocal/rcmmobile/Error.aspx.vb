Imports System.IO
Partial Class sError
  Inherits System.Web.UI.Page
  Private m_sSQL As String = "" '!< String variable for SQL queries. 
  Private m_sMessage As Integer = -1 '!< Integer variable for SQL Message. 
  Private m_iErrorID As Integer
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
  End Sub
End Class
