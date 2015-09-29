
Partial Class DetectscreenHeightWidth
  Inherits System.Web.UI.Page

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Request.QueryString("action") IsNot Nothing Then
      ' store the screen resolution in Session["ScreenResolution"] 
      ' and redirect back to default.aspx
      Session("ScreenResolution") = Request.QueryString("res").ToString()
      Response.Redirect("webStep1.aspx")
    End If
  End Sub
End Class
