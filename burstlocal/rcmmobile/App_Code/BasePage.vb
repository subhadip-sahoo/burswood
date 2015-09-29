Imports Microsoft.VisualBasic
Namespace mRCMAPI
  Public Class BasePage
    Inherits System.Web.UI.Page
    Protected Overrides Sub OnPreInit(e As EventArgs)
      MyBase.OnPreInit(e)
      If Session("MyTheme") Is Nothing Then
                Session.Add("MyTheme", "Australiawide71")
        Page.Theme = DirectCast(Session("MyTheme"), String)
      Else
        Page.Theme = DirectCast(Session("MyTheme"), String)
      End If
    End Sub

    Public Shared Function GetRadComboBoxFormValue(ByVal clientID As String) As String
      Dim clientState As String = HttpContext.Current.Request.Form(clientID + "_ClientState")

      If Not clientState = "" Then
        Dim regex As New Regex(".+""value"":""")
        clientState = regex.Replace(clientState, [String].Empty)

        regex = New Regex(""",""text"".+")
        clientState = regex.Replace(clientState, [String].Empty)
      End If

      Return clientState
    End Function
  End Class
End Namespace