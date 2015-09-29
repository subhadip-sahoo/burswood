Imports mRCMAPI
Imports System.Xml
Imports System.Data

Partial Class webStep2
  Inherits BasePage
  Dim sResponse As String
  Dim sSecureKeyCode As String
  Public oDateTimecl As New DateTimecl
  Dim sErrorCode As String = ""
  Dim sErrorMsg As String = ""
  Dim sErrorResponseCode As String = ""
  Dim sErrorResponse As String = ""
  Dim sReferenceKey As String = ""
  Dim sCurrency As String = ""
  Dim sCurrencySymbol As String = ConfigurationManager.AppSettings("CurrencySymbol")
  Dim sPickUpLocationName As String = ""
  Dim sPickUpLocationDateTime As String = ""
  Dim sDropOffLocationDateTime As String = ""
  Dim sDropOffLocationName As String = ""
  Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim postedValues As NameValueCollection = Request.Form
    If postedValues.Count = Nothing Then
      Response.Redirect("WebStep1.aspx")
    End If
    'hdnSecureKey
    Dim shdnSecureKey As String = postedValues("ctl00$MainContent$hdnSecureKey")
    Dim sPickUpLocation As String = GetRadComboBoxFormValue("ctl00_MainContent_combopickupLoc") 'postedValues("ctl00$MainContent$combopickupLoc")
    'Dim sPickupDay As String = postedValues("ctl00$MainContent$combopickupday")
    'Dim sPickupMonth As String = postedValues("ctl00$MainContent$combopickupmnth")
    'Dim sPickupYear As String = postedValues("ctl00$MainContent$combopickupyr")

    'PickUpDate
    'Dim sSelectedPickUpDate As String = postedValues("PickUpDate")
    'Dim sPickupDay As String = sSelectedPickUpDate.Split("/")(1)
    'Dim sPickupMonth As String = sSelectedPickUpDate.Split("/")(0)
    'Dim sPickupYear As String = sSelectedPickUpDate.Split("/")(2)
    Dim sPickupTime As String = ""
    If CBool(System.Configuration.ConfigurationManager.AppSettings("ShowTimePicker")) = True Then
      sPickupTime = postedValues("ctl00$MainContent$RadTimePickerPickupTime$dateInput").Split(" ")(0)
    Else
      sPickupTime = System.Configuration.ConfigurationManager.AppSettings("DefaultPickupTime")
    End If
    'postedValues("ctl00$MainContent$combopickupTime")

    Dim sReturnLocation As String = GetRadComboBoxFormValue("ctl00_MainContent_combodropoffLoc") 'postedValues("ctl00$MainContent$combodropoffLoc")
    'Dim sReturnDay As String = postedValues("ctl00$MainContent$combodropoffday")
    'Dim sReturnMonth As String = postedValues("ctl00$MainContent$combodropoffmnth")
    'Dim sReturnYear As String = postedValues("ctl00$MainContent$combodropoffyr")
    'DropOffDate
    'Dim sSelectedReturnDate As String = postedValues("DropOffDate")
    'Dim sReturnDay As String = sSelectedReturnDate.Split("/")(1)
    'Dim sReturnMonth As String = sSelectedReturnDate.Split("/")(0)
    'Dim sReturnYear As String = sSelectedReturnDate.Split("/")(2)
    Dim sReturnTime As String = ""
    If CBool(System.Configuration.ConfigurationManager.AppSettings("ShowTimePicker")) = True Then
      sReturnTime = postedValues("ctl00$MainContent$RadTimePickerDropoffTime$dateInput").Split(" ")(0)
    Else
      sReturnTime = System.Configuration.ConfigurationManager.AppSettings("DefaultDropoffTime")
    End If
    'postedValues("ctl00$MainContent$combodropoffTime")

    Dim sVehicletype As String = ""
    If CBool(System.Configuration.ConfigurationManager.AppSettings("ShowCategory")) = True Then
      sVehicletype = GetRadComboBoxFormValue("ctl00_MainContent_combocategoryType") 'postedValues("ctl00$MainContent$combocategoryType")
    Else
      sVehicletype = System.Configuration.ConfigurationManager.AppSettings("CategoryDefault")
    End If

    Dim sAgeofYoungestDriver As String = ""
    If CBool(System.Configuration.ConfigurationManager.AppSettings("ShowAge")) = True Then
      sAgeofYoungestDriver = GetRadComboBoxFormValue("ctl00_MainContent_comboage") 'postedValues("ctl00$MainContent$comboage")
    Else
      sAgeofYoungestDriver = System.Configuration.ConfigurationManager.AppSettings("AgeDefault")
    End If


    Dim sPromoCode As String = ""
    If CBool(System.Configuration.ConfigurationManager.AppSettings("ShowPromoCode")) = True Then
      sPromoCode = Left(Stringcl.GetValueTidyUpCode(postedValues("ctl00$MainContent$txtPromoCode")), 30)
    Else
      sPromoCode = "" 'System.Configuration.ConfigurationManager.AppSettings("AgeDefault")
    End If

    Dim sPickupDate As String = Convert.ToDateTime(postedValues("ctl00$MainContent$RadDatePickerPickUpDate")).ToString("MM/dd/yyyy")
    'sPickupMonth & "/" & sPickupDay & "/" & sPickupYear
    'Convert.ToDateTime(postedValues("ctl00$MainContent$RadDatePicker1")).ToString("ddMMM-yyyy")
    Dim sReturnDate As String = Convert.ToDateTime(postedValues("ctl00$MainContent$RadDatePickerDropOffDate")).ToString("MM/dd/yyyy")
    'sReturnMonth & "/" & sReturnDay & "/" & sReturnYear

    Dim sHtml As String = ""
    Dim sMobileHtml As String = ""
    Dim sHtmlSeason As String = ""
    Dim sHtmlMandatoryFees As String = ""
    Dim sPickUpDateNode As String = ""
    Dim sPickUpLocationNameNode As String = ""
    Dim sPickUpLocationIDNode As String = ""

    Dim sDropOffLocationIDNode As String = ""
    Dim sDropOffLocationNameNode As String = ""
    Dim sDropOffDateNode As String = ""

    Dim sSeasonName As String = ""
    Dim sNoOfDaysEachSeason As String = ""
    Dim sRateEachSeason As String = ""
    Dim sCostEachSeason As String = ""

    Dim m_nodelist As XmlNodeList
    Dim m_node As XmlNode

    If (IsPostBack <> True) Then
      'If Request.QueryString("Key") <> "" Then
      '  sSecureKeyCode = Request("Key")
      '  Session("SecureKeyCode") = sSecureKeyCode
      'End If
      'If shdnSecureKey <> "" Then
      'Session("SecureKeyCode") = shdnSecureKey
      'End If

      Dim ds As DataSet = WS_RCMClientAPI.requestVehicleAvailability(sPickUpLocation, sPickupDate, sPickupTime, sReturnLocation, sReturnDate, sReturnTime, _
                                                                     sAgeofYoungestDriver, sVehicletype, System.Configuration.ConfigurationManager.AppSettings("CompanyKey"), sPromoCode)
      sResponse = IOcl.GetXMLasStringFromDataSet(ds)
      Dim xDocResponse = New XmlDocument()
      'Load the Xml file
      xDocResponse.LoadXml(sResponse)
      'Response.Write(sResponse)

      Dim m_nodeSeasonlist As XmlNodeList
      Dim m_nodeSeason As XmlNode

      Dim m_nodeMandatoryFeeslist As XmlNodeList
      Dim m_nodeMandatoryFees As XmlNode


      'Check the eror Element List
      m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/Error")
      Dim iErrorcount As Integer = xDocResponse.SelectNodes("/VehicleDetails/Error").Count
      'Loop through the nodes
      For Each m_node In m_nodelist
        'Get the ErrorCode Element Value
        sErrorCode = m_node.ChildNodes.Item(0).InnerText
        'Get the ErrorMsg Element Value
        'If iErrorcount > 1 Then
        '  sErrorMsg = m_node.ChildNodes.Item(1).InnerText
        'End If
      Next
      m_nodelist = Nothing
      m_node = Nothing

      'Check the eror Element List
      m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/RequestVehicles/Error")
      Dim iErrorcount2 As Integer = xDocResponse.SelectNodes("/VehicleDetails/RequestVehicles/Error").Count
      'Loop through the nodes
      For Each m_node In m_nodelist
        'Get the ErrorCode Element Value
        sErrorCode = m_node.ChildNodes.Item(0).InnerText
        'Get the ErrorMsg Element Value
        If iErrorcount2 > 1 Then
          sErrorMsg = m_node.ChildNodes.Item(1).InnerText
        End If
      Next
      m_nodelist = Nothing
      m_node = Nothing

      'Check the eror Element List
      m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/ErrorDetails/Error")
      Dim iErrorcount3 As Integer = xDocResponse.SelectNodes("/VehicleDetails/ErrorDetails/Error").Count
      'Loop through the nodes
      For Each m_node In m_nodelist
        'Get the ErrorCode Element Value
        sErrorCode = m_node.ChildNodes.Item(0).InnerText
        'Get the ErrorMsg Element Value
        If iErrorcount2 > 1 Then
          sErrorMsg = m_node.ChildNodes.Item(1).InnerText
        End If
      Next
      m_nodelist = Nothing
      m_node = Nothing
      Dim sTotalDays As String = ""
      Session("ErrorMsg") = sErrorCode
      If sErrorCode = "" And sErrorMsg = "" Then
        sReferenceKey = xDocResponse.SelectSingleNode("VehicleDetails/RequestVehicles/ReferenceKey").InnerText
        Session("sReferenceKey") = sReferenceKey
        sTotalDays = xDocResponse.SelectSingleNode("VehicleDetails/RequestVehicles/TotalDays").InnerText
        sCurrency = xDocResponse.SelectSingleNode("VehicleDetails/RequestVehicles/Currency").InnerText
        sPickUpLocationName = xDocResponse.SelectSingleNode("VehicleDetails/RequestVehicles/PickUpDetails/LocationName").InnerText
        sPickUpLocationDateTime = xDocResponse.SelectSingleNode("VehicleDetails/RequestVehicles/PickUpDetails/Date").InnerText
        sDropOffLocationDateTime = xDocResponse.SelectSingleNode("VehicleDetails/RequestVehicles/DropOffDetails/Date").InnerText
        sDropOffLocationName = xDocResponse.SelectSingleNode("VehicleDetails/RequestVehicles/DropOffDetails/LocationName").InnerText

        lblPLoc.Text = sPickUpLocationName
        lblDLoc.Text = sDropOffLocationName
        lblPDateTime.Text = sPickUpLocationDateTime
        lblDDateTime.Text = sDropOffLocationDateTime
        step2header.TitleImage = "~/images/red_256.png"
        step2header.labelLeft = "Book a Vehicle"
        'step2header.labelRight = "Select Your Vehicle Type"
        m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/RequestVehicles/VehicleEachSeason")
        ''Loop through the nodes
        'ltrDisplayVehicleDetails.Text = ltrDisplayVehicleDetails.Text & "<tr>"
        Dim iCount As Integer = 0
        Dim i As Integer = 0
        Dim k As Integer = 0
        'sHtml = sHtml & "<table width='100%'>"
        '''''''''''''''''''*************************************
        Dim sHtmlNewDailyRate As String = ""
        sHtml = sHtml & "<table width='95%' align='center' cellspacing='0' cellpadding='0'  border='0'>"
        sHtml = sHtml & "<tr><td width='100%'>"
        '''''''''''''''''''*************************************
        For Each m_node In m_nodelist
          sHtmlSeason = ""
          sHtmlNewDailyRate = ""
          sHtmlMandatoryFees = ""
          'Get the Element Value
          Dim sCategoryType As String = m_node.SelectSingleNode("CategoryType").InnerText
          Dim sCategoryDesc As String = m_node.SelectSingleNode("CategoryDesc").InnerText
          Dim sCarImage As String = m_node.SelectSingleNode("CarImage").InnerText
          Dim sCarMobileImage As String = m_node.SelectSingleNode("CarImageMobile").InnerText
          'sCarImage = Replace(sCarImage, "http://202.191.55.45", "https://secure.rentalcarmanager.co.nz")
          Dim sVehicleDesc As String = m_node.SelectSingleNode("VehicleDesc").InnerText
          Dim sCategorySpecial As String = m_node.SelectSingleNode("CategorySpecial").InnerText
          Dim sTotalCost As String = m_node.SelectSingleNode("TotalCost").InnerText
          Dim sFixedDiscountName As String = m_node.SelectSingleNode("FixedDiscountName").InnerText
          Dim sFixedDiscountRate As String = m_node.SelectSingleNode("FixedDiscountRate").InnerText

          Dim sRateName As String = m_node.SelectSingleNode("RateName").InnerText
          Dim sLess1DayHireHourRate As String = m_node.SelectSingleNode("Less1DayHireHourRate").InnerText

          If (m_node.SelectSingleNode("MandatoryFees").Name) = "MandatoryFees" Then
            k = 11
          Else
            k = 10
          End If
          '' Mandatory fees part will be done later
          Dim sTotalEstimate As String = m_node.SelectSingleNode("TotalEstimate").InnerText
          Dim sGSTInclusive As String = m_node.SelectSingleNode("GSTInclusive").InnerText

          Dim sCarID As String = m_node.SelectSingleNode("CarID").InnerText
          Dim sCarAvailable As String = m_node.SelectSingleNode("CarAvailable").InnerText
          Dim sCarAvailableDesc As String = m_node.SelectSingleNode("CarAvailableDesc").InnerText

          Dim sNoSmallCase As String = m_node.SelectSingleNode("noCase").ChildNodes(0).InnerText
          Dim sNoLargeCase As String = m_node.SelectSingleNode("noCase").ChildNodes(1).InnerText

          Dim sNoChildren As String = m_node.SelectSingleNode("noPerson").ChildNodes(0).InnerText
          Dim sNoAdults As String = m_node.SelectSingleNode("noPerson").ChildNodes(1).InnerText


          sHtml = sHtml & "<table width='98%' align='center' border='0' cellpadding='0' cellspacing='3'>"
          sHtml = sHtml & "<tr align='center'><td colspan='2'>"
          sHtml = sHtml & "<table width='100%' class='Step2Table' cellpadding='3' cellspacing='0' border='0'>"
          'sHtml = sHtml & "<tr class='Step2TableTR'><td align='left' width='50%'>" & sCategoryDesc & "</td><td align='right' width='50%' class='formtextCap'>TOTAL " & sCurrencySymbol & " " & FormatNumber(sTotalEstimate, 2) & "</td></tr>"
          sHtml = sHtml & "<tr class='Step2TableTR'><td align='left' width='50%'>" & sCategoryDesc & "</td>"
          If sCarAvailable = "Available" Then
            sHtml = sHtml & "<td align='right' width='50%' class='formtextCap'>TOTAL " & sCurrencySymbol & " " & FormatNumber(sTotalEstimate, 2) & "</td>"
          Else
            sHtml = sHtml & "<td align='right' width='50%' class='formtextCap'>&nbsp;</td>"
          End If
          sHtml = sHtml & "</tr>"
          sHtml = sHtml & "<tr align='center'><td colspan='2'><img src='" & sCarMobileImage & "' alt='car' border='0' height='100' width='200' /></td></tr>"
          Dim dbDailyrate As Double = sTotalEstimate / IIf(sTotalDays <> "", CDbl(sTotalDays), 1)
          If sVehicleDesc <> "" Then
            sHtml = sHtml & "<tr><td class='formtext' colspan='2' align='left' bgcolor='#E5E5E5'><small>" & sVehicleDesc & "</small></td></tr>"
          End If
          If sCategorySpecial <> "" Then
            sHtml = sHtml & "<tr><td class='text' colspan='2' align='left' bgcolor='#E5E5E5'  ><small><font color='#E14900'>" & sCategorySpecial & "</font></small></td></tr>"
          End If

          sHtml = sHtml & "<tr><td colspan='2' bgcolor='#E5E5E5'><table width='100%' border='0' bgcolor='#E5E5E5' cellspacing='0' cellpadding='0'>"
          sHtml = sHtml & "<tr><td width='10%' align='left' valign='top' colspan='2'>"
          ''--left side table with images----
          sHtml = sHtml & "<table width='50%' align='left' border='0'  cellspacing='0' cellpadding='3' valign='top' ><tr>"
          If sNoSmallCase <> "" Then
            sHtml = sHtml & "<td class='formtext' valign='middle'><img src='./images/SmallCase.gif' alt='No. of Small Case'  border='0' align='center'/>x" & sNoSmallCase & "</td>"
          End If

          If sNoLargeCase <> "" Then
            sHtml = sHtml & "<td class='formtext' valign='middle'><img src='./images/LargeCase.gif' alt='No. of Large Case' border='0' align='center' />x" & sNoLargeCase & "</td>"
          End If

          If sNoChildren <> "" Then
            sHtml = sHtml & "<td class='formtext' valign='middle'><img src='./images/Children.gif' alt='No. of Children' border='0' align='center' />x" & sNoChildren & "</td>"
          End If

          If sNoAdults <> "" Then
            sHtml = sHtml & "<td class='formtext' valign='middle'><img src='./images/Adult.gif' alt='No. of Adults' border='0' align='center' />x" & sNoAdults & "</td>"
          End If
          sHtml = sHtml & "</tr></table>"
          sHtml = sHtml & "</td></tr>"

          If sCarAvailable <> "Not Available" Then
            If sRateEachSeason <> "No Rate Available" Then
              sHtmlNewDailyRate = sHtmlNewDailyRate & "<tr><td align='left' class='formtext' colspan='2'>" & sTotalDays & " Days @ " & sCurrencySymbol & "" & FormatNumber(dbDailyrate, 2) & "</td>"
            End If
          ElseIf sCarAvailable = "Not Available" And sCarAvailableDesc = "This vehicle is BOOKED OUT" Then
            If sRateEachSeason <> "No Rate Available" Then
              sHtmlNewDailyRate = sHtmlNewDailyRate & "<tr><td align='left' class='formtext' colspan='2'>" & sTotalDays & " Days @ " & sCurrencySymbol & "" & FormatNumber(dbDailyrate, 2) & "</td>"
            End If
          Else
            sHtmlNewDailyRate = sHtmlNewDailyRate & "<tr><td align='right' class='formtext' colspan='2'></td>"
          End If

          If sCarAvailable = "Limited Availability" Then 'Not Available
            sHtmlNewDailyRate = sHtmlNewDailyRate & "<td class='text'  colspan='2' align='right'><input type='button' name='LimitedAvailability' value='On Request' class='HeaderButtonStep2' onclick=""window.open('WebStep3.aspx?CarSizeID=" & sCarID & "','_self')"" /></td></tr>" '<img src='images/Onrequest.png'/>
          ElseIf sCarAvailable = "Available" Then 'Not Available
            sHtmlNewDailyRate = sHtmlNewDailyRate & "<td class='text'  colspan='2' align='right'><input type='button' onclick=""window.open('WebStep3.aspx?CarSizeID=" & sCarID & "','_self')"" name='Available' value='Book Now' class='HeaderButtonStep2' /></td></tr>"
          ElseIf sCarAvailable = "Not Available" And sCarAvailableDesc = "This vehicle is BOOKED OUT" Then
            sHtmlNewDailyRate = sHtmlNewDailyRate & "<td class='text'  colspan='2' align='right'><input type='button' name='BOOKEDOUT' value='Booked Out' class='HeaderButtonStep2' /></td></tr>"
          Else
            sHtmlNewDailyRate = sHtmlNewDailyRate & "<td class='formtext' colspan='2' align='right'>" & sCarAvailableDesc & "</td></tr>" 'No Rate Available
          End If
          
          '---table for the right side category desc, rate and booking button
          sHtml = sHtml & "<tr><td width='80%' align='right' valign='top'>"
          sHtml = sHtml & "<table height='100%' width='100%' align='right' border='0' cellspacing='0' cellpadding='3'>"
          sHtml = sHtml & sHtmlNewDailyRate
          sHtml = sHtml & "</table></td></tr>"
          '---end right side table

          If sCarAvailable = "Not Available" Then
            sCarAvailable = "Unavailable"
          End If
          m_nodeSeasonlist = Nothing
          m_nodeSeason = Nothing

          sHtml = sHtml & "</table>"
          sHtml = sHtml & "</td></tr></table>"
          sHtml = sHtml & "</td></tr></table>"
          '--left side table with images----
          iCount = iCount + 1
        Next
        sHtml = sHtml & "</td></tr></table>"
        sMobileHtml = sMobileHtml & "</td></tr></table>"
        ltrDisplayVehicleDetails.Text = sHtml
        m_nodelist = Nothing
        m_node = Nothing
        ''''''''''''''''''''''''''''''''''''''''''''''''''''
        '' Each Season Code Ends
        ''''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim DSconfirmSourceAndCompanyBrandName As DataSet = WS_RCMClientAPI.confirmSourceAndCompanyBrandName(System.Configuration.ConfigurationManager.AppSettings("CompanyUrlID"), System.Configuration.ConfigurationManager.AppSettings("ApiSource"), sReferenceKey)

        Dim sResponseconfirmSourceAndCompanyBrandName = IOcl.GetXMLasStringFromDataSet(DSconfirmSourceAndCompanyBrandName)
        Dim xDocResponseconfirmSourceAndCompanyBrandName = New XmlDocument()
        'Load the Xml file
        xDocResponseconfirmSourceAndCompanyBrandName.LoadXml(sResponseconfirmSourceAndCompanyBrandName)
        'Response.Write(sResponse)

        Dim m_nodelistconfirmSourceAndCompanyBrandName As XmlNodeList
        Dim m_nodeconfirmSourceAndCompanyBrandName As XmlNode


        'Check the eror Element List
        m_nodelistconfirmSourceAndCompanyBrandName = xDocResponseconfirmSourceAndCompanyBrandName.SelectNodes("/VehicleDetails/Error")
        Dim iErrorcountconfirmSourceAndCompanyBrandName As Integer = xDocResponseconfirmSourceAndCompanyBrandName.SelectNodes("/VehicleDetails/Error").Count
        'Loop through the nodes
        For Each m_nodeconfirmSourceAndCompanyBrandName In m_nodelistconfirmSourceAndCompanyBrandName
          'Get the ErrorCode Element Value
          sErrorCode = m_node.ChildNodes.Item(0).InnerText
          'Get the ErrorMsg Element Value
          'If iErrorcount > 1 Then
          '  sErrorMsg = m_node.ChildNodes.Item(1).InnerText
          'End If
        Next
        m_nodelistconfirmSourceAndCompanyBrandName = Nothing
        m_nodeconfirmSourceAndCompanyBrandName = Nothing



      Else
        lblReturn.Visible = False
        lblPickup.Visible = False
        litErrorMessage.Visible = True
        ErrorDiv.Visible = True
        lblErrmsg.Visible = True
        If sErrorCode <> "" Then
          litErrorMessage.Text = sErrorCode
        Else
          litErrorMessage.Text = sErrorMsg
        End If
        'Session("ErrorMsg") = ""
      End If
    End If

    If Session("ErrorMsg") = "RCMReference Key is not valid" Or Session("ErrorMsg") = "RCMReference Key cannot be blank." Or Session("ErrorMsg") = "Please enter a valid SecureKey." Then
      'Session("ErrorMsg") = ""
      Response.Redirect("WebStep1.aspx")
    End If
  End Sub
End Class
