Imports mRCMAPI
Partial Class Header
    Inherits System.Web.UI.UserControl

  'Protected Sub btnHome_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnHome.Click
  ' Response.Redirect(Sessioncl.SetHomePage)
  'End Sub


  'Protected Sub lnkHome_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkHome.Click
  '  'Response.Redirect(Sessioncl.SetHomePage)
  'End Sub

  Public Property TitleImage() As String
    Get
      Return formheadertext.ImageUrl
    End Get
    Set(ByVal value As String)
      formheadertext.ImageUrl = value
    End Set
  End Property

  Public Property labelRight() As String
    Get
      Return lblRight.Text
    End Get
    Set(ByVal value As String)
      lblRight.Text = lblRight.Text & " " & value
    End Set
  End Property

  Public Property labelLeft() As String
    Get
      Return lblLeft.Text
    End Get
    Set(ByVal value As String)
      lblLeft.Text = value
    End Set
  End Property

  Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
    If System.Configuration.ConfigurationManager.AppSettings("HomePageLink") <> "" Then
      btnHome.NavigateUrl = System.Configuration.ConfigurationManager.AppSettings("HomePageLink")
    Else
      btnHome.NavigateUrl = "../WebStep1.aspx"
    End If
  End Sub
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    'Dim oSessioncl As New Sessioncl
    'StepTitle.Style.Value = oSessioncl.bgThemeColor
    If labelRight = "TOTAL" Then
      lblRight.Text = ""
      lblRight.Visible = False
    End If
  End Sub
End Class
