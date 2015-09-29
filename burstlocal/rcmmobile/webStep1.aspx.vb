Imports mRCMAPI
Imports System.Data
Imports System.Xml
Imports Telerik.Web.UI

'Imports System.Web.UI.MobileControls

Partial Class webStep1
  Inherits BasePage
  Dim sResponse As String
  Dim sSecureKeyCode As String
  Public oDateTimecl As New DateTimecl
  Dim sErrorCode As String = ""
  Dim sErrorMsg As String = ""
  Dim sErrorResponseCode As String = ""
  Dim sErrorResponse As String = ""
  Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI
  Private oSessioncl As New Sessioncl
  '''''''''''''''
  Private redirectURL As String = ""
  Private RequestPickupLocation As Integer = 0
  Private RequestDropoffLocation As Integer = 0
  Private RequestPickupDatetime, RequestDropOffDatetime As String
  Dim sWidth As String = "320"
  Dim sHeight As String = "480"

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    'If Session("ErrorMsg") = "RCMReference Key is not valid" Or Session("ErrorMsg") = "RCMReference Key cannot be blank." Or Session("ErrorMsg") = "Please enter a valid SecureKey." Then
    '  'Session("ErrorMsg") = ""
    '  Response.Redirect("WebStep1.aspx")
    'End If
    'Page.Theme = Session("Theme")
    '''' raddatetimepicker''
    'RadDateTimePickerPickUpDate.SelectedDate = Format(Date.Now, "dd-MMM-yyyy") & " 09:00"
    'RadDateTimePickerPickUpDate.MaxDate = Format(Date.Now.AddYears(5), "dd-MMM-yyyy")

    RadDatePickerPickUpDate.Culture = New Globalization.CultureInfo("en-US")
    RadDatePickerPickUpDate.Culture.DateTimeFormat.ShortDatePattern = "ddd,MMM-dd-yyyy"
    RadDatePickerPickUpDate.Culture.DateTimeFormat.DateSeparator = "-"
    RadDatePickerPickUpDate.SelectedDate = Format(Date.Now.AddDays(Numericcl.GetIntValue(System.Configuration.ConfigurationManager.AppSettings("DayAddedToDefaultPickupDate"))))
    RadDatePickerPickUpDate.MaxDate = Format(Date.Now.AddYears(2))
    RadDatePickerPickUpDate.MinDate = Format(Date.Now)

    RadTimePickerPickupTime.SelectedTime = TimeSpan.Parse(System.Configuration.ConfigurationManager.AppSettings("DefaultPickupTime"))
    RadTimePickerPickupTime.TimeView.Interval = New TimeSpan(0, 30, 0)
    'RadTimePickerPickupTime.DateInput.DisplayDateFormat = "hh:mm tt"
    RadTimePickerPickupTime.TimeView.TimeFormat = "hh:mm tt"
    RadTimePickerPickupTime.DateInput.DisplayDateFormat = "HH:mm"
    RadTimePickerPickupTime.TimeView.StartTime = TimeSpan.Parse("09:00")
    RadTimePickerPickupTime.TimeView.EndTime = TimeSpan.Parse("21:00")

    RadDatePickerDropOffDate.Culture = New Globalization.CultureInfo("en-US")
    RadDatePickerDropOffDate.Culture.DateTimeFormat.ShortDatePattern = "ddd,MMM-dd-yyyy"
    RadDatePickerDropOffDate.Culture.DateTimeFormat.DateSeparator = "-"
    RadDatePickerDropOffDate.SelectedDate = Format(Date.Now.AddDays(Numericcl.GetIntValue(System.Configuration.ConfigurationManager.AppSettings("DayAddedToDefaultDropoffDate"))))
    RadDatePickerDropOffDate.MaxDate = Format(Date.Now.AddYears(2))
    RadDatePickerDropOffDate.MinDate = Format(Date.Now)
    '
    'RadDatePickerDropOffDate

    RadTimePickerDropoffTime.SelectedTime = TimeSpan.Parse(System.Configuration.ConfigurationManager.AppSettings("DefaultPickupTime"))
    RadTimePickerDropoffTime.TimeView.Interval = New TimeSpan(0, 30, 0)
    'RadTimePickerDropoffTime.DateInput.DisplayDateFormat = "hh:mm tt"
    RadTimePickerDropoffTime.TimeView.TimeFormat = "hh:mm tt"
    RadTimePickerDropoffTime.DateInput.DisplayDateFormat = "HH:mm"

    RadTimePickerDropoffTime.TimeView.StartTime = TimeSpan.Parse("09:00")
    RadTimePickerDropoffTime.TimeView.EndTime = TimeSpan.Parse("21:00")

    '''' ///////////////////
    btnContinue.PostBackUrl = "~/webStep2.aspx" '?key=" & Server.UrlEncode("+vsv1BjQDUZfPcP9cQXYEA==")
    Session("ErrorMsg") = ""
    'Session("SecureKeyCode") = "P5DlaSNN3hl9KiVVic1igg=="'Secure20 
    'Session("SecureKeyCode") = "lfTPw/V3k9gFfZ8X5zCGBw==" 'DemoRCM on demoServer 
    'Session("SecureKeyCode") = "+vsv1BjQDUZfPcP9cQXYEA==" 'Dev Server  
    'StepTitle1.Style.Value = oSessioncl.bgThemeColor
    'btnArea.Style.Value = oSessioncl.bgThemeColor

    'If Session("ScreenResolution") Is Nothing Then
    '  ' Session variable is not set
    '  ' Redirect to the screen resolution detection script
    '  Response.Redirect("DetectscreenHeightWidth.aspx")
    'Else
    '  ' Session variable is set
    '  ' Display it on the page
    '  'screenresolution.Text = Session("ScreenResolution").ToString()
    '  Dim sScreenResolution As String = Session("ScreenResolution").ToString()
    '  Dim chSeparator As Char() = New Char() {"x"c}
    '  Dim colorList As String() = sScreenResolution.Split(chSeparator)
    '  sWidth = colorList(0)
    '  sHeight = colorList(1)
    'End If

    '''''''''''''''''''''''''''''
    If Page.IsPostBack = False Then
      'hdnSecureKey.Value = Server.UrlEncode("+vsv1BjQDUZfPcP9cQXYEA==")
      PopulateDetails()
    End If

    If Session("ErrorMsg") <> "" Then
      'btnContinue.Visible = False
      litErrorMessage.Visible = True
      ErrorDiv.Visible = True
      lblErrmsg.Visible = True
      litErrorMessage.Text = Session("ErrorMsg")
      Session("ErrorMsg") = ""
    End If
    '''''''''''''''''''''''''''''
    'Display Promocode and Category based on Web.config setting
    tr_Category.Visible = CBool(System.Configuration.ConfigurationManager.AppSettings("ShowCategory"))
    tr_PromoCode.Visible = CBool(System.Configuration.ConfigurationManager.AppSettings("ShowPromoCode"))
    tr_Age.Visible = CBool(System.Configuration.ConfigurationManager.AppSettings("ShowAge"))
    tr_DropoffTime.Visible = CBool(System.Configuration.ConfigurationManager.AppSettings("ShowTimePicker"))
    tr_PickupTime.Visible = CBool(System.Configuration.ConfigurationManager.AppSettings("ShowTimePicker"))
    'System.Configuration.ConfigurationManager.AppSettings("CompanyKey")
  End Sub




  Private Sub PopulateDetails()
    Dim ds As DataSet = WS_RCMClientAPI.requestVehicleCategoryLocations(System.Configuration.ConfigurationManager.AppSettings("CompanyKey"))
    sResponse = IOcl.GetXMLasStringFromDataSet(ds)
    Dim xDocResponse = New XmlDocument()
    'Load the Xml file
    xDocResponse.LoadXml(sResponse)

    Dim m_nodelist As XmlNodeList
    Dim m_node As XmlNode

    'Check the eror Element List
    m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/VehicleCategoryLocations")
    Dim count As Integer = xDocResponse.SelectNodes("/VehicleDetails/VehicleCategoryLocations").Count
    'Loop through the nodes
    For Each m_node In m_nodelist
      'Get the ErrorCode Element Value
      sErrorCode = m_node.ChildNodes.Item(0).InnerText
      'Get the ErrorMsg Element Value
      If count > 1 Then
        sErrorMsg = m_node.ChildNodes.Item(1).InnerText
      End If
    Next
    m_nodelist = Nothing
    m_node = Nothing

    If sErrorCode = "" And sErrorMsg = "" Then
      'Get the PickUp Location Element List
      m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/GetPickupLocation/PickupLocation")
      'Loop through the nodes
      Dim sSelectedPickUpLoc As String = ""
      Dim iCountLoc As Integer = 0
      Dim iSelectedLoc As Integer = 0
      For Each m_node In m_nodelist
        'Get the PickUp Location ID Element Value
        Dim iPickUpLocID As Integer = m_node.ChildNodes.Item(0).InnerText
        'Get the PickUp Location Name Element Value
        Dim sPickUpLocName As String = m_node.ChildNodes.Item(1).InnerText
        Dim btDefaultedPickUpLoc As Boolean = m_node.ChildNodes.Item(2).InnerText

        If btDefaultedPickUpLoc = True Then
          iSelectedLoc = iCountLoc
          sSelectedPickUpLoc = iPickUpLocID
        End If
        '<Defaulted>True</Defaulted>
        'add to dropDownList
        'combopickupLoc.Items.Add(New ListItem(sPickUpLocName.ToString, iPickUpLocID.ToString))
        '*** for burswoodcarrentals ---
		'If Left(sPickUpLocName, 1) = "*" Then
          'Dim myItem As New RadComboBoxItem
          'myItem.Text = sPickUpLocName.Substring(1).ToString
          'myItem.Value = iPickUpLocID.ToString
          ''Add it as the last item
          'combopickupLoc.Items.Add(myItem)
          'iCountLoc = iCountLoc + 1
        'End If

        Dim myItem As New RadComboBoxItem
        myItem.Text = sPickUpLocName.ToString
        myItem.Value = iPickUpLocID.ToString
        'Add it as the last item
        If Left(myItem.Text, 1) = "*" Then
          combopickupLoc.Items.Add(myItem)
          iCountLoc = iCountLoc + 1
        End If
      Next
      If sSelectedPickUpLoc <> "" Then
        txtPickupLocID.Value = iSelectedLoc
        combopickupLoc.SelectedValue = sSelectedPickUpLoc
      End If
      m_nodelist = Nothing
      m_node = Nothing

      'Get the Dropoff Location Element List
      m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/GetDropoffLocation/DropoffLocation")
      'Loop through the nodes
      Dim sSelectedDropoffLoc As String = ""
      Dim iCountDropoffLoc As Integer = 0
      Dim iSelectedDropoffLoc As Integer = 0

      For Each m_node In m_nodelist
        'Get the Dropoff Location ID Element Value
        Dim iDropoffLocationID As Integer = m_node.ChildNodes.Item(0).InnerText
        'Get the Dropoff Location Name Element Value
        Dim sDropoffLocationName As String = m_node.ChildNodes.Item(1).InnerText
        Dim btDefaultedDropoffLocation As Boolean = m_node.ChildNodes.Item(2).InnerText

        If btDefaultedDropoffLocation = True Then
          sSelectedDropoffLoc = iDropoffLocationID.ToString
          iSelectedDropoffLoc = iCountDropoffLoc
        End If
        'add to dropDownList
        'combodropoffLoc.Items.Add(New ListItem(sDropoffLocationName.ToString, iDropoffLocationID.ToString))
        Dim myItem As New RadComboBoxItem
        myItem.Text = sDropoffLocationName.ToString
        myItem.Value = iDropoffLocationID.ToString
        'Add it as the last item
        If Left(myItem.Text, 1) = "*" Then
          combodropoffLoc.Items.Add(myItem)
          iCountDropoffLoc = iCountDropoffLoc + 1
        End If
      Next
      If sSelecteddropoffLoc <> "" Then
        combodropoffLoc.SelectedValue = sSelectedDropoffLoc
        txtDropoffLocID.Value = iSelectedDropoffLoc
      End If
      m_nodelist = Nothing
      m_node = Nothing

      'Get Vechicle Category Type Element List
      m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/GetVechicleCategoryType/CategoryType")
      'Loop through the nodes
      For Each m_node In m_nodelist
        'Get the CategoryType ID Element Value
        Dim iCategoryTypeID As Integer = m_node.ChildNodes.Item(0).InnerText
        'Get the CategoryType Name Element Value
        Dim sCategoryTypeName As String = m_node.ChildNodes.Item(1).InnerText
        'add to dropDownList
        'combocategoryType.Items.Add(New ListItem(sCategoryTypeName.ToString, iCategoryTypeID.ToString))
        Dim myItem As New RadComboBoxItem
        myItem.Text = sCategoryTypeName.ToString
        myItem.Value = iCategoryTypeID.ToString
        'Add it as the last item
        combocategoryType.Items.Add(myItem)
      Next
      m_nodelist = Nothing
      m_node = Nothing

      'Get GetDriverAge Element List
      Dim sSelectedvalue As String = "0"

      Dim iCountAge As Integer = 0
      Dim iSelectedAge As Integer = 0

      m_nodelist = xDocResponse.SelectNodes("/VehicleDetails/GetDriverAge/DriverAge")
      'Loop through the nodes
      For Each m_node In m_nodelist
        'Get the DriverAge Element Value
        Dim iDriverAge As Integer = m_node.ChildNodes.Item(0).InnerText
        'Get the Defaulted DriverAge Element Value
        Dim btDriverAgeDefaulted As Boolean = m_node.ChildNodes.Item(1).InnerText
        'add to dropDownList
        'comboage.Items.Add(New ListItem(iDriverAge.ToString, iDriverAge.ToString))
        Dim myItem As New RadComboBoxItem
        myItem.Text = iDriverAge.ToString
        myItem.Value = iDriverAge.ToString
        'Add it as the last item
        comboage.Items.Add(myItem)
        If btDriverAgeDefaulted = True Then
          sSelectedvalue = iDriverAge.ToString
          iSelectedAge = iCountAge
        End If
        iCountAge = iCountAge + 1
      Next
      comboage.Sort = RadComboBoxSort.Descending
      Dim iTotalAge As Integer = comboage.Items.Count
      Dim sLastAge As String = comboage.Items(iTotalAge - 1).Value
      comboage.Items(iTotalAge - 1).Text = sLastAge & "+"
      'comboage.Items(iTotalAge - 1).Value = 100
      m_nodelist = Nothing
      m_node = Nothing
      txtAge.Value = iSelectedAge
      comboage.SelectedIndex = iSelectedAge
      'comboage.Text = sSelectedvalue
      txtCategoryType.Value = 0
      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
      '------------------- date part -----------------------------------------------------------------------------------
      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
      Dim sPickupDate As DateTime = Now()
      sPickupDate = sPickupDate.AddDays(5)

      oDateTimecl.PopulateDaysWithZero(1, combopickupday)
      If Numericcl.GetIntValue(Day(sPickupDate)) < 10 Then
        combopickupday.SelectedValue = Stringcl.AddZeroToString(Day(sPickupDate))
      Else
        combopickupday.SelectedValue = Day(sPickupDate)
      End If

      oDateTimecl.PopulateMonths(3, combopickupmnth)
      If Numericcl.GetIntValue(Month(sPickupDate)) < 10 Then
        combopickupmnth.SelectedValue = Stringcl.AddZeroToString(Month(sPickupDate))
      Else
        combopickupmnth.SelectedValue = Month(sPickupDate)
      End If

      oDateTimecl.PopulateYears(6, combopickupyr)
      combopickupyr.SelectedValue = Year(sPickupDate)

      Dim sReturnDate As DateTime = Now()
      sReturnDate = sReturnDate.AddDays(15)

      oDateTimecl.PopulateDaysWithZero(1, combodropoffday)
      If Numericcl.GetIntValue(Day(sReturnDate)) < 10 Then
        combodropoffday.SelectedValue = Stringcl.AddZeroToString(Day(sReturnDate))
      Else
        combodropoffday.SelectedValue = Day(sReturnDate)
      End If

      oDateTimecl.PopulateMonths(3, combodropoffmnth)
      If Numericcl.GetIntValue(Month(sReturnDate)) < 10 Then
        combodropoffmnth.SelectedValue = Stringcl.AddZeroToString(Month(sReturnDate))
      Else
        combodropoffmnth.SelectedValue = Month(sReturnDate)
      End If

      oDateTimecl.PopulateYears(6, combodropoffyr)
      combodropoffyr.SelectedValue = Year(sReturnDate)

      oDateTimecl.PopulateTime(combopickupTime)
      combopickupTime.SelectedValue = "09:00"
      'oDateTimecl.PopulateOfficeMinutes(ddlPickupTimeMinute, "00")

      oDateTimecl.PopulateTime(combodropoffTime)
      combodropoffTime.SelectedValue = "09:00"
      'oDateTimecl.PopulateOfficeMinutes(ddlReturnTimeMinute, "00")
      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
      '------------------- date part Ends ------------------------------------------------------------------------------
      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Else
      If sErrorCode = "" Then
        Session("ErrorMsg") = sErrorMsg
      Else
        Session("ErrorMsg") = sErrorCode
      End If
      'ErrorDiv.Visible = True
      'lblErrmsg.Visible = True
      'litErrorMessage.Text = Session("ErrorMsg")
    End If
  End Sub

  'Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
  '  Page.Theme = Session("Theme")
  'End Sub
End Class