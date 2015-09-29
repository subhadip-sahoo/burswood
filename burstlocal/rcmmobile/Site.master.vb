Imports mRCMAPI
Partial Class Site
  Inherits System.Web.UI.MasterPage
  'Dim sTheme As String = "RCM"
  'Dim oSessioncl As New Sessioncl
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
    'http://demo.rentalcarmanager.com/db/AuRcmDemo49/Mobilelogo.png
    '"https://" & HttpContext.Current.Request.Url.Host &
    logo.ImageUrl = "/DB/" & System.Configuration.ConfigurationManager.AppSettings("CompanyCode") & "/Mobilelogo.png"
    If System.Configuration.ConfigurationManager.AppSettings("FindUsPageLink") <> "" Then
      btnFindUs.NavigateUrl = System.Configuration.ConfigurationManager.AppSettings("FindUsPageLink")
    Else
      btnFindUs.NavigateUrl = "FindUs.aspx"
    End If

    If System.Configuration.ConfigurationManager.AppSettings("ContactUsPageLink") <> "" Then
      btnContactUs.NavigateUrl = System.Configuration.ConfigurationManager.AppSettings("ContactUsPageLink")
    Else
      btnContactUs.NavigateUrl = "ContactUs.aspx"
    End If
  End Sub

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If InStr(Request.ServerVariables("HTTP_ACCEPT"), "application/vnd.wap.xhtml+xml") > 0 Then
      Response.ContentType = "application/vnd.wap.xhtml+xml"
      'If InStr(Request.ServerVariables("HTTP_ACCEPT"), "application/xhtml+xml") > 0 Then
      'Response.ContentType = "application/xhtml+xml"
    End If
  End Sub
  'Public Property btnFindUsNavigateUrl() As String
  '  Get
  '    Return btnFindUs.NavigateUrl
  '  End Get
  '  Set(ByVal value As String)
  '    btnFindUs.NavigateUrl = value
  '  End Set
  'End Property

  'Public Property btnFindUsText() As String
  '  Get
  '    Return btnFindUs.Text
  '  End Get
  '  Set(ByVal value As String)
  '    btnFindUs.Text = value
  '  End Set
  'End Property

  'Public Property btnContactUsNavigateUrl() As String
  '  Get
  '    Return btnContactUs.NavigateUrl
  '  End Get
  '  Set(ByVal value As String)
  '    btnContactUs.NavigateUrl = value
  '  End Set
  'End Property

  'Public Property btnContactUsText() As String
  '  Get
  '    Return btnContactUs.Text
  '  End Get
  '  Set(ByVal value As String)
  '    btnContactUs.Text = value
  '  End Set
  'End Property

  'https://developers.google.com/analytics/devguides/collection/other/mobileWebsites
  ReadOnly GaAccount As String = System.Configuration.ConfigurationManager.AppSettings("GAKey") '"MO-39196003-1"
  ReadOnly GaPixel As String = "ga.aspx"

  Public Function GoogleAnalyticsGetImageUrl() As String
    Dim url As New System.Text.StringBuilder()
    url.Append(GaPixel + "?")
    url.Append("utmac=").Append(GaAccount)

    Dim RandomClass As New Random()
    url.Append("&utmn=").Append(RandomClass.[Next](&H7FFFFFFF))

    Dim referer As String = "-"
    If Request.UrlReferrer IsNot Nothing AndAlso "" <> Request.UrlReferrer.ToString() Then
      referer = Request.UrlReferrer.ToString()
    End If
    url.Append("&utmr=").Append(HttpUtility.UrlEncode(referer))

    If HttpContext.Current.Request.Url IsNot Nothing Then
      url.Append("&utmp=").Append(HttpUtility.UrlEncode(Request.Url.PathAndQuery))
    End If

    url.Append("&guid=ON")

    Return url.ToString()
  End Function

End Class