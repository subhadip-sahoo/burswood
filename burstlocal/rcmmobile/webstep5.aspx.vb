﻿Imports mRCMAPI
Imports System.Data
Imports System.Xml
Partial Class webstep5
  Inherits BasePage
  Private oSessioncl As New Sessioncl
  Dim sCurrencySymbol As String = ConfigurationManager.AppSettings("CurrencySymbol")
  '  Private oLocationcl As New Locationcl
  '  Private oDateTimecl As New DateTimecl
  '  Private oBookingcl As New Bookingcl
  '  Private oCustomercl As New Customercl
  '  Dim CardNumber, CardDate, ccName, ccType, ccv, Quotation, ReservationTypeID, onlineType, MinDOB, CurrentExpDate As Object
  '  Dim DPS_PaymentAmount, Username, Password, DPSErrorMesage As Object
  '  Dim ExpiryDate, DPS_ReservationBufferNo, DPS_ReservationNo, DPS_MerchantReference, AmountInput, sXmlAction As Object
  '  Dim DPSstr As String = ""
  '  Dim objXMLhttp, objOutputXMLDoc, AuthorizedElement, strAuthorised, MerchantReferenceElement, strMerchantReference, CardHolderNameElement, strCardHolderName As Object
  '  Dim CardNumberElement, strCardNumber, DateExpiryElement, strDateExpiry, AmountElement, strPaymentAmount, CurrencyNameElement, strCurrencyName, DateSettlementElement As Object
  '  Dim strDateSettlement, DpsTxnRefElement, strDpsTxnRef, CardHolderResponseTextElement, strCardHolderResponseText, MerchantResponseTextElement, strMerchantResponseText As Object
  '  Dim PaymentDate, BillingLocationID, LoginId, BrandID, TotalCharges As Object

  ''''
  Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI
  Dim sErrorMsg As String = ""
  Dim m_nodelist As XmlNodeList
  Dim m_node As XmlNode
  Dim sAction As String = ""
  Dim sReferenceNo As String = ""
  Dim sReservationNo As String = ""

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    sAction = Request.QueryString("type")
    Dim postedValues As NameValueCollection = Request.Form
    If postedValues.Count = 0 Then
      Response.Redirect("Webstep1.aspx")
    End If
    If Page.IsPostBack = False Then

      'Dim ddlPrimaryDriverDOBMonth As String = postedValues("ctl00$MainContent$ddlPrimaryDriverDOBMonth")
      'Dim ddlPrimaryDriverDOBDay As String = postedValues("ctl00$MainContent$ddlPrimaryDriverDOBDay")
      'Dim ddlPrimaryDriverDOBYear As String = postedValues("ctl00$MainContent$ddlPrimaryDriverDOBYear")

      Dim txtCustomerFirstName As String = postedValues("ctl00$MainContent$txtCustomerFirstName")
      Dim txtCustomerLastName As String = postedValues("ctl00$MainContent$txtCustomerLastName")

      Dim txtPrimaryDriverLicenseNo As String = postedValues("ctl00$MainContent$txtPrimaryDriverLicenseNo")
      If txtPrimaryDriverLicenseNo Is Nothing Or txtPrimaryDriverLicenseNo = "" Then
        txtPrimaryDriverLicenseNo = "#allowblank#"
      End If
      Dim txtLicenseIssuedCountry As String = GetRadComboBoxFormValue("ctl00_MainContent_ddlLicenseIssuedCountry") 'postedValues("ctl00$MainContent$ddlLicenseIssuedCountry")
      If txtLicenseIssuedCountry Is Nothing Or txtLicenseIssuedCountry = "" Then
        txtLicenseIssuedCountry = "#allowblank#"
      End If
      'Dim ddlLicenseExpiryDateMonth As String = postedValues("ctl00$MainContent$ddlLicenseExpiryDateMonth")
      'Dim ddlLicenseExpiryDateDay As String = postedValues("ctl00$MainContent$ddlLicenseExpiryDateDay")
      'Dim ddlLicenseExpiryDateYear As String = postedValues("ctl00$MainContent$ddlLicenseExpiryDateYear")
      Dim txtAddress As String = postedValues("ctl00$MainContent$txtAddress")
      If txtAddress Is Nothing Or txtAddress = "" Then
        txtAddress = "#allowblank#"
      End If
      Dim txtCity As String = postedValues("ctl00$MainContent$txtCity")
      If txtCity Is Nothing Or txtCity = "" Then
        txtCity = "#allowblank#"
      End If
      Dim txtStateProvince As String = postedValues("ctl00$MainContent$txtStateProvince")
      If txtStateProvince Is Nothing Or txtStateProvince = "" Then
        txtStateProvince = "#allowblank#"
      End If
      Dim txtPostalCode As String = postedValues("ctl00$MainContent$txtPostalCode")
      If txtPostalCode Is Nothing Or txtPostalCode = "" Then
        txtPostalCode = "#allowblank#"
      End If
      Dim ddlCustomerCountryID As String = GetRadComboBoxFormValue("ctl00_MainContent_ddlCustomerCountryID") 'postedValues("ctl00$MainContent$ddlCustomerCountryID")
      If ddlCustomerCountryID Is Nothing Or ddlCustomerCountryID = "" Then
        ddlCustomerCountryID = "#allowblank#"
      End If
      Dim txtCustomerEmailID As String = postedValues("ctl00$MainContent$txtCustomerEmailID")
      Dim txtCustomerPhone As String = postedValues("ctl00$MainContent$txtCustomerPhone")
      If txtCustomerPhone Is Nothing Or txtCustomerPhone = "" Then
        txtCustomerPhone = "#allowblank#"
      End If
      Dim txtArrivalFlight As String = postedValues("ctl00$MainContent$txtArrivalFlight")

      Dim txtPickUpRequiredFrom As String = postedValues("ctl00$MainContent$txtPickUpRequiredFrom")
      Dim txtDropOffRequiredTo As String = postedValues("ctl00$MainContent$txtDropOffRequiredTo")
      Dim txtNoOfTravelling As String = postedValues("ctl00$MainContent$txtNoOfTravelling")
      Dim ddlCarTransmissionPreferenceID As String = postedValues("ctl00$MainContent$ddlCarTransmissionPreferenceID")

      Dim ddlRentalSourceID As String = GetRadComboBoxFormValue("ctl00_MainContent_ddlRentalSourceID") 'postedValues("ctl00$MainContent$ddlRentalSourceID")
      If ddlRentalSourceID Is Nothing Then ddlRentalSourceID = "0"
      Dim txtAdditionalDetails As String = postedValues("ctl00$MainContent$txtAdditionalDetails")

      Dim txtCcNumber As String = postedValues("ctl00$MainContent$txtCardNumber")
      Dim ddlCCType As String = postedValues("ctl00$MainContent$ddlCCType")
      Dim txtCCV As String = postedValues("ctl00$MainContent$txtCCV")
      Dim txtNameOnCard As String = postedValues("ctl00$MainContent$txtNameOnCard")
      Dim ddlExpiryDateMonth As String = postedValues("ctl00$MainContent$ddlExpiryDateMonth")
      If (ddlExpiryDateMonth) <> "" Then
        ddlExpiryDateMonth = IIf(ddlExpiryDateMonth < 10, "0" & ddlExpiryDateMonth, ddlExpiryDateMonth)
      End If
      Dim ddlExpiryDateYear As String = postedValues("ctl00$MainContent$ddlExpiryDateYear")

      Dim sResponseConfirmVehicleBookingQuote As String = ""

      Dim dtLicenseExpiry As DateTime = Now().AddYears(5)
      Dim dtDriverDob As DateTime = Now().AddYears(-30)
      Dim sPrimaryDriverDOB As String = ""
      If postedValues("ctl00$MainContent$datePrimaryDriverDOB") <> "" Then
        sPrimaryDriverDOB = Convert.ToDateTime(postedValues("ctl00$MainContent$datePrimaryDriverDOB")).ToString("MM/dd/yyyy")
      End If
      If sPrimaryDriverDOB = "" Then
        sPrimaryDriverDOB = "#allowblank#" 'DateTimecl.FormatDate(3, dtDriverDob)
      End If
      'ddlPrimaryDriverDOBMonth & "/" & ddlPrimaryDriverDOBDay & "/" & ddlPrimaryDriverDOBYear
      Dim sLicenseExpiryDate As String = ""
      If postedValues("ctl00$MainContent$dateLicenseExpiry") <> "" Then
        sLicenseExpiryDate = Convert.ToDateTime(postedValues("ctl00$MainContent$dateLicenseExpiry")).ToString("MM/dd/yyyy")
      End If
      If sLicenseExpiryDate = "" Then
        sLicenseExpiryDate = "#allowblank#" 'DateTimecl.FormatDate(3, dtLicenseExpiry)
      End If
      'ddlLicenseExpiryDateMonth & "/" & ddlLicenseExpiryDateDay & "/" & ddlLicenseExpiryDateYear
      Dim dsConfirmVehicleBookingQuote As DataSet = WS_RCMClientAPI.confirmVehicleBookingQuote(Stringcl.GetValueTidyUpCode(txtCustomerFirstName), _
                                                                                                Stringcl.GetValueTidyUpCode(txtCustomerLastName), _
                                                                                                sPrimaryDriverDOB, _
                                                                                                Stringcl.GetValueTidyUpCode(txtPrimaryDriverLicenseNo), _
                                                                                                Stringcl.GetValueTidyUpCode(txtLicenseIssuedCountry), _
                                                                                                sLicenseExpiryDate, _
                                                                                                Stringcl.GetValueTidyUpCode(txtAddress), _
                                                                                                Stringcl.GetValueTidyUpCode(txtCity), _
                                                                                                Stringcl.GetValueTidyUpCode(txtStateProvince), _
                                                                                                Stringcl.GetValueTidyUpCode(txtPostalCode), _
                                                                                                Stringcl.GetValueTidyUpCode(ddlCustomerCountryID), _
                                                                                                Stringcl.GetValueTidyUpCode(txtCustomerEmailID), _
                                                                                                Stringcl.GetValueTidyUpCode(txtCustomerPhone), _
                                                                                                Stringcl.GetValueTidyUpCode(txtArrivalFlight), _
                                                                                                Stringcl.GetValueTidyUpCode(txtPickUpRequiredFrom), _
                                                                                                Stringcl.GetValueTidyUpCode(txtDropOffRequiredTo), _
                                                                                                Stringcl.GetValueTidyUpCode(txtNoOfTravelling), _
                                                                                                Stringcl.GetValueTidyUpCode(ddlCarTransmissionPreferenceID), _
                                                                                                Stringcl.GetValueTidyUpCode(ddlRentalSourceID), _
                                                                                                Stringcl.GetValueTidyUpCode(txtAdditionalDetails), _
                                                                                                Stringcl.GetValueTidyUpCode(ddlCCType), _
                                                                                                Stringcl.GetValueTidyUpCode(txtCcNumber), _
                                                                                                Stringcl.GetValueTidyUpCode(txtCCV), _
                                                                                                Stringcl.GetValueTidyUpCode(txtNameOnCard), _
                                                                                                Stringcl.GetValueTidyUpCode(ddlExpiryDateMonth) & "/" & Stringcl.GetValueTidyUpCode(Right(ddlExpiryDateYear, 2)), _
                                                                                                Session("sReferenceKey"), _
                                                                                                sAction)
      sResponseConfirmVehicleBookingQuote = IOcl.GetXMLasStringFromDataSet(dsConfirmVehicleBookingQuote)
      Dim xConfirmVehicleBookingQuoteDocResponse = New XmlDocument()
      '    ''Load the Xml file
      xConfirmVehicleBookingQuoteDocResponse.LoadXml(sResponseConfirmVehicleBookingQuote)
      '<ConfirmBookingQuoteDetails><ErrorDetails><Error>Error:18. Please contact customer care in case you receive this error</Error></ErrorDetails></ConfirmBookingQuoteDetails>
      If sAction = "quote" Then
        'Check the eror Element List
        m_nodelist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/Error")
        'Loop through the nodes
        For Each m_node In m_nodelist
          'Get the ErrorCode Element Value
          sErrorMsg = m_node.ChildNodes.Item(0).InnerText
        Next
        m_nodelist = Nothing
        m_node = Nothing

        'Check the eror Element List
        '<ConfirmBookingQuoteDetails><ConfirmBooking><ReferenceKey /><Currency /><Error>No of person travelling cannot be blank</Error></ConfirmBooking></ConfirmBookingQuoteDetails>
        m_nodelist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/ConfirmQuote/Error")
        'Loop through the nodes
        For Each m_node In m_nodelist
          'Get the ErrorCode Element Value
          sErrorMsg = m_node.ChildNodes.Item(0).InnerText
        Next
        m_nodelist = Nothing
        '<ConfirmBookingQuoteDetails><ErrorDetails><Error>Error:18. Please contact customer care in case you receive this error</Error></ErrorDetails></ConfirmBookingQuoteDetails>
        'Check the eror Element List
        '<ConfirmBookingQuoteDetails><ConfirmBooking><ReferenceKey /><Currency /><Error>No of person travelling cannot be blank</Error></ConfirmBooking></ConfirmBookingQuoteDetails>
        m_nodelist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/ErrorDetails")
        'Loop through the nodes
        For Each m_node In m_nodelist
          'Get the ErrorCode Element Value
          sErrorMsg = m_node.ChildNodes.Item(0).InnerText
        Next
        m_nodelist = Nothing

        If sErrorMsg = "" Then
          'main_table.Visible = False
          'table_FinalResponse.Visible = True
          '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
          Dim sReferenceKey As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/ReferenceKey").InnerText
          Dim sCurrency As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/Currency").InnerText

          Dim sFlightArrival As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/FlightArrival").InnerText
          Dim sFlightDeparture As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/FlightDeparture").InnerText
          Dim sNoTravelling As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/NoTravelling").InnerText
          Dim sTotalEstimate As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/TotalEstimate").InnerText

          Dim sPickUpLocationName As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/PickUpDetails/LocationName").InnerText
          Dim sPickUpLocationDateTime As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/PickUpDetails/Date").InnerText

          Dim sDropOffLocationDateTime As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/DropOffDetails/Date").InnerText
          Dim sDropOffLocationName As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/DropOffDetails/LocationName").InnerText

          'lblPickupDateTime.Text = sPickUpLocationDateTime
          'lblPickUpLocation.Text = sPickUpLocationName
          'lblReturnLocation.Text = sDropOffLocationName
          'lblReturnDateTime.Text = sDropOffLocationDateTime

          Dim sVehicledetailsType As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/Vehicledetails/Type").InnerText
          Dim sVehicledetailsDescription As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/Vehicledetails/Description").InnerText
          Dim sVehicledetailsImageName As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/Vehicledetails/ImageName").InnerText
          Dim sVehicledetailsImagePath As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/Vehicledetails/ImagePath").InnerText

          Dim sVehicledetailsImageNameMobile As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/Vehicledetails/ImageNameMobile").InnerText
          Dim sVehicledetailsImagePathMobile As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/Vehicledetails/ImagePathMobile").InnerText

          Dim sHtmlDisplayVehicleDetails As String = ""
          sHtmlDisplayVehicleDetails = "<tr><th colspan='2' align='left'>&nbsp;<u>Vehicle Details</u></th></tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<td>&nbsp;" & sVehicledetailsType & "</td>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<td rowspan='2' align='right'>&nbsp;<img src='" & sVehicledetailsImagePathMobile & "' width='150' /></td>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "</tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<td>&nbsp;" & sVehicledetailsDescription & "</td>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "</tr>"
          'ltrDisplayVehicleDetails.Text = "<table BORDER='0' bgcolor='#FFFFFF' cellPadding=2 width='100%'>" & sHtmlDisplayVehicleDetails & "</table>"

          Dim sEachSeasonDays As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/EachSeason/Days").InnerText
          Dim sEachSeasonHours As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/EachSeason/Hours").InnerText
          Dim sEachSeasonRate As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/EachSeason/Rate").InnerText
          Dim sEachSeasonCost As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/EachSeason/Cost").InnerText

          Dim sHtmlEachSeason As String = ""
          sHtmlEachSeason = "<tr><th colspan='' align='left' class='formtext'>&nbsp;<u>Season Details</u></th></tr>"
          sHtmlEachSeason = sHtmlEachSeason & "<tr><td class='formtext'>" & sEachSeasonDays & " Days and " & IIf(sEachSeasonHours = "", 0, sEachSeasonHours) & " Hours @ " & " " & sCurrencySymbol & " " & sEachSeasonRate & " = " & sCurrencySymbol & " " & sEachSeasonCost & "</td></tr>"
          'ltrAllSeasonRates.Text = sHtmlEachSeason
          Dim sHtmlAllFeeDetails As String = ""
          ' For other fees
          Dim AllFeeDetailsName As String = ""
          Dim AllFeeDetailsType As String = ""
          Dim AllFeeDetailsRate As String = ""
          Dim AllFeeDetailsQty As String = ""
          Dim AllFeeDetailsDescription As String = ""
          Dim AllFeeDetailsCost As String = ""
          m_nodelist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/ConfirmQuote/AllFeeDetails/Details")
          sHtmlAllFeeDetails = "<tr><th colspan='6' align='left'>&nbsp;<u>Fee Details</u></th></tr>"
          sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<tr><td class='formtext'>&nbsp;<u>Name</u></td><td class='formtext'>&nbsp;<u>Type</u></td><td class='formtext'>&nbsp;<u>Price</u></td><td class='formtext'>&nbsp;<u>Quantity</u></td><td class='formtext'>&nbsp;<u>Description</u></td><td class='formtext'>&nbsp;<u>Cost</u></td></tr>"
          AllFeeDetailsName = ""
          AllFeeDetailsType = ""
          AllFeeDetailsRate = ""
          AllFeeDetailsQty = ""
          AllFeeDetailsDescription = ""
          AllFeeDetailsCost = ""
          For Each m_node In m_nodelist
            If m_node.HasChildNodes Then
              AllFeeDetailsName = m_node.ChildNodes.ItemOf(0).InnerText
              AllFeeDetailsType = m_node.ChildNodes.ItemOf(1).InnerText
              AllFeeDetailsRate = m_node.ChildNodes.ItemOf(2).InnerText
              AllFeeDetailsQty = m_node.ChildNodes.ItemOf(3).InnerText
              AllFeeDetailsDescription = m_node.ChildNodes.ItemOf(4).InnerText
              AllFeeDetailsCost = m_node.ChildNodes.ItemOf(5).InnerText

              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<tr>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsName & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsType & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td align='right'>&nbsp;" & AllFeeDetailsRate & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsQty & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsDescription & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td align='right'>&nbsp;" & AllFeeDetailsCost & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "</tr>"
            End If
          Next
          'ltrAllFeeDetails.Text = "<table BORDER='0' bgcolor='#FFFFFF' cellPadding=2 width='100%'>" & sHtmlAllFeeDetails & "</table>"


          '' Tax details 
          Dim m_nodeTaxDetailslist As XmlNodeList
          Dim m_nodeTaxDetails As XmlNode

          Dim TaxDetailsName As String = ""
          Dim TaxDetailsRate As String = ""
          Dim TaxDetailsInclusive As String = ""
          'Dim iCount As Integer = 0
          m_nodeTaxDetailslist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/ConfirmQuote/AllFeeDetails/TaxDetails")

          Dim sHtmlTaxDetails As String = ""
          sHtmlTaxDetails = "<tr><th colspan='3' align='left'>&nbsp;<u>Tax Details</u></th></tr>"
          sHtmlTaxDetails = sHtmlTaxDetails & "<tr><td class='formtext'>&nbsp;<u>Name</u></td><td class='formtext'>&nbsp;<u>Rate</u></td><td class='formtext' align='center'>&nbsp;<u>Inclusive</u></td></tr>"
          TaxDetailsName = ""
          TaxDetailsRate = ""
          TaxDetailsInclusive = ""

          For Each m_nodeTaxDetails In m_nodeTaxDetailslist
            If m_nodeTaxDetails.HasChildNodes Then
              For i = 0 To m_nodeTaxDetails.ChildNodes.Count - 1
                If m_nodeTaxDetails.ChildNodes.ItemOf(i).HasChildNodes Then
                  TaxDetailsName = m_nodeTaxDetails.ChildNodes.ItemOf(i).ChildNodes(0).InnerText
                  'm_nodeTaxDetails.ChildNodes.ItemOf(1).ChildNodes(0).innertext
                  TaxDetailsRate = m_nodeTaxDetails.ChildNodes.ItemOf(i).ChildNodes(1).InnerText
                  TaxDetailsInclusive = m_nodeTaxDetails.ChildNodes.ItemOf(i).ChildNodes(2).InnerText

                  sHtmlTaxDetails = sHtmlTaxDetails & "<tr>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "<td>&nbsp;" & TaxDetailsName & "</td>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "<td aligh='right'>&nbsp;" & TaxDetailsRate & "</td>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "<td align='center'>&nbsp;" & TaxDetailsInclusive & "</td>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "</tr>"
                End If
                'i = i + 1
              Next

            End If
            'iCount = iCount + 1
          Next
          '' Tax Details end 

          '<QuoteDetails><Prefix>BA</Prefix><ReservationNo>1300</ReservationNo><ReferenceNo>Q-BA1300</ReferenceNo><Summary>Thank you for your quote.</Summary></QuoteDetails>
          sReferenceNo = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/QuoteDetails/ReferenceNo").InnerText
          sReservationNo = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/QuoteDetails/ReservationNo").InnerText
          Dim sSummary As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmQuote/QuoteDetails/Summary").InnerText
          ltrBookSummary.Text = "<table><tr><td>Your " & sAction & " Reference No # <strong><font color='red'>" & sReferenceNo & "</font></strong>.</td></tr>"
          ltrBookSummary.Text = ltrBookSummary.Text & "<tr><td>" & sSummary & "</td></tr></table>"

          ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Else
          'tr_lblMsg.Visible = True
          'lblMsg.Visible = True
          'lblMsg.Text = sErrorMsg
          'submit.Enabled = False
          Session("ErrorMsg") = sErrorMsg
        End If
      End If

      If sAction = "booking" Then
        'Check the eror Element List
        m_nodelist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/CustomerConfirmVehicleBookingQuoteDetails/ConfirmVehicleBookingQuoteDetails/Error")
        'Loop through the nodes
        For Each m_node In m_nodelist
          'Get the ErrorCode Element Value
          sErrorMsg = m_node.ChildNodes.Item(0).InnerText
        Next
        m_nodelist = Nothing
        m_node = Nothing

        'Check the eror Element List
        '<ConfirmBookingQuoteDetails><ConfirmBooking><ReferenceKey /><Currency /><Error>No of person travelling cannot be blank</Error></ConfirmBooking></ConfirmBookingQuoteDetails>
        m_nodelist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/ConfirmBooking/Error")
        'Loop through the nodes
        For Each m_node In m_nodelist
          'Get the ErrorCode Element Value
          sErrorMsg = m_node.ChildNodes.Item(0).InnerText
        Next
        m_nodelist = Nothing

        m_node = Nothing
        If sErrorMsg = "" Then
          'main_table.Visible = False
          'table_FinalResponse.Visible = True

          Dim sReferenceKey As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/ReferenceKey").InnerText
          Dim sCurrency As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/Currency").InnerText

          Dim sFlightArrival As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/FlightArrival").InnerText
          Dim sFlightDeparture As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/FlightDeparture").InnerText
          Dim sNoTravelling As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/NoTravelling").InnerText
          Dim sTotalEstimate As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/TotalEstimate").InnerText

          Dim sPickUpLocationName As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/PickUpDetails/LocationName").InnerText
          Dim sPickUpLocationDateTime As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/PickUpDetails/Date").InnerText

          Dim sDropOffLocationDateTime As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/DropOffDetails/Date").InnerText
          Dim sDropOffLocationName As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/DropOffDetails/LocationName").InnerText

          'lblPickupDateTime.Text = sPickUpLocationDateTime
          'lblPickUpLocation.Text = sPickUpLocationName
          'lblReturnLocation.Text = sDropOffLocationName
          'lblReturnDateTime.Text = sDropOffLocationDateTime

          Dim sVehicledetailsType As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/Vehicledetails/Type").InnerText
          Dim sVehicledetailsDescription As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/Vehicledetails/Description").InnerText
          Dim sVehicledetailsImageName As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/Vehicledetails/ImageName").InnerText
          Dim sVehicledetailsImagePath As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/Vehicledetails/ImagePath").InnerText

          Dim sHtmlDisplayVehicleDetails As String = ""
          sHtmlDisplayVehicleDetails = "<tr><th colspan='2' align='left'>&nbsp;<u>Vehicle Details</u></th></tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<td>&nbsp;" & sVehicledetailsType & "</td>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<td rowspan='2' align='right'>&nbsp;<img src='" & sVehicledetailsImagePath & "' width='150' /></td>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "</tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<tr>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "<td>&nbsp;" & sVehicledetailsDescription & "</td>"
          sHtmlDisplayVehicleDetails = sHtmlDisplayVehicleDetails & "</tr>"
          'ltrDisplayVehicleDetails.Text = "<table BORDER='0' bgcolor='#FFFFFF' cellPadding=2 width='100%'>" & sHtmlDisplayVehicleDetails & "</table>"

          Dim sEachSeasonDays As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/EachSeason/Days").InnerText
          Dim sEachSeasonHours As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/EachSeason/Hours").InnerText
          Dim sEachSeasonRate As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/EachSeason/Rate").InnerText
          Dim sEachSeasonCost As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/EachSeason/Cost").InnerText

          Dim sHtmlEachSeason As String = ""
          sHtmlEachSeason = "<tr><th colspan='' align='left' class='formtext'>&nbsp;<u>Season Details</u></th></tr>"
          sHtmlEachSeason = sHtmlEachSeason & "<tr><td class='formtext'>" & sEachSeasonDays & " Days and " & IIf(sEachSeasonHours = "", 0, sEachSeasonHours) & " Hours @ " & " " & sCurrencySymbol & " " & sEachSeasonRate & " = " & sCurrencySymbol & " " & sEachSeasonCost & "</td></tr>"
          'ltrAllSeasonRates.Text = sHtmlEachSeason
          Dim sHtmlAllFeeDetails As String = ""
          ' For other fees
          Dim AllFeeDetailsName As String = ""
          Dim AllFeeDetailsType As String = ""
          Dim AllFeeDetailsRate As String = ""
          Dim AllFeeDetailsQty As String = ""
          Dim AllFeeDetailsDescription As String = ""
          Dim AllFeeDetailsCost As String = ""
          m_nodelist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/ConfirmBooking/AllFeeDetails/Details")
          sHtmlAllFeeDetails = "<tr><th colspan='6' align='left'>&nbsp;<u>Fee Details</u></th></tr>"
          sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<tr><td class='formtext'>&nbsp;<u>Name</u></td><td class='formtext'>&nbsp;<u>Type</u></td><td class='formtext'>&nbsp;<u>Price</u></td><td class='formtext'>&nbsp;<u>Quantity</u></td><td class='formtext'>&nbsp;<u>Description</u></td><td class='formtext'>&nbsp;<u>Cost</u></td></tr>"
          AllFeeDetailsName = ""
          AllFeeDetailsType = ""
          AllFeeDetailsRate = ""
          AllFeeDetailsQty = ""
          AllFeeDetailsDescription = ""
          AllFeeDetailsCost = ""
          For Each m_node In m_nodelist
            If m_node.HasChildNodes Then
              AllFeeDetailsName = m_node.ChildNodes.ItemOf(0).InnerText
              AllFeeDetailsType = m_node.ChildNodes.ItemOf(1).InnerText
              AllFeeDetailsRate = m_node.ChildNodes.ItemOf(2).InnerText
              AllFeeDetailsQty = m_node.ChildNodes.ItemOf(3).InnerText
              AllFeeDetailsDescription = m_node.ChildNodes.ItemOf(4).InnerText
              AllFeeDetailsCost = m_node.ChildNodes.ItemOf(5).InnerText

              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<tr>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsName & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsType & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td align='right'>&nbsp;" & AllFeeDetailsRate & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsQty & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td>&nbsp;" & AllFeeDetailsDescription & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "<td align='right'>&nbsp;" & AllFeeDetailsCost & "</td>"
              sHtmlAllFeeDetails = sHtmlAllFeeDetails & "</tr>"
            End If
          Next
          'ltrAllFeeDetails.Text = "<table BORDER='0' bgcolor='#FFFFFF' cellPadding=2 width='100%'>" & sHtmlAllFeeDetails & "</table>"


          '' Tax details 
          Dim m_nodeTaxDetailslist As XmlNodeList
          Dim m_nodeTaxDetails As XmlNode

          Dim TaxDetailsName As String = ""
          Dim TaxDetailsRate As String = ""
          Dim TaxDetailsInclusive As String = ""
          'Dim iCount As Integer = 0
          m_nodeTaxDetailslist = xConfirmVehicleBookingQuoteDocResponse.SelectNodes("/ConfirmBookingQuoteDetails/ConfirmBooking/AllFeeDetails/TaxDetails")

          Dim sHtmlTaxDetails As String = ""
          sHtmlTaxDetails = "<tr><th colspan='3' align='left'>&nbsp;<u>Tax Details</u></th></tr>"
          sHtmlTaxDetails = sHtmlTaxDetails & "<tr><td class='formtext'>&nbsp;<u>Name</u></td><td class='formtext'>&nbsp;<u>Rate</u></td><td class='formtext' align='center'>&nbsp;<u>Inclusive</u></td></tr>"
          TaxDetailsName = ""
          TaxDetailsRate = ""
          TaxDetailsInclusive = ""

          For Each m_nodeTaxDetails In m_nodeTaxDetailslist
            If m_nodeTaxDetails.HasChildNodes Then
              For i = 0 To m_nodeTaxDetails.ChildNodes.Count - 1
                If m_nodeTaxDetails.ChildNodes.ItemOf(i).HasChildNodes Then
                  TaxDetailsName = m_nodeTaxDetails.ChildNodes.ItemOf(i).ChildNodes(0).InnerText
                  'm_nodeTaxDetails.ChildNodes.ItemOf(1).ChildNodes(0).innertext
                  TaxDetailsRate = m_nodeTaxDetails.ChildNodes.ItemOf(i).ChildNodes(1).InnerText
                  TaxDetailsInclusive = m_nodeTaxDetails.ChildNodes.ItemOf(i).ChildNodes(2).InnerText

                  sHtmlTaxDetails = sHtmlTaxDetails & "<tr>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "<td>&nbsp;" & TaxDetailsName & "</td>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "<td aligh='right'>&nbsp;" & TaxDetailsRate & "</td>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "<td align='center'>&nbsp;" & TaxDetailsInclusive & "</td>"
                  sHtmlTaxDetails = sHtmlTaxDetails & "</tr>"
                End If
                'i = i + 1
              Next

            End If
            'iCount = iCount + 1
          Next
          '' Tax Details end 
          sReferenceNo = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/BookingDetails/ReferenceNo").InnerText
          sReservationNo = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/BookingDetails/ReservationNo").InnerText
          Dim sSummary As String = xConfirmVehicleBookingQuoteDocResponse.SelectSingleNode("ConfirmBookingQuoteDetails/ConfirmBooking/BookingDetails/Summary").InnerText
          '<td class='formtext'><u>Booking Details</u></td>
          ltrBookSummary.Text = "<table><tr><td>Your " & sAction & " Reference No # <font color='red'><strong>" & sReferenceNo & "</strong></font>.</td></tr>"
          ltrBookSummary.Text = ltrBookSummary.Text & "<tr><td>" & sSummary & "</td></tr></table>"
        Else
          'tr_lblMsg.Visible = True
          'lblMsg.Visible = True
          'lblMsg.Text = sErrorMsg
          'submit.Enabled = False
          Session("ErrorMsg") = sErrorMsg
        End If
      End If
      'ConfirmVehicleBookingQuote Area Ends ---
      'HttpContext.Current.Session("DBName") = EasyDBcl.GetDBName(System.Configuration.ConfigurationManager.AppSettings("CompanyKey"))
      Dim sCompanyKey = System.Configuration.ConfigurationManager.AppSettings("CompanyKey")
      Dim sUrl As String = HttpContext.Current.Request.Url.AbsolutePath.ToString().Replace("webstep5.aspx", "") & "emailBooking.asp?BookQuoteRefNo=" & sReservationNo
      Dim sRedctUlr = "/ccvault/WebstepsVault.aspx?ReservationNo=" & sReservationNo & "&CompanyKey=" & sCompanyKey & "&RedirectUrl=" & sUrl
      If sReservationNo <> "" Then
        If System.Configuration.ConfigurationManager.AppSettings("CreditCardMadatory") <> "" And System.Configuration.ConfigurationManager.AppSettings("CreditCardMadatory") = "True" And sAction <> "quote" Then
          Response.Redirect(sRedctUlr)
        Else
          Response.Redirect("emailBooking.asp?BookQuoteRefNo=" & sReservationNo)
        End If
      End If

    End If
    btnBookAnother.Visible = True

    If Session("ErrorMsg") <> "" Then
      litErrorMessage.Visible = True
      ErrorDiv.Visible = True
      lblErrmsg.Visible = True
      litErrorMessage.Text = Session("ErrorMsg")
      'HyperLink2.Visible = True
      'lnkback.Visible = True
      btnBookAnother.Visible = False
      Session("ErrorMsg") = ""
    End If
  End Sub
  'Protected Sub fbtnHome_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles fbtnHome.Click
  '  Response.Redirect("webStep1.aspx")
  'End Sub
  'Protected Sub hbtnHome_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles hbtnHome.Click
  '  Response.Redirect("webStep1.aspx")
  'End Sub

  Shared Function ExtractNumbers(ByVal expr As String) As String
    Return String.Join(Nothing, System.Text.RegularExpressions.Regex.Split(expr, "[^\d]"))
  End Function
  Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
    Page.Theme = Session("Theme")
  End Sub
End Class
