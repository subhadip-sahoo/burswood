Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Globalization
Imports Telerik.Web.UI

Namespace mRCMAPI
  ''' <summary>
  ''' Summary description for clUtilsDateTime
  ''' </summary>
  Public Class DateTimecl
    Private m_sSQL As String = ""

    Public Sub New()
    End Sub

    Public Sub PopulateDays(ByVal iType As Integer, ByRef ddlValue As DropDownList)
      ddlValue.Items.Clear()
      If iType = 1 Then
        'ddlValue.Items.Add(New ListItem("Day", "0"))
        For iCtr As Integer = 1 To 31
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 2 Then
        For iCtr As Integer = 1 To 31
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), ConcatZero(iCtr.ToString(), 2)))
        Next
      ElseIf iType = 3 Then
        ddlValue.Items.Add(New ListItem("Day", ""))
        For iCtr As Integer = 1 To 31
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), ConcatZero(iCtr.ToString(), 2)))
        Next
      End If
    End Sub

    '! \brief   Function to PopulateWeekDay
    '   *  \details Function is PopulateWeekDay, Week Day name
    '   *  \retval  Dropdown list with week days
    '   

    Public Sub PopulateWeekDay(ByRef ddlValue As DropDownList)
      ddlValue.Items.Clear()
      ddlValue.Items.Add(New ListItem("Please select", ""))
      ddlValue.Items.Add(New ListItem("Sunday", "1"))
      ddlValue.Items.Add(New ListItem("Monday", "2"))
      ddlValue.Items.Add(New ListItem("Tuesday", "3"))
      ddlValue.Items.Add(New ListItem("Wednesday", "4"))
      ddlValue.Items.Add(New ListItem("Thursday", "5"))
      ddlValue.Items.Add(New ListItem("Friday", "6"))
      ddlValue.Items.Add(New ListItem("Saturday", "7"))
    End Sub

    '! \brief   Function to PopulateWeekDay
    '   *  \details Function is PopulateWeekDay, Week Day name
    '   *  \retval  Dropdown list with week days
    '   

    Public Sub PopulateWeekDay(ByVal iType As Integer, ByRef ddlValue As DropDownList)
      ddlValue.Items.Clear()
      If iType = 1 Then
        ddlValue.Items.Add(New ListItem("All Days", "0"))
        ddlValue.Items.Add(New ListItem("Sunday", "1"))
        ddlValue.Items.Add(New ListItem("Monday", "2"))
        ddlValue.Items.Add(New ListItem("Tuesday", "3"))
        ddlValue.Items.Add(New ListItem("Wednesday", "4"))
        ddlValue.Items.Add(New ListItem("Thursday", "5"))
        ddlValue.Items.Add(New ListItem("Friday", "6"))
        ddlValue.Items.Add(New ListItem("Saturday", "7"))
      End If
    End Sub

    Public Sub PopulateMonths(ByVal iType As Integer, ByRef ddlValue As DropDownList)
      ddlValue.Items.Clear()
      If iType = 1 Then
        'ddlValue.Items.Add(New ListItem("Month", "0"))
        ddlValue.Items.Add(New ListItem("Jan", "1"))
        ddlValue.Items.Add(New ListItem("Feb", "2"))
        ddlValue.Items.Add(New ListItem("Mar", "3"))
        ddlValue.Items.Add(New ListItem("Apr", "4"))
        ddlValue.Items.Add(New ListItem("May", "5"))
        ddlValue.Items.Add(New ListItem("Jun", "6"))
        ddlValue.Items.Add(New ListItem("Jul", "7"))
        ddlValue.Items.Add(New ListItem("Aug", "8"))
        ddlValue.Items.Add(New ListItem("Sep", "9"))
        ddlValue.Items.Add(New ListItem("Oct", "10"))
        ddlValue.Items.Add(New ListItem("Nov", "11"))
        ddlValue.Items.Add(New ListItem("Dec", "12"))
      ElseIf iType = 2 Then
        ddlValue.Items.Add(New ListItem("Month", "0"))
        For iCtr As Integer = 1 To 12
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 3 Then
        For iCtr As Integer = 1 To 12
          ddlValue.Items.Add(New ListItem(Left(MonthName(iCtr), 3), ConcatZero(iCtr.ToString(), 2)))
        Next
      ElseIf iType = 4 Then
        ddlValue.Items.Add(New ListItem("Month", ""))
        For iCtr As Integer = 1 To 12
          ddlValue.Items.Add(New ListItem(Left(MonthName(iCtr), 3), ConcatZero(iCtr.ToString(), 2)))
        Next
      End If
    End Sub

    '! \brief   Function to PopulateOfficeHours
    '   *  \details Function is PopulateOfficeHours, Office Hours
    '   *  \retval  Dropdown list with Office Hours
    '   

    Public Sub PopulateOfficeHours(ByRef ddlValue As DropDownList, ByVal sSelectedValue As String)
      'Dim sOfficehour As String = "09"
      ddlValue.Items.Clear()
      For iCtr As Integer = 0 To 23
        If iCtr < 10 Then
          ddlValue.Items.Add(New ListItem(Stringcl.AddZeroToString(iCtr.ToString()), Stringcl.AddZeroToString(iCtr.ToString())))
        Else
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        End If
        ddlValue.SelectedValue = sSelectedValue
      Next
    End Sub

    '! \brief   Function to PopulateOfficeHours
    '   *  \details Function is PopulateOfficeHours, Office Hours
    '   *  \retval  Dropdown list with Office Hours
    '   

    Public Sub PopulateOfficeHours(ByVal iType As Integer, ByRef ddlValue As DropDownList, ByVal sSelectedValue As String)
      'Dim sOfficehour As String = "09"
      ddlValue.Items.Clear()
      If iType = 1 Then
        ddlValue.Items.Add(New ListItem("--", ""))
        For iCtr As Integer = 10 To 18
          'If iCtr < 10 Then
          'ddlValue.Items.Add(New ListItem(Stringcl.AddZeroToString(iCtr.ToString()), Stringcl.AddZeroToString(iCtr.ToString())))
          'Else
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
          'End If
          ddlValue.SelectedValue = sSelectedValue
        Next
      End If
    End Sub

    '! \brief   Function to PopulateOfficeMinutes
    '   *  \details Function is PopulateOfficeMinutes, Office Minutes
    '   *  \retval  Dropdown list with Office Minutes
    '   

    Public Sub PopulateOfficeMinutes(ByRef ddlValue As DropDownList, ByVal sSelectedValue As String)
      Dim iOfficeMinute As Integer = 0
      ddlValue.Items.Clear()
      For iCtr As Integer = 0 To 11
        iOfficeMinute = iCtr * 5
        If iOfficeMinute < 10 Then
          ddlValue.Items.Add(New ListItem(Stringcl.AddZeroToString(iOfficeMinute.ToString()), Stringcl.AddZeroToString(iOfficeMinute.ToString())))
        Else
          ddlValue.Items.Add(New ListItem(iOfficeMinute.ToString(), iOfficeMinute.ToString()))
        End If
        ddlValue.SelectedValue = sSelectedValue
      Next
    End Sub

    '! \brief   Function to PopulateOfficeMinutes
    '   *  \details Function is PopulateOfficeMinutes, Office Minutes
    '   *  \retval  Dropdown list with Office Minutes
    '   

    Public Sub PopulateOfficeMinutes(ByVal iType As Integer, ByRef ddlValue As DropDownList, ByVal sSelectedValue As String)
      Dim iOfficeMinute As Integer = 0
      ddlValue.Items.Clear()
      ddlValue.Items.Add(New ListItem("--", ""))
      If iType = 1 Then
        For iCtr As Integer = 0 To 11
          iOfficeMinute = iCtr * 5
          If iOfficeMinute < 10 Then
            ddlValue.Items.Add(New ListItem(Stringcl.AddZeroToString(iOfficeMinute.ToString()), Stringcl.AddZeroToString(iOfficeMinute.ToString())))
          Else
            ddlValue.Items.Add(New ListItem(iOfficeMinute.ToString(), iOfficeMinute.ToString()))
          End If
          ddlValue.SelectedValue = sSelectedValue
        Next
      End If
    End Sub

    '! \breif     Function to get month.
    '   *  \details   Function to get month name.
    '   *  \param[in] iType passes int value.
    '   *  \param[in] iMonth passes int value to get month.
    '   

    Public Shared Function GetMonthName(ByVal iType As Integer, ByVal iMonth As Integer) As String
      Dim sMonthName As String = ""
      If iType = 1 Then
        sMonthName = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(iMonth)
      End If
      Return sMonthName
    End Function
    '! \breif     Function to get WeekDay Name.
    '   *  \details   Function to get WeekDay Name.
    '   *  \param[in] iType passes int value.
    '   *  \param[in] iMonth passes int value to get WeekDay Name.
    '   

    Public Shared Function GetWeekDayName1(ByVal iType As Integer, ByVal iWeekDay As Integer) As String
      Dim sMonthName As String = ""
      If iType = 1 Then
        sMonthName = WeekdayName(iWeekDay, False, Microsoft.VisualBasic.FirstDayOfWeek.Monday)
      End If
      Return sMonthName
    End Function

    Public Shared Function GetWeekDayName(ByVal iType As Integer, ByVal iWeekDay As Integer) As String
      Dim sWeekDayName As String = ""
      If iType = 1 Then
        sWeekDayName = WeekdayName(iWeekDay, False, Microsoft.VisualBasic.FirstDayOfWeek.Sunday)
      End If
      Return sWeekDayName
    End Function


    Public Sub PopulateYears(ByVal iType As Integer, ByRef ddlValue As DropDownList)
      ddlValue.Items.Clear()
      Dim iYear As Integer = DateTime.Today.Year
      If iType = 1 Then
        ddlValue.Items.Add(New ListItem("Year", "0"))
        For iCtr As Integer = iYear To 1900 Step -1
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 2 Then
        ddlValue.Items.Add(New ListItem("Year", "0"))
        For iCtr As Integer = iYear To iYear + 20
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 3 Then
        ddlValue.Items.Add(New ListItem("Year", "0"))
        For iCtr As Integer = iYear To iYear + 10
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 4 Then
        ddlValue.Items.Add(New ListItem("Year", "0"))
        For iCtr As Integer = iYear + 5 To 1900 Step -1
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 5 Then
        ddlValue.Items.Add(New ListItem("Year", "0"))
        For iCtr As Integer = 2009 To iYear + 1
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 6 Then
        'For iCtr As Integer = iYear + 3 To iYear - 1 Step -1
        For iCtr As Integer = iYear - 1 To iYear + 3
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 7 Then
        For iCtr As Integer = iYear - 5 To iYear + 5
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 8 Then
        ddlValue.Items.Add(New ListItem("Year", ""))
        For iCtr As Integer = iYear - 90 To iYear - 18
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 9 Then
        For iCtr As Integer = iYear To iYear + 10
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      ElseIf iType = 10 Then
        For iCtr As Integer = iYear To iYear + 15
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
      End If
    End Sub

    Public Shared Function ValidateDateYMD(ByVal iType As Integer, ByVal sYear As String, ByVal sMonth As String, ByVal sDay As String) As String
      Dim dtValue As New DateTime()
      Dim iYear As Integer = 0, iMonth As Integer = 0, iDay As Integer = 0
      Integer.TryParse(sYear, iYear)
      Integer.TryParse(sMonth, iMonth)
      Integer.TryParse(sDay, iDay)
      If iType = 1 Then
        dtValue = New DateTime(iYear, iMonth, iDay)
      ElseIf iType = 2 Then
        If iYear > 0 AndAlso iMonth > 0 AndAlso iDay > 0 Then
          dtValue = New DateTime(iYear, iMonth, iDay)
        Else
          dtValue = New DateTime(1900, 1, 1)
        End If
      End If
      Return dtValue.ToString("dd MMMM yyyy")
    End Function

    Public Shared Function ValidateDate(ByVal iType As Integer, ByVal dtValueDate As String, ByVal dtValueTime As String) As String
      Dim dtTime As New TimeSpan
      Dim enUS As New CultureInfo("en-US")
      'Dim oErrorcl As New Errorcl
      Dim str1, str2 As String

      dtValueDate = LTrim(RTrim(Replace(dtValueDate, "'", "")))
      dtValueDate = Replace(dtValueDate, Chr(34), "")
      dtValueDate = Replace(dtValueDate, " ", "")
      dtValueDate = Replace(dtValueDate, "=", "")

      If iType = 1 Then
        If Date.TryParseExact(dtValueDate, "MM/dd/yyyy", enUS, DateTimeStyles.None, Nothing) <> True Then
          HttpContext.Current.Session("ErrorMsg") = "Date does not exist"
        Else
          If dtValueTime <> "" Then
            If InStr(dtValueTime, ":") Then
              str1 = Mid(dtValueTime, 1, InStr(dtValueTime, ":") - 1) ' -hour(HH)
              dtValueTime = Mid(dtValueTime, InStr(dtValueTime, ":") + 1)
              If InStr(dtValueTime, ":") Then
                str2 = Mid(dtValueTime, 1, InStr(dtValueTime, ":") - 1) '- min (mm)
              Else
                If dtValueTime <> "" Then
                  str2 = dtValueTime
                Else
                  str2 = "00"
                End If
              End If
              If str1.Count = 2 And str2.Count = 2 Then
                dtValueTime = str1 & ":" & str2
              Else
                dtValueTime = ""
                HttpContext.Current.Session("ErrorMsg") = "Invalid time format."
              End If
              'dtTime = New TimeSpan(0, dtValueTime, 0)
              'dtValueTime = String.Format("{0:00}:{1:00}", dtTime.Hours, dtTime.Minutes)
            Else
              dtValueTime = ""
              HttpContext.Current.Session("ErrorMsg") = "Invalid time format."
            End If
          End If
        End If
      End If
      Return dtValueDate & " " & dtValueTime
    End Function


    '! \brief This function validates the Date and returns date as in string form.
    '   *  \param iType <c> passes int value.</c> 
    '   *  \param dtValue <c> passes the date value.</c> 
    '   

    Public Shared Function ValidateDate(ByVal iType As Integer, ByVal dtValue As DateTime) As String
      Dim sReturn As String = ""
      If iType = 1 Then
        sReturn = (If(dtValue.Year = 9999, "mm/dd/yyyy", dtValue.ToString("MM/dd/yyyy")))
      ElseIf iType = 2 Then
        sReturn = (If(dtValue.Year = 9999, "", dtValue.ToString("MM/dd/yyyy")))
      End If
      Return sReturn
    End Function

    '! \brief This function Validates the Date and returns date as in string .
    '   *  \param iType <c> passes int value to define condition.</c> 
    '   *  \param sValue <c> passes the date value in string form.</c> 
    '   

    Public Shared Function ValidateDate(ByVal iType As Integer, ByVal sValue As String) As String
      Dim sReturn As String = "31 December 9999"
      Dim dtValue As DateTime = DateTime.Now
      If iType = 1 Then
        If DateTime.TryParse(sValue, dtValue) Then
          sReturn = dtValue.ToString("dd MMMM yyyy")
        End If
      End If
      Return sReturn
    End Function

    '! \brief This function Validates the Date and returns date as in string .
    '   *  \param iType <c> passes int value to define condition.</c> 
    '   *  \param sValue <c> passes the date value in string form.</c> 
    '   *  \param sFormat <c>passes date format as a string value. </c>  
    '   *  \param sReturnValue <c>return value in case validation failed. </c>  
    '   

    Public Shared Function ValidateDate(ByVal iType As Integer, ByVal sValue As String, ByVal sFormat As String, ByVal sReturnValue As String) As String
      Dim sReturn As String = sReturnValue
      Dim dtValue As DateTime = DateTime.Now
      If iType = 1 Then
        If DateTime.TryParseExact(sValue, sFormat, Nothing, System.Globalization.DateTimeStyles.None, dtValue) Then
          sReturn = dtValue.ToString("dd MMMM yyyy")
        End If
      End If
      Return sReturn
    End Function

    '! \brief This function Validates the Date and returns a boolean value.
    '   *  \param iType <c>passes int value to define condition. </c> 
    '   *  \param sValue <c>passes the date value in string form. </c>  
    '   *  \param sFormat <c>passes date format as a string value. </c>  
    '   *  \param dtReturn <c>passes date value. </c> 
    '   

    Public Shared Function ValidateDate(ByVal iType As Integer, ByVal sValue As String, ByVal sFormat As String, ByRef dtReturn As DateTime) As Boolean
      Dim bReturn As Boolean = False
      dtReturn = DateTime.Now
      If iType = 1 Then
        bReturn = DateTime.TryParseExact(sValue, sFormat, Nothing, System.Globalization.DateTimeStyles.None, dtReturn)
      End If
      Return bReturn
    End Function

    '! \brief This function returns the Date in specified date format.
    '   *  \param iType <c>passes int value to define condition. </c>
    '   *  \param sValue <c>passes the date in string form. </c>
    '   *  \param sParseFormat <c>passes string value to define parse format. </c>
    '   *  \param sReturnFormat <c>passes string value to define return format. </c>
    '   

    Public Shared Function FormatDate(ByVal iType As Integer, ByVal sValue As String, ByVal sParseFormat As String, ByVal sReturnFormat As String) As String
      Dim sReturn As String = ""
      If iType = 1 Then
        Dim dtReturn As DateTime
        If ValidateDate(1, sValue, sParseFormat, dtReturn) Then
          sReturn = dtReturn.ToString(sReturnFormat)
        End If
      End If
      Return sReturn
    End Function

    '! \brief This function returns the date in string form.
    '   *  \param iType <c>passes int value to define condition. </c>
    '   *  \param dtValue <c>passes date value. </c>
    '   

    Public Shared Function FormatDate(ByVal iType As Integer, ByVal dtValue As DateTime) As String
      Dim sReturn As String = ""
      If iType = 1 Then
        sReturn = dtValue.ToString("ddd, MMM. dd,<br>yyyy<br>h:mm tt")
      ElseIf iType = 2 Then
        sReturn = dtValue.ToString("ddd, MMM. dd, yyyy h:mm tt")
      ElseIf iType = 3 Then
        sReturn = dtValue.ToString("MM/dd/yyyy")
      ElseIf iType = 4 Then
        sReturn = If(dtValue.Year = 1900, "", dtValue.ToString("MM/dd/yyyy"))
      ElseIf iType = 5 Then
        sReturn = dtValue.ToString("dd MMMM yyyy")
      ElseIf iType = 6 Then
        sReturn = dtValue.ToString("dd/MMM/yyyy")
      ElseIf iType = 7 Then
        sReturn = dtValue.ToString("dd/MM/yyyy")
      End If
      Return sReturn
    End Function

    Public Shared Function CreditCardExpiryDate(ByVal iType As Integer, ByVal iMonth As Integer, ByVal iYear As Integer) As String
      Dim sReturn As String = ""
      If iType = 1 Then
        If iMonth > 0 AndAlso iYear > 0 Then
          sReturn = iMonth.ToString().PadLeft(2, "0"c) & iYear.ToString().Substring(2)
        End If
      End If
      Return sReturn
    End Function

    Public Shared Function CreditCardExpiryDate(ByVal iType As Integer, ByVal sMonth As String, ByVal sYear As String) As String
      Dim sReturn As String = ""
      If iType = 1 Then
        If sMonth.Trim().Length > 0 AndAlso sYear.Trim().Length > 0 Then
          sReturn = sMonth.PadLeft(2, "0"c) & sYear.Substring(2)
        End If
      End If
      Return sReturn
    End Function

    Public Shared Function ValidateDateDMY(ByVal iType As Integer, ByVal sYear As String, ByVal sMonth As String, ByVal sDay As String) As String
      Dim dtValue As New DateTime()
      Dim iYear As Integer = 0, iMonth As Integer = 0, iDay As Integer = 0
      Integer.TryParse(sYear, iYear)
      Integer.TryParse(sMonth, iMonth)
      Integer.TryParse(sDay, iDay)
      If iType = 1 Then
        dtValue = New DateTime(iYear, iMonth, iDay)
      ElseIf iType = 2 Then
        If iYear > 0 AndAlso iMonth > 0 AndAlso iDay > 0 Then
          dtValue = New DateTime(iYear, iMonth, iDay)
        Else
          dtValue = New DateTime(1900, 1, 1)
        End If
      End If
      Return dtValue.ToString("dd/MMM/yyyy")
    End Function
    '! \brief   Function to PopulateRateYear
    '   *  \details Function is PopulateRateYear
    '   *  \retval  Dropdown list with RateYear
    '   

    Public Sub PopulateRateYear(ByVal iType As Integer, ByRef ddlValue As DropDownList)
      Dim iYear As Integer = DateTime.Today.Year
      ddlValue.Items.Clear()
      If iType = 1 Then
        For iCtr As Integer = iYear - 5 To iYear + 3
          ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
        Next
        ddlValue.Items.Add(New ListItem("Default Rate", "3000"))
      End If
    End Sub

    Public Sub PopulateTime(ByRef ddlValue As DropDownList)
      ddlValue.Items.Clear()
      For Minutes As Integer = 0 To 1439 Step 30
        Dim TS As TimeSpan = TimeSpan.FromMinutes(Minutes)
        Dim TSString As String = String.Format("{0:00}:{1:00}", TS.Hours, TS.Minutes)
        Dim TSValue As String = String.Format("{0:00}:{1:00}", TS.Hours, TS.Minutes)
        If Minutes < 720 Then
          TSString = TSString & " AM"
        Else
          TSString = TSString & " PM"
        End If
        ddlValue.Items.Add(New ListItem(TSString, TSValue))
      Next
    End Sub



    Public Function ConcatZero(ByVal str As String, ByVal ctr As Integer) As String
      If str.Length < ctr Then
        For i = 0 To ctr - 1
          If str.Length < ctr Then
            str = "0" & str
          End If
        Next
      End If
      Return str
    End Function


    Public Function ParseDate(ByVal iFormat As Integer, ByVal sdate As String) As DateTime
      Dim enUS As New CultureInfo("en-US")
      Dim dt As New DateTime
      If iFormat = 1 Then
        dt = Date.ParseExact(sdate, "MM/dd/yyyy HH:mm", Nothing)
      ElseIf iFormat = 2 Then
        dt = Date.ParseExact(sdate, "MM/dd/yyyy", Nothing)
      ElseIf iFormat = 3 Then
        dt = Date.ParseExact(sdate, "dd/MM/yyyy", Nothing)
      ElseIf iFormat = 4 Then
        dt = Date.ParseExact(sdate, "dd/MM/yyyy HH:mm", Nothing)
      End If
      Return dt
    End Function

    Public Shared Function FormatDate(ByVal sdate As String) As String
      Dim str1, str2, str3 As String
      str1 = ""
      str2 = ""
      str3 = ""
      Dim oDateTimecl As New DateTimecl
      If InStr(sdate, "/") > 0 Then
        str1 = oDateTimecl.ConcatZero(Mid(sdate, 1, InStr(sdate, "/") - 1), 2)
        sdate = Mid(sdate, InStr(sdate, "/") + 1)
        If InStr(sdate, "/") > 0 Then
          str2 = oDateTimecl.ConcatZero(Mid(sdate, 1, InStr(sdate, "/") - 1), 2)
          sdate = Mid(sdate, InStr(sdate, "/") + 1)
          str3 = oDateTimecl.ConcatZero(sdate, 4)
        End If
      End If
      sdate = str1 & "/" & str2 & "/" & str3
      Return sdate
    End Function

    Public Shared Function FormatDate(ByVal ddate As Date) As String
      Dim sdate As String = ""
      Dim oDateTime As New DateTimecl
      sdate = oDateTime.ConcatZero(ddate.Month, 2) & "/" & oDateTime.ConcatZero(ddate.Day, 2) & "/" & oDateTime.ConcatZero(ddate.Year, 4)
      Return sdate
    End Function
    ''' <summary>
    ''' Function to PopulateDays with Zero
    ''' </summary>
    ''' <param name="iType">iType=0,  1st record is "Day", and  default to it, with year=2100|| iType=0, no text "Day" as 1st record</param>
    ''' <param name="ddlValue"></param>
    ''' <remarks>Function is PopulateDays with Zero</remarks>
    Public Sub PopulateDaysWithZero(ByVal iType As Integer, ByRef ddlValue As DropDownList)
      ddlValue.Items.Clear()
      If iType = 1 Then
        For iCtr As Integer = 1 To 31
          'ddlValue.Items.Add(New ListItem(Stringcl.AddZeroToString(iCtr.ToString()), iCtr.ToString()))
          If iCtr < 10 Then
            ddlValue.Items.Add(New ListItem(iCtr.ToString(), Stringcl.AddZeroToString(iCtr.ToString())))
          Else
            ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
          End If
        Next
      ElseIf iType = 2 Then
        ddlValue.Items.Add(New ListItem("Day", "0"))
        For iCtr As Integer = 1 To 31
          If iCtr < 10 Then
            ddlValue.Items.Add(New ListItem(iCtr.ToString(), Stringcl.AddZeroToString(iCtr.ToString())))
          Else
            ddlValue.Items.Add(New ListItem(iCtr.ToString(), iCtr.ToString()))
          End If
        Next
      End If

    End Sub

    Public Sub PopulateRadComboBoxMonths(ByVal iType As Integer, ByRef ddlValue As RadComboBox)
      ddlValue.Items.Clear()
      If iType = 1 Then
        ddlValue.Items.Add(New RadComboBoxItem("Mon", ""))
        For iCtr As Integer = 1 To 12
          ddlValue.Items.Add(New RadComboBoxItem(Left(MonthName(iCtr), 3), ConcatZero(iCtr.ToString(), 2)))
        Next
      End If
    End Sub
    Public Sub PopulateRadComboBoxYears(ByVal iType As Integer, ByRef ddlValue As RadComboBox)
      Dim iYear As Integer = DateTime.Today.Year
      ddlValue.Items.Clear()
      If iType = 1 Then
        ddlValue.Items.Add(New RadComboBoxItem("Year", ""))
        For iCtr As Integer = iYear To iYear + 20
          ddlValue.Items.Add(New RadComboBoxItem(iCtr.ToString(), iCtr.ToString()))
        Next
      End If
    End Sub
  End Class
End Namespace