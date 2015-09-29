Imports mRCMAPI
Partial Class Footer
    Inherits System.Web.UI.UserControl

  'Protected Sub btnHome_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnHome.Click
  '  Response.Redirect(Sessioncl.SetHomePage)
  'End Sub

  'Protected Sub lnkHome_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkHome.Click
  '  lnkHome.Style.Value = "verticle-align:middle;"
  '  Response.Redirect(Sessioncl.SetHomePage)
  'End Sub
  Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
    If System.Configuration.ConfigurationManager.AppSettings("HomePageLink") <> "" Then
      btnHome.NavigateUrl = System.Configuration.ConfigurationManager.AppSettings("HomePageLink")
    Else
      btnHome.NavigateUrl = "../WebStep1.aspx"
    End If
  End Sub
End Class
