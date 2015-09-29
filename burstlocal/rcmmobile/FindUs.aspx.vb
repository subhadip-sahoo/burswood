Imports mRCMAPI
Imports System.Data
Imports System.Xml

'Imports System.Web.UI.MobileControls

Partial Class FindUs
  Inherits BasePage
  Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI
  Dim sErrorCode As String = ""
  Dim sErrorMsg As String = ""
  Dim sErrorResponseCode As String = ""
  Dim sErrorResponse As String = ""
  Dim sResponse As String


  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    FindUsheader.TitleImage = "~/images/Contactus.png"
    FindUsheader.labelLeft = "Find Us on Map"

    Dim myMasterPage As MasterPage = CType(Page.Master, MasterPage)
    'Dim lnkContactUs As HyperLink = CType(myMasterPage.FindControl("btnContactUs"), HyperLink)
    'lnkContactUs.Text = "Mrinal"
    Dim lnkFindUs As HyperLink = CType(myMasterPage.FindControl("btnFindUs"), HyperLink)
    lnkFindUs.Text = "Book Now"
    lnkFindUs.NavigateUrl = "WebStep1.aspx"
    Dim iCompanyID As Integer = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings("CompanyID"))
    Dim ds As DataSet = WS_RCMClientAPI.requestCompanyContactDetails(iCompanyID, System.Configuration.ConfigurationManager.AppSettings("CompanyKey"))
    sResponse = mRCMAPI.IOcl.GetXMLasStringFromDataSet(ds)
    Dim xDocResponse = New XmlDocument()
    'Load the Xml file
    xDocResponse.LoadXml(sResponse)

    Dim m_nodelist As XmlNodeList
    Dim m_node As XmlNode

    ''''Check the eror Element List
    'm_nodelist = xDocResponse.SelectNodes("/ContactDetails/CompanyContactDetails")
    'Dim count As Integer = xDocResponse.SelectNodes("/ContactDetails/CompanyContactDetails").Count
    ''Loop through the nodes
    'For Each m_node In m_nodelist
    '  'Get the ErrorCode Element Value
    '  sErrorCode = m_node.ChildNodes.Item(0).InnerText
    '  'Get the ErrorMsg Element Value
    '  If count > 1 Then
    '    sErrorMsg = m_node.ChildNodes.Item(1).InnerText
    '  End If
    'Next
    'm_nodelist = Nothing
    'm_node = Nothing

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
        'sCompanyName = m_node.SelectSingleNode("CompanyName").InnerText
        'sTermsNContidionsURL = m_node.SelectSingleNode("TermsNContidionsURL").InnerText
        'sWebSite = m_node.SelectSingleNode("WebSite").InnerText
        'sPrivacyPolicyURL = m_node.SelectSingleNode("PrivacyPolicyURL").InnerText
        sPhone = m_node.SelectSingleNode("Phone").InnerText
        sAdress = m_node.SelectSingleNode("Adress").InnerText
        sCity = m_node.SelectSingleNode("City").InnerText
        sSuburb = m_node.SelectSingleNode("Suburb").InnerText
        sState = m_node.SelectSingleNode("State").InnerText
        sPostCode = m_node.SelectSingleNode("PostCode").InnerText
        sCountry = m_node.SelectSingleNode("Country").InnerText
        sPhone = m_node.SelectSingleNode("Phone").InnerText
        sFreePhone = m_node.SelectSingleNode("FreePhone").InnerText
        sFax = m_node.SelectSingleNode("Fax").InnerText
        sEmail = m_node.SelectSingleNode("Email").InnerText
        sMapURL = m_node.SelectSingleNode("MapURL").InnerText

        'imgGoogleMap.ImageUrl = "http://maps.google.com/maps/api/staticmap?center=-26.660911,153.101192&zoom=16&markers=-27.367280,152.850381%7C-26.660911,153.101192&size=250x250&sensor=true"
      Next

      ltrMap.Text = sMapURL
      m_nodelist = Nothing
      m_node = Nothing
    End If
  End Sub
End Class