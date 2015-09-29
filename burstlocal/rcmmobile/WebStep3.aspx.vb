Imports mRCMAPI
Imports System.Data
Imports System.Xml
Partial Class WebStep3
  Inherits BasePage
  Public oDateTimecl As New DateTimecl
  Private oSessioncl As New Sessioncl
  Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI
  Dim sResponse As String
  Dim sErrorCode As String = ""
  Dim sErrorMsg As String = ""
  Dim sCurrencySymbol As String = ConfigurationManager.AppSettings("CurrencySymbol")
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    'step3header.labelLeft = "Rental Summary"
    step3header.TitleImage = "~/images/file.png"
    LabelTextRateSummary.labelLeftText = "Rate Summary"
    LabelTextRateSummary.LabelImage = "~/images/file.png"

    If System.Configuration.ConfigurationManager.AppSettings("DisplayOptionalInsurance") <> "" And System.Configuration.ConfigurationManager.AppSettings("DisplayOptionalInsurance") = "True" Then
      LabelTextinsurance.labelLeftText = "Select Insurances (Optional)"
    Else
      LabelTextinsurance.labelLeftText = "Select Insurance"
    End If

    LabelTextinsurance.LabelImage = "~/images/file.png"

    If System.Configuration.ConfigurationManager.AppSettings("DisplayOptionalExtras") <> "" And System.Configuration.ConfigurationManager.AppSettings("DisplayOptionalExtras") = "True" Then
      LabelTextSelectExtras.labelLeftText = "Select Extras (Optional)"
    Else
      LabelTextSelectExtras.labelLeftText = "Select Extras"
    End If
    LabelTextSelectExtras.LabelImage = "~/images/file.png"

    If System.Configuration.ConfigurationManager.AppSettings("DisplayOptionalFree_KM") <> "" And System.Configuration.ConfigurationManager.AppSettings("DisplayOptionalFree_KM") = "True" Then
      LabelTextSelectFree_KM.labelLeftText = "Select Mileage (Optional)"
    Else
      LabelTextSelectFree_KM.labelLeftText = "Select Mileage"
    End If
    LabelTextSelectFree_KM.LabelImage = "~/images/file.png"


    'rateTitle.Style.Value = oSessioncl.bgThemeColor
    Dim sReferenceKey As String = ""
    Dim sCurrency As String = ""
    Dim sPickUpLocationName As String = ""
    Dim sPickUpLocationDateTime As String = ""
    Dim sDropOffLocationDateTime As String = ""
    Dim sDropOffLocationName As String = ""
    Dim sVehicletype As String = ""
    Dim sCarImageName As String = ""
    Dim sHtmlSeason As String = ""
    Dim sHtmlMandatoryFees As String = ""
    Dim sHtmlKmFeeExtra As String = ""
    Dim sHtmlDiscount As String = ""
    Dim sHtml As String = ""

    Dim iCarSizeID As Integer = Numericcl.GetIntValue(Request.QueryString("CarSizeID"))
    Dim ds As DataSet = WS_RCMClientAPI.confirmVehicleSelection(iCarSizeID, Session("sReferenceKey"))
    sResponse = IOcl.GetXMLasStringFromDataSet(ds)
    Dim xDocResponse = New XmlDocument()
    'Load the Xml file
    xDocResponse.LoadXml(sResponse)
    'Response.Write(sResponse)

    Dim m_nodelist As XmlNodeList
    Dim m_node As XmlNode

    Dim m_nodeSeasonlist As XmlNodeList
    Dim m_nodeSeason As XmlNode
    '<SeasonName>cheap season</SeasonName><NoOfDaysEachSeason>15</NoOfDaysEachSeason><NormalRate>65.00</NormalRate><Discount />
    '<DiscountType>Percentage</DiscountType><Rate>58.50</Rate><CostEachSeason>877.50</CostEachSeason>
    Dim sSeasonName As String = ""
    Dim sNoOfDaysEachSeason As String = ""
    Dim sNormalRate As String = ""
    Dim sDiscount As String = ""
    Dim sDiscountType As String = ""
    Dim sRateEachSeason As String = ""
    Dim sCostEachSeason As String = ""

    Dim m_nodeMandatoryFeeslist As XmlNodeList
    Dim m_nodeMandatoryFees As XmlNode

    'Check the eror Element List
    m_nodelist = xDocResponse.SelectNodes("/ConfirmVehicleDetails/ConfirmVehicles/Error")
    Dim iErrorcount As Integer = xDocResponse.SelectNodes("/ConfirmVehicleDetails/ConfirmVehicles/Error").Count
    'Loop through the nodes
    For Each m_node In m_nodelist
      'Get the ErrorCode Element Value
      sErrorCode = m_node.ChildNodes.Item(0).InnerText
    Next
    m_nodelist = Nothing
    m_node = Nothing
    '<ConfirmVehicleDetails><ErrorDetails><Error>Error:18. Please contact customer care in case you receive this error</Error></ErrorDetails></ConfirmVehicleDetails>
    'Check the eror Element List
    m_nodelist = xDocResponse.SelectNodes("ConfirmVehicleDetails/ErrorDetails/Error")
    'Loop through the nodes
    For Each m_node In m_nodelist
      'Get the ErrorCode Element Value
      sErrorCode = m_node.ChildNodes.Item(0).InnerText
    Next
    m_nodelist = Nothing
    m_node = Nothing
    If sErrorCode <> "" Then
      Session("ErrorMsg") = sErrorCode
    End If
    If sErrorCode = "" And sErrorMsg = "" Then
      Dim sresponse_BookingTotal As String = WS_RCMClientAPI.PopulateWebBookingTotal(Session("sReferenceKey"))
      sReferenceKey = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/ReferenceKey").InnerText
      sCurrency = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/Currency").InnerText
      sVehicletype = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/CarType").InnerText
      sCarImageName = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/CarImageName").InnerText
      sPickUpLocationName = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/PickUpDetails/LocationName").InnerText
      sPickUpLocationDateTime = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/PickUpDetails/Date").InnerText
      sDropOffLocationDateTime = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/DropOffDetails/Date").InnerText
      sDropOffLocationName = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/DropOffDetails/LocationName").InnerText
      sDropOffLocationName = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/DropOffDetails/LocationName").InnerText
      Dim sImageUrl As String = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/ImageUrl").InnerText

      Dim sCarImageNameMobile As String = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/CarImageNameMobile").InnerText
      Dim sImageUrlMobile As String = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/ImageUrlMobile").InnerText

      Dim sWebDesc As String = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/WebDesc").InnerText
      Dim sVehicleDesc As String = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/VehicleDesc").InnerText
      Dim sDaysForRate As String = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/DaysForRate").InnerText
      Dim sTotalEstimate As String = xDocResponse.SelectSingleNode("ConfirmVehicleDetails/ConfirmVehicles/TotalEstimate").InnerText

      lblPDateTime.Text = sPickUpLocationDateTime
      lblPLoc.Text = sPickUpLocationName
      lblDLoc.Text = sDropOffLocationName
      lblDDateTime.Text = sDropOffLocationDateTime
      lblVehicle.Text = sVehicletype
      imgCar.ImageUrl = sImageUrlMobile
      step3header.labelRight = sCurrency & sCurrencySymbol & " " & FormatNumber(sTotalEstimate, 2)

      'lblTotal.Text = sCurrency & sCurrencySymbol & " " & FormatNumber(sTotalEstimate, 2)

      '''''''''''*********************************************''''''''''''''''''''''''''''
      '' Each Season Code

      'Get the VehicleAvailable Element List
      m_nodelist = xDocResponse.SelectNodes("/ConfirmVehicleDetails/ConfirmVehicles")
      ''Loop through the nodes
      'ltrDisplayVehicleDetails.Text = ltrDisplayVehicleDetails.Text & "<tr>"
      Dim iCount As Integer = 0
      Dim i As Integer = 0
      'sHtml = sHtml & "<table width='100%'><tr>"

      For Each m_node In m_nodelist
        sHtmlSeason = ""
        sHtmlMandatoryFees = ""
        sHtmlDiscount = ""
        'Get the Element Value
        m_nodeSeasonlist = xDocResponse.GetElementsByTagName("Seasons")(iCount).ChildNodes
        sSeasonName = ""
        sNoOfDaysEachSeason = ""
        sRateEachSeason = ""
        ' ''Loop through the nodes
        Dim iSeasonCount As Integer = 0
        '<SeasonName>cheap season</SeasonName><NoOfDaysEachSeason>15</NoOfDaysEachSeason><NormalRate>65.00</NormalRate><Discount />
        '<DiscountType>Percentage</DiscountType><Rate>58.50</Rate><CostEachSeason>877.50</CostEachSeason>
        For Each m_nodeSeason In m_nodeSeasonlist
          iSeasonCount = iSeasonCount + 1
          sSeasonName = m_nodeSeason.SelectSingleNode("SeasonName").InnerText
          sNoOfDaysEachSeason = m_nodeSeason.SelectSingleNode("NoOfDaysEachSeason").InnerText
          sNormalRate = m_nodeSeason.SelectSingleNode("NormalRate").InnerText
          sDiscount = m_nodeSeason.SelectSingleNode("Discount").InnerText
          sDiscountType = m_nodeSeason.SelectSingleNode("DiscountType").InnerText
          sRateEachSeason = m_nodeSeason.SelectSingleNode("Rate").InnerText
          sCostEachSeason = m_nodeSeason.SelectSingleNode("CostEachSeason").InnerText
          '<td style='vertical-align:top;'><div class='DivNotFixedWidth'>" & sSeasonName & " </div></td>
          sHtmlSeason = sHtmlSeason & "<tr><td style='vertical-align:top;'><div>"
          If sDiscount = "" Then
            sHtmlSeason = sHtmlSeason & "" & sNoOfDaysEachSeason & " Days @ " & sCurrencySymbol & sRateEachSeason
          Else
            sHtmlSeason = sHtmlSeason & "" & sNoOfDaysEachSeason & " Days <br/>(with " & sDiscount & " on " & sCurrencySymbol & " " & sNormalRate & ") @ " & sCurrencySymbol & " " & sRateEachSeason
          End If
          'sHtmlSeason = sHtmlSeason & " = "
          sHtmlSeason = sHtmlSeason & "</div></td><td align='right' valign='top'>&nbsp;" & sCurrencySymbol & sCostEachSeason & "</td></tr>"
          'Exit For
        Next
        m_nodeSeasonlist = Nothing
        m_nodeSeason = Nothing

        'Get Vechicle MandatoryFees Element List
        m_nodeMandatoryFeeslist = xDocResponse.GetElementsByTagName("MandatoryFees")(iCount).ChildNodes
        'Loop through the nodes
        For Each m_nodeMandatoryFees In m_nodeMandatoryFeeslist
          'Get the MandatoryFees Name Element Value
          Dim sMandatoryFeesName As String = m_nodeMandatoryFees.ChildNodes.Item(0).InnerText
          'Get the CategoryType Name Element Value
          Dim sMandatoryFeesRate As String = m_nodeMandatoryFees.ChildNodes.Item(1).InnerText
          '"<tr><td align='left' colspan='1' style='padding-bottom:3px;' class='th_'><table border='1'><tr><td  class='th_'><pre class='wrapped'>" & sSeasonName & " mrinal is testing this for </pre></td><td>&nbsp;"
          sHtmlMandatoryFees = sHtmlMandatoryFees & "<tr><td align='left' class='text' colspan='1'><div class='DivNotFixedWidth'>" & sMandatoryFeesName & " </div></td><td align='right'  colspan='1' style='vertical-align:top;'> " & sCurrencySymbol & sMandatoryFeesRate & "</td></tr>"
        Next
        m_nodeMandatoryFeeslist = Nothing
        m_nodeMandatoryFees = Nothing
        '<tr><td valign='top' colspan='4'> <u>Charges Details</u> </td></tr>
        ltrSeasonText.Text = "<table border='0' width='100%'>"
        ltrSeasonText.Text = ltrSeasonText.Text & sHtmlSeason & sHtmlMandatoryFees
        ltrSeasonText.Text = ltrSeasonText.Text & "<tr><td align='right' class='text' colspan='1'>Total Estimate </td><td align='right'> " & sCurrencySymbol & sTotalEstimate & "</td></tr>"
        'ltrMandatoryTotal.Text = "<table><tr><td valign='top'> <u>Mandatory Details</u> </td></tr>" & sHtmlMandatoryFees & "</table>"
        ltrSeasonText.Text = ltrSeasonText.Text & "</table>"
        'sHtml = sHtml & sHtmlMandatoryFees
        'sHtml = sHtml & "<tr><td align='center' class='text' colspan='4'>(includes GST " & sCurrency & " " & sGSTInclusive & " )</td></tr>"
        m_nodeSeasonlist = Nothing
        m_nodeSeason = Nothing
        iCount = iCount + 1

      Next
      'sHtml = sHtml & "</table>"
      'ltrDisplayVehicleDetails.Text = sHtml '& "</table>"
      m_nodelist = Nothing
      m_node = Nothing

      Dim dsExtra As DataSet = WS_RCMClientAPI.requestExtras(Session("sReferenceKey"))
      Dim sExtraResponse = IOcl.GetXMLasStringFromDataSet(dsExtra)

      'Declaration
      Dim xExtraDocResponse = New XmlDocument()
      Dim m_ExtraNodeList As XmlNodeList
      Dim m_ExtraNode As XmlNode

      ''InsuranceExtra
      Dim sInsuranceExtraHtml As String = ""
      Dim m_InsuranceExtraNodeList As XmlNodeList
      Dim m_InsuranceExtraNode As XmlNode
      Dim sInsuranceExtraID As String = ""
      Dim sInsuranceExtraName As String = ""
      Dim sInsuranceExtraRate As String = ""
      Dim sInsuranceExtraType As String = ""
      Dim sInsuranceExtraChecked As String = ""
      Dim sInsuranceExtraDescription As String = ""
      Dim sCheckedYesNo As String = ""
      'InsuranceExtra Ends 

      ''ExtraFees
      Dim sExtraFeesHtml As String = ""
      Dim m_ExtraFeesNodeList As XmlNodeList
      Dim m_ExtraFeesNode As XmlNode
      Dim sExtraFeesID As String = ""
      Dim sExtraFeesName As String = ""
      Dim sExtraFeesRate As String = ""
      Dim sExtraFeesType As String = ""
      Dim sExtraFeesDescription As String = ""
      Dim sExtraFeesQTYApply As String = ""
      Dim sSelectedYesNo As String = ""
      Dim iExtraBoxCount As Integer = 1
      'ExtraFees Ends 

      ''KmFeeExtra
      Dim m_nodeKmFeeExtralist As XmlNodeList
      Dim m_nodeKmFeeExtra As XmlNode
      Dim sKmFeeExtraID As String = ""
      Dim sKmFeeExtraChecked As String = ""
      Dim sKmFeeExtraDailyRate As String = ""
      Dim sKmFeeExtraFreeKms As String = ""
      Dim sKmFeeExtraAdditionalKmsFee As String = ""
      Dim sKmFeeExtraMaxPrice As String = ""
      ''''''''''''''''''''''

      Dim sExtraErrorresponse As String = ""
      Dim sExtraReferenceKeyResponse As String = ""

      'Load the Xml file
      xExtraDocResponse.LoadXml(sExtraResponse)


      'Check the eror Element List
      m_ExtraNodeList = xExtraDocResponse.SelectNodes("/FeesExtraDetails/FeesExtra/Error")
      'Loop through the nodes
      For Each m_Extrasnode In m_ExtraNodeList
        'Get the ErrorCode Element Value
        sExtraErrorresponse = m_Extrasnode.ChildNodes.Item(0).InnerText
      Next
      m_ExtraNodeList = Nothing
      m_ExtraNode = Nothing

      'Check the eror Element List
      m_ExtraNodeList = xExtraDocResponse.SelectNodes("/FeesExtraDetails/ErrorDetails/Error")
      'Loop through the nodes
      For Each m_Extrasnode In m_ExtraNodeList
        'Get the ErrorCode Element Value
        sExtraErrorresponse = m_Extrasnode.ChildNodes.Item(0).InnerText
      Next
      m_ExtraNodeList = Nothing

      If sExtraErrorresponse = "" Then

        'Get the Extra Element List
        m_ExtraNodeList = xExtraDocResponse.SelectNodes("/FeesExtraDetails/FeesExtra")

        Dim iExtraCount As Integer = 0
        'Dim iExtra As Integer = 0
        Dim rbtnInsuranceItem As New ListItem
        For Each m_ExtraNode In m_ExtraNodeList
          sExtraReferenceKeyResponse = m_ExtraNode.ChildNodes.Item(0).InnerText

          m_InsuranceExtraNodeList = xExtraDocResponse.GetElementsByTagName("InsuranceExtra")(iExtraCount).ChildNodes
          sInsuranceExtraID = ""
          sInsuranceExtraName = ""
          sInsuranceExtraRate = ""
          sInsuranceExtraType = ""
          sInsuranceExtraChecked = ""
          sInsuranceExtraDescription = ""
          sInsuranceExtraHtml = ""
          ' ''Loop through the nodes
          For Each m_InsuranceExtraNode In m_InsuranceExtraNodeList
            sInsuranceExtraID = m_InsuranceExtraNode.ChildNodes.ItemOf(0).InnerText
            sInsuranceExtraName = m_InsuranceExtraNode.ChildNodes.ItemOf(1).InnerText
            sInsuranceExtraRate = m_InsuranceExtraNode.ChildNodes.ItemOf(2).InnerText
            sInsuranceExtraType = m_InsuranceExtraNode.ChildNodes.ItemOf(3).InnerText
            sInsuranceExtraChecked = m_InsuranceExtraNode.ChildNodes.ItemOf(4).InnerText
            sInsuranceExtraDescription = m_InsuranceExtraNode.ChildNodes.ItemOf(5).InnerText
            sCheckedYesNo = ""
            If sInsuranceExtraType = "Percentage" Then
              sInsuranceExtraType = "%"
            ElseIf sInsuranceExtraType = "Daily" Then
              sInsuranceExtraType = "Per Day"
            End If
            rbtnInsuranceItem = New ListItem(sInsuranceExtraName & "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @ " & sCurrencySymbol & FormatNumber(sInsuranceExtraRate, 2) & " " & sInsuranceExtraType, sInsuranceExtraID)
            'rbtnInsuranceItem.Selected = True
            Me.rbtnInsurance.Items.Add(rbtnInsuranceItem)
            If sInsuranceExtraChecked = True Then
              rbtnInsuranceItem.Selected = True
            End If
            'sInsuranceExtraHtml = sInsuranceExtraHtml & "<tr><td align='left' class='text'><input type='radio' " & sCheckedYesNo & " name='InsuranceID' Value='" & sInsuranceExtraID & "' />&nbsp;&nbsp;" & sInsuranceExtraName & " &nbsp;&nbsp;@ (" & sCurrency & ") " & FormatNumber(sInsuranceExtraRate, 2) & "</td></tr>"
            'Exit For
          Next
          If m_InsuranceExtraNodeList.Count = 0 Then
            Label_trInsurance.Visible = False
            tr_InsuranceBlank.Visible = False
          End If
          m_InsuranceExtraNodeList = Nothing
          m_InsuranceExtraNode = Nothing
          'ltrInsurance.Text = "<table BORDER='0' bgcolor='#FFFFFF' cellPadding='2'>" & sInsuranceExtraHtml & "</table>"

          ''''''''''''

          m_nodeKmFeeExtralist = xExtraDocResponse.GetElementsByTagName("KmFeeExtra")(iExtraCount).ChildNodes
          sHtmlKmFeeExtra = ""
          sKmFeeExtraID = ""
          sKmFeeExtraChecked = ""
          sKmFeeExtraDailyRate = ""
          sKmFeeExtraFreeKms = ""
          sKmFeeExtraAdditionalKmsFee = ""
          sKmFeeExtraMaxPrice = ""
          If m_nodeKmFeeExtralist.Count > 0 Then
            ' ''Loop through the nodes
            Dim rbtnKmFeeExtraItem As New ListItem
            For Each m_nodeKmFeeExtra In m_nodeKmFeeExtralist
              '<ID>811</ID><Checked>True</Checked><DailyRate /><FreeKms>Unlimited Kms</FreeKms><AdditionalKmsFee /><MaxPrice />
              '<ID>811</ID><DailyRate /><FreeKms>Unlimited Kms</FreeKms><AdditionalKmsFee /><MaxPrice /><Checked>True</Checked>
              sKmFeeExtraID = m_nodeKmFeeExtra.ChildNodes.ItemOf(0).InnerText
              If m_nodeKmFeeExtra.InnerXml.Contains("DailyRate") Then
                sKmFeeExtraDailyRate = Numericcl.GetDecimalValue(m_nodeKmFeeExtra.SelectSingleNode("DailyRate").InnerText)
              End If
              If m_nodeKmFeeExtra.InnerXml.Contains("Checked") Then
                sKmFeeExtraChecked = m_nodeKmFeeExtra.SelectSingleNode("Checked").InnerText
              End If
              'sKmFeeExtraDailyRate = m_nodeKmFeeExtra.ChildNodes.ItemOf(2).InnerText
              If m_nodeKmFeeExtra.InnerXml.Contains("FreeKms") Then
                sKmFeeExtraFreeKms = m_nodeKmFeeExtra.SelectSingleNode("FreeKms").InnerText
              End If
              '<AdditionalKmsFee>0.2000 per kms</AdditionalKmsFee>
              If m_nodeKmFeeExtra.InnerXml.Contains("AdditionalKmsFee") Then
                sKmFeeExtraAdditionalKmsFee = m_nodeKmFeeExtra.SelectSingleNode("AdditionalKmsFee").InnerText
              End If
              If m_nodeKmFeeExtra.InnerXml.Contains("MaxPrice") Then
                sKmFeeExtraMaxPrice = ", max charge $" & m_nodeKmFeeExtra.SelectSingleNode("MaxPrice").InnerText
              End If

              sCheckedYesNo = ""
              'If sKmFeeExtraChecked <> "" Then
              '  If sKmFeeExtraChecked = True Then
              '    sCheckedYesNo = "checked='checked'"
              '  End If
              'End If
              'sHtmlKmFeeExtra = sHtmlKmFeeExtra & "<tr><td align='left' colspan='2' class='text'><input type='radio' name='KmsFreeID' ID='KmsFreeID'  Value='" & sKmFeeExtraID & "' " & sCheckedYesNo & " />&nbsp;&nbsp;" & sKmFeeExtraFreeKms & " </td></tr>"
              'Exit For
              rbtnKmFeeExtraItem = New ListItem(sKmFeeExtraFreeKms & ",Additional " & sKmFeeExtraAdditionalKmsFee & sKmFeeExtraMaxPrice, sKmFeeExtraID)
              rbtnKmFeeExtra.Items.Add(rbtnKmFeeExtraItem)
              If sKmFeeExtraChecked = True Then
                rbtnKmFeeExtraItem.Selected = True
              End If
            Next
            'ltrKmFeeExtra.Text = "<table BORDER='0' bgcolor='#FFFFFF' cellPadding='2'>" & sHtmlKmFeeExtra & "</table>"
          Else
            tr_KmFeeExtra.Visible = False
            tr_KmFeeExtraBlank.Visible = False
          End If
          m_nodeKmFeeExtralist = Nothing
          m_nodeKmFeeExtra = Nothing

          '''''''''''' Area of Use ''''''''''''''''''''''''''''''''
          Dim AreaofUsedID As String = ""
          Dim AreaofUsedName As String = ""
          Dim AreaofUsedChecked As String = ""
          Dim sSelectedvalue As String = ""
          m_nodeKmFeeExtralist = xExtraDocResponse.GetElementsByTagName("AreaofUsed")(iExtraCount).ChildNodes
          AreaofUsedID = ""
          AreaofUsedName = ""
          AreaofUsedChecked = ""
          If m_nodeKmFeeExtralist.Count > 0 Then
            ' ''Loop through the nodes
            For Each m_nodeKmFeeExtra In m_nodeKmFeeExtralist
              AreaofUsedID = m_nodeKmFeeExtra.ChildNodes.ItemOf(0).InnerText
              AreaofUsedName = m_nodeKmFeeExtra.ChildNodes.ItemOf(1).InnerText
              AreaofUsedChecked = m_nodeKmFeeExtra.ChildNodes.ItemOf(2).InnerText
              sCheckedYesNo = ""
              'add to dropDownList
              ddlAreaOfUse.Items.Add(New ListItem(AreaofUsedName, AreaofUsedID))
              If AreaofUsedChecked = True Then
                sSelectedvalue = AreaofUsedID
              End If
            Next
            m_nodeKmFeeExtralist = Nothing
            m_nodeKmFeeExtra = Nothing
            ddlAreaOfUse.SelectedValue = sSelectedvalue
          Else
            tr_AreaOfUse.Visible = False
          End If
          '''''''''''' End Area of Use ''''''''''''''''''''''''''''''''
          m_ExtraFeesNodeList = xExtraDocResponse.GetElementsByTagName("ExtraFees")(iExtraCount).ChildNodes
          sExtraFeesID = ""
          sExtraFeesName = ""
          sExtraFeesRate = ""
          sExtraFeesType = ""
          sExtraFeesQTYApply = ""
          sExtraFeesDescription = ""
          'sExtraFeesHtml = "<tr><td>&nbsp;</td><td class='text'>&nbsp;<u>Description</u></td><td class='text'>&nbsp;<u>Price</u></td><td class='text'>&nbsp;<u>Quantity</u></td></tr>"
          ' ''Loop through the nodes
          For Each m_ExtraFeesNode In m_ExtraFeesNodeList
            sExtraFeesID = m_ExtraFeesNode.ChildNodes.ItemOf(0).InnerText
            sExtraFeesName = m_ExtraFeesNode.ChildNodes.ItemOf(1).InnerText
            sExtraFeesRate = m_ExtraFeesNode.ChildNodes.ItemOf(2).InnerText
            sExtraFeesType = m_ExtraFeesNode.ChildNodes.ItemOf(3).InnerText
            'Daily (Fixed)
            If InStr(sExtraFeesType, "Fixed") > 0 Then
              sExtraFeesType = "Fixed"
            ElseIf InStr(sExtraFeesType, "Daily") > 0 Then
              sExtraFeesType = "Per Day"
            ElseIf InStr(sExtraFeesType, "Percentage") > 0 Then
              sExtraFeesType = Replace(sExtraFeesType, "Percentage", "%")
            End If
            sExtraFeesDescription = m_ExtraFeesNode.ChildNodes.ItemOf(4).InnerText
            sExtraFeesQTYApply = m_ExtraFeesNode.ChildNodes.ItemOf(5).InnerText
            sExtraFeesHtml = sExtraFeesHtml & "<tr>"
            sExtraFeesHtml = sExtraFeesHtml & "<td class='text'>&nbsp;<input type='checkbox'  name='ExtraFeesID" & iExtraBoxCount & "' value='" & sExtraFeesID & "' />"
            sExtraFeesHtml = sExtraFeesHtml & "&nbsp;" & sExtraFeesName & "&nbsp;"
            If InStr(sExtraFeesType, "%") > 0 Then
              sExtraFeesHtml = sExtraFeesHtml & FormatNumber(sExtraFeesRate, 2)
            Else
              sExtraFeesHtml = sExtraFeesHtml & sCurrencySymbol & FormatNumber(sExtraFeesRate, 2) & "&nbsp;"
            End If

            'If sExtraFeesType = "Day" Then
            sExtraFeesHtml = sExtraFeesHtml & sExtraFeesType
            'End If
            '[<b>" & sExtraFeesType & "</b>]&nbsp;&nbsp;&nbsp;"
            If sExtraFeesQTYApply = "Yes" Then
              sExtraFeesHtml = sExtraFeesHtml & "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QTY required<input type='text' name='ExtraFeesQty" & iExtraBoxCount & "' size='2' value='1' onblur='checkNumeric(this);' /></td>"
            Else
              sExtraFeesHtml = sExtraFeesHtml & "&nbsp;&nbsp;</td>"
            End If
            sExtraFeesHtml = sExtraFeesHtml & "</tr>"
            'Exit For
            iExtraBoxCount = iExtraBoxCount + 1
          Next
          sExtraFeesHtml = sExtraFeesHtml & "<input type='hidden' id='txtTotalExtraFeesCount' name='txtTotalExtraFeesCount' size='2' value='" & iExtraBoxCount - 1 & "' />"
          If m_ExtraFeesNodeList.Count = 0 Then
            tr_ExtraFeeLabel.Visible = False
          End If
          m_ExtraFeesNodeList = Nothing
          m_ExtraFeesNode = Nothing
          ltrExtraFees.Text = "<table BORDER='0' cellPadding='2' class='DivNotFixedWidth'>" & sExtraFeesHtml & "</table>"
          '<tr><td>[D--><b>Daily</b>]&nbsp;&nbsp;[F--><b>Fixed</b>]</td></tr>

          ''''''''''''
          iExtraCount = iExtraCount + 1
        Next
        m_ExtraNodeList = Nothing
        m_ExtraNode = Nothing
      Else
        'tr_lblMsg.Visible = True
        'lblMsg.Visible = True
        Session("ErrorMsg") = sExtraErrorresponse
        'btnEmailMeQuote.Enabled = False
        'btnRequestBooking.Enabled = False
      End If
      ''''''''''''''''''''''''''******************************************.......................................................
    End If
    If Session("ErrorMsg") <> "" Then
      litErrorMessage.Visible = True
      ErrorDiv.Visible = True
      lblErrmsg.Visible = True
      litErrorMessage.Text = Session("ErrorMsg")
      If Session("ErrorMsg") = "RCMReference Key is not valid" Or Session("ErrorMsg") = "RCMReference Key cannot be blank." Then
        'Session("ErrorMsg") = ""
        Response.Redirect("WebStep1.aspx")
      End If
    End If
  End Sub
  Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
    Page.Theme = Session("Theme")
  End Sub
End Class
