Imports System.Data
Imports System.Xml

Partial Class FooterHome
  Inherits System.Web.UI.UserControl
  Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI
  Dim sErrorCode As String = ""
  Dim sErrorMsg As String = ""
  Dim sErrorResponseCode As String = ""
  Dim sErrorResponse As String = ""
  Dim sResponse As String
  Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
    Dim iCompanyID As Integer = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings("CompanyID"))
    Dim ds As DataSet = WS_RCMClientAPI.requestCompanyContactDetails(iCompanyID, System.Configuration.ConfigurationManager.AppSettings("CompanyKey"))
    sResponse = mRCMAPI.IOcl.GetXMLasStringFromDataSet(ds)
    Dim xDocResponse = New XmlDocument()
    'Load the Xml file
    xDocResponse.LoadXml(sResponse)
    Dim m_nodelist As XmlNodeList
    Dim m_node As XmlNode
    
    'Check the eror Element List
    m_node = xDocResponse.SelectSingleNode("Error")
    If IsNothing(m_node) = False Then
      'Get the ErrorCode Element Value
      sErrorCode = m_node.ChildNodes.Item(0).InnerText
    End If
    m_node = Nothing

    If sErrorCode = "" And sErrorMsg = "" Then
      'Get the PickUp Location Element List
      m_nodelist = xDocResponse.SelectNodes("/ContactDetails/CompanyContactDetails")
      ''Loop through the nodes
      Dim sCompanyName As String = ""
      Dim sAdress As String = ""
      Dim sCity As String = ""
      Dim sSuburb As String = ""
      Dim sState As String = ""
      Dim sPostCode As String = ""
      Dim sCountry As String = ""
      Dim sPhone As String = ""
      Dim sFreePhone As String = ""
      Dim sFax As String = ""
      Dim sEmail As String = ""
      Dim sWebSite As String = ""
      Dim sTermsNContidionsURL As String = ""
      Dim sMapURL As String = ""
      Dim sPrivacyPolicyURL As String = ""

      '<CompanyName>RENTAL CAR MANAGER</CompanyName><Adress>100 QUEEN STREET</Adress><City>BRISBANE</City><Suburb>CENTRAL</Suburb><State>QLD</State><PostCode>4520</PostCode><Country>Australia</Country><Phone>+61 7 32896956</Phone><FreePhone>238738378378</FreePhone><Fax>+61 7 32896916</Fax><Email>graeme@gmhsystems.com.au</Email><WebSite>www.rentalcarmanager.com</WebSite><TermsNContidionsURL>www.rentalcarmanager.com.au</TermsNContidionsURL><MapURL /><PrivacyPolicyURL />
      For Each m_node In m_nodelist
        sCompanyName = m_node.SelectSingleNode("CompanyName").InnerText
        sTermsNContidionsURL = m_node.SelectSingleNode("TermsNContidionsURL").InnerText
        sWebSite = m_node.SelectSingleNode("WebSite").InnerText
        sPrivacyPolicyURL = m_node.SelectSingleNode("PrivacyPolicyURL").InnerText
      Next
      lblCompanyName.Text = sCompanyName
      If LCase(System.IO.Path.GetFileName(System.Web.HttpContext.Current.Request.Url.AbsolutePath)) = "webstep1.aspx" Then
        lnkHome.NavigateUrl = ""
      Else
        lnkHome.NavigateUrl = "../WebStep1.aspx"
      End If

      If sTermsNContidionsURL = "" Then
        lnkTermsCondition.Visible = False
        'lblPipe1.Visible = False
        lblPipe2.Visible = False
      Else
        If InStr(sTermsNContidionsURL, "http") = 1 Then
          lnkTermsCondition.NavigateUrl = sTermsNContidionsURL
        Else
          lnkTermsCondition.NavigateUrl = "http://" & sTermsNContidionsURL
        End If
      End If

      If sPrivacyPolicyURL = "" Then
        lnkPrivacyPolicy.Visible = False
        lblPipe3.Visible = False
      Else
        If InStr(sPrivacyPolicyURL, "http") = 1 Then
          lnkPrivacyPolicy.NavigateUrl = sPrivacyPolicyURL
        Else
          lnkPrivacyPolicy.NavigateUrl = "http://" & sPrivacyPolicyURL
        End If

      End If


      If sWebSite = "" Then
        lnkViewFullSite.Visible = False
      Else
        If InStr(sWebSite, "http") = 1 Then
          lnkViewFullSite.NavigateUrl = sWebSite
        Else
          lnkViewFullSite.NavigateUrl = "http://" & sWebSite
        End If
      End If


      m_nodelist = Nothing
      m_node = Nothing
    End If
  End Sub
End Class
