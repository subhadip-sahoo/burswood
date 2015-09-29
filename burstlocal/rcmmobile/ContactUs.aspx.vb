Imports mRCMAPI
Imports System.Data
Imports System.Xml

'Imports System.Web.UI.MobileControls

Partial Class ContactUs
  Inherits BasePage
 Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI
  Dim sErrorCode As String = ""
  Dim sErrorMsg As String = ""
  Dim sErrorResponseCode As String = ""
  Dim sErrorResponse As String = ""
  Dim sResponse As String


  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Contactheader.TitleImage = "~/images/Contactus.png"
    Contactheader.labelLeft = "Contact Details"


    Dim myMasterPage As MasterPage = CType(Page.Master, MasterPage)
    Dim lnkContactUs As HyperLink = CType(myMasterPage.FindControl("btnContactUs"), HyperLink)
    lnkContactUs.Text = "Book Now"
    lnkContactUs.NavigateUrl = "WebStep1.aspx"
    'lnkContactUs.Text = "Mrinal"

    'Dim lnkFindUs As HyperLink = CType(myMasterPage.FindControl("btnFindUs"), HyperLink)
    'lnkFindUs.Text = "Book Now"
    'lnkFindUs.NavigateUrl = "WebStep1.aspx"
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
      Next
      If sFreePhone <> "" Then
        lbltollfree1Value.Text = sFreePhone
      Else
        tr_tollfree1Value.Visible = False
      End If
      If sPhone <> "" Then
        lbltollfree2Value.Text = sPhone
      Else
        tr_tollfree2Value.Visible = False
      End If
      If sPhone <> "" Then
        lblOffice1Value.Text = sPhone
      Else
        tr_OfficePhone.Visible = False
      End If

      If sFax<>"" then
        lblOfficeFaxValue.Text = sFax
      Else
        tr_OfficeFax.Visible = False
      End If

      If sEmail <> "" Then
        lblOfficeEmailValue.Text = sEmail
      Else
        tr_OfficeEmail.Visible = False
      End If

      If sAdress <> "" Then
        'sAdress = sAdress & ", "
      End If
      lblOfficeAddressValue.Text = sAdress

      If sCity <> "" Then
        'sCity = sCity & ", "
      End If
      lblOfficeCityValue.Text = sCity

      If sSuburb <> "" Then
        sSuburb = sSuburb & ", "
      End If
      lblOfficeSuburbValue.Text = sSuburb

      If sState <> "" Then
        sState = sState & ", "
      End If
      lblOfficeStateValue.Text = sState

      If sPostCode <> "" And sCountry <> "" Then
        'sPostCode = sPostCode & ", "
      End If
      lblOfficePostCodeValue.Text = sPostCode

      'If sCountry <> "" Then
      '  sCountry = sCountry & ", "
      'End If
      lblCountryValue.Text = sCountry

      'lblCompanyName.Text = sCompanyName
      'If LCase(System.IO.Path.GetFileName(System.Web.HttpContext.Current.Request.Url.AbsolutePath)) = "webstep1.aspx" Then
      '  lnkHome.NavigateUrl = ""
      'Else
      '  lnkHome.NavigateUrl = "../WebStep1.aspx"
      'End If

      'If sTermsNContidionsURL = "" Then
      '  lnkTermsCondition.Visible = False
      '  'lblPipe1.Visible = False
      '  lblPipe2.Visible = False
      'Else
      '  lnkTermsCondition.NavigateUrl = sTermsNContidionsURL
      'End If

      'If sPrivacyPolicyURL = "" Then
      '  lnkPrivacyPolicy.Visible = False
      '  lblPipe3.Visible = False
      'Else
      '  lnkPrivacyPolicy.NavigateUrl = sPrivacyPolicyURL
      'End If


      'If sWebSite = "" Then
      '  lnkViewFullSite.Visible = False
      'Else
      '  lnkViewFullSite.NavigateUrl = sWebSite
      'End If


      m_nodelist = Nothing
      m_node = Nothing
    End If
  End Sub

  'Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
  '  Page.Theme = Session("Theme")
  'End Sub
End Class