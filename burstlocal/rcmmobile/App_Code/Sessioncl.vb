Imports System.Data
Imports System.IO
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts

Namespace mRCMAPI
  '! \class Sessioncl
  '   *  \brief 
  '   *  Provide details for accessing Session object.
  '   * 
  '   *  \details 
  '   *  Provide details for accessing Session object.
  '   

  Public Class Sessioncl

    Public Sub New()
    End Sub
    '! \brief 
    '     *  Function to parse, return and delete value stored in Session object.
    '     * 
    '     *  \details 
    '     *  Function to parse, return and delete value stored in Session object.
    '     *  
    '     *  \retval value stored in session for the key passed
    '     * 

    Public Shared Function GetAndDeleteNumericValue(ByVal sKey As String) As Integer
      Dim iReturn As Integer = 0
      If HttpContext.Current.Session(sKey) IsNot Nothing Then
        iReturn = Numericcl.GetIntValue(HttpContext.Current.Session(sKey))
        HttpContext.Current.Session.Remove(sKey)
      End If
      Return iReturn
    End Function

    '! \brief 
    '     *  Function to parse and return value stored in Session object.
    '     * 
    '     *  \details 
    '     *  Function to parse and return value stored in Session object.
    '     *  
    '     *  \retval value stored in session for the key passed
    '     * 

    Public Shared Function GetNumericValue(ByVal sKey As String) As Integer
      Dim iReturn As Integer = 0
      If HttpContext.Current.Session(sKey) IsNot Nothing Then
        iReturn = Numericcl.GetIntValue(HttpContext.Current.Session(sKey))
      End If
      Return iReturn
    End Function

    '! \brief 
    '     *  Get session value
    '     * 
    '     *  \details 
    '     *  Helper function to set string value into session
    '     * 
    '     

    Public Shared Function GetSessionValueString(ByVal sValue As String) As String
      Dim sReturn As String = Stringcl.GetValue(HttpContext.Current.Session(sValue))
      Return sReturn
    End Function
    '! \brief
    '     *  Set session value
    '     * 
    '     *  \details 
    '     *  Helper function to set string value into session
    '     * 
    '     *  \param[in] sKey Session key
    '     *  \param[in] sValue Session value
    '     

    Public Shared Sub SetSessionValueString(ByVal sKey As String, ByVal sValue As String)
      HttpContext.Current.Session(sKey) = sValue
    End Sub
    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that accept session object and returns its id.
    '     * 
    '     *  \param[in] oSession Object of the session.
    '     * 
    '     

    Public Shared Function GetSessionID(ByVal oSession As System.Web.SessionState.HttpSessionState) As String
      Dim sReturn As String = ""
      Dim sSessionID As String = oSession("SessionID").ToString()
      If sSessionID Is Nothing OrElse sSessionID.Trim().Length = 0 Then
        sReturn = GetNewSessionID(oSession)
      Else
        sReturn = sSessionID
      End If
      Return sReturn
    End Function

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that returns the current session's id.
    '     * 
    '     

    Public Shared Function GetSessionID() As String
      Dim sReturn As String = ""
      Dim sSessionID As String = HttpContext.Current.Session("SessionID").ToString()
      If sSessionID Is Nothing OrElse sSessionID.Trim().Length = 0 Then
        sReturn = GetNewSessionID()
      Else
        sReturn = sSessionID
      End If
      Return sReturn
    End Function

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that accepts the session object as parameter and concatenates its session id with date and time.
    '     * 
    '     *  \param[in] oSession Object of the session.
    '     * 
    '     

    Public Shared Function GetNewSessionID(ByVal oSession As System.Web.SessionState.HttpSessionState) As String
      Dim sReturn As String = ""
      sReturn = oSession.SessionID & "_" & DateTime.Now.ToString("yyyyMMdd_HHmmss")
      oSession("SessionID") = sReturn
      Return sReturn
    End Function

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that concatenates the current session's id with date and time.
    '     * 
    '     * 
    '     

    Public Shared Function GetNewSessionID() As String
      Dim sReturn As String = ""
      sReturn = HttpContext.Current.Session.SessionID & "_" & DateTime.Now.ToString("yyyyMMdd_HHmmss")
      HttpContext.Current.Session("SessionID") = sReturn
      Return sReturn
    End Function

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that returns whether a user is logged in or not
    '     * 
    '     

    Public Shared Function IsUserLoggedIn() As Boolean
      Dim iClientId As Integer = Numericcl.GetIntValue(HttpContext.Current.Session("ClientId"))
      Return (iClientId > 0)
    End Function

    '! \brief
    '     *  Function
    '     *
    '     *  \details
    '     *  Function that accepts the session object as parameter and whether a user is logged in or not.
    '     *
    '     *  \param[in] oSession Object of the session.
    '     *
    '     

    Public Shared Function IsUserLoggedIn(ByVal oSession As System.Web.SessionState.HttpSessionState) As Boolean
      Dim iClientId As Integer = Numericcl.GetIntValue(oSession("ClientId"))
      Return (iClientId > 0)
    End Function


    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that returns the currency used by the user in a session
    '     * 
    '     

    Public Shared Function GetSessionCurrency(ByVal iType As Short) As String
      Dim sCurrency As String = "AUD"
      Try
        If iType = 1 Then
          If HttpContext.Current.Session("Currency") IsNot Nothing Then
            sCurrency = HttpContext.Current.Session("Currency").ToString()
          End If
        End If
      Catch ex As Exception
        Errorcl.HandleException(ex, True)
      End Try
      Return sCurrency
    End Function

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function used to set the currency used by the user in a session
    '     * 
    '     *  \param[in] in type
    '     *  \param[in] sCurrency Name of the currency
    '     

    Public Shared Sub SetSessionCurrency(ByVal iType As Short, ByVal sCurrency As String)
      If iType = 1 Then
        HttpContext.Current.Session("Currency") = sCurrency
      End If
    End Sub

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that returns the rate of the currency used by the user in a session
    '     * 
    '     *  \param[in] in type
    '     

    Public Shared Function GetSessionCurrencyRate(ByVal iType As Short) As Decimal
      Dim dcCurrencyRate As Decimal = 0
      If iType = 1 Then
        If HttpContext.Current.Session("CurrencyRate") IsNot Nothing Then
          Decimal.TryParse(HttpContext.Current.Session("CurrencyRate").ToString(), dcCurrencyRate)
        End If
      End If
      Return dcCurrencyRate
    End Function

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that sets the rate of the currency used by the user in a session
    '     * 
    '     *  \param[in] in type
    '     *  \param[in] dCurrencyRate rate of the currency
    '     

    Public Shared Sub SetSessionCurrencyRate(ByVal iType As Short, ByVal dCurrencyRate As Decimal)
      If iType = 1 Then
        If dCurrencyRate > 0 Then
          HttpContext.Current.Session("CurrencyRate") = dCurrencyRate.ToString()
        End If
      End If
    End Sub

    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that sets the currency & rate of the currency used by the user in a session
    '     * 
    '     *  \param[in] in type
    '     *  \param[in] sCurrency  Name of the currency.
    '     *  \param[in] dCurrencyRate Rate of the currency.
    '     * 
    '     

    Public Shared Sub SetSessionCurrencyAndRate(ByVal iType As Short, ByVal sCurrency As String, ByVal dCurrencyRate As Decimal)
      If iType = 1 Then
        If sCurrency.Trim().Length > 0 AndAlso dCurrencyRate > 0 Then
          HttpContext.Current.Session("Currency") = sCurrency
          HttpContext.Current.Session("CurrencyRate") = dCurrencyRate.ToString()
        End If
      End If
    End Sub

    'Public Shared Sub SetPreviousPage()
    '  If IsNothing(HttpContext.Current.Request.UrlReferrer) = False Then
    '    If LCase(HttpContext.Current.Request.UrlReferrer.Segments(HttpContext.Current.Request.UrlReferrer.Segments.Length - 1).ToString) <> "mrcm/" Then
    '      HttpContext.Current.Session("PreviousPage") = HttpContext.Current.Request.UrlReferrer.Segments(HttpContext.Current.Request.UrlReferrer.Segments.Length - 1).ToString
    '    End If
    '  Else
    '    HttpContext.Current.Session("PreviousPage") = HttpContext.Current.Request.Url.Segments(HttpContext.Current.Request.Url.Segments.Length - 1).ToString
    '  End If
    'End Sub
    'Public Shared Function GetPreviousPage() As String
    '  Dim sPageName As String = ""
    '  If HttpContext.Current.Session("PreviousPage") IsNot Nothing Then
    '    sPageName = HttpContext.Current.Session("PreviousPage").ToString()
    '  End If
    '  Return sPageName
    'End Function

    Public Shared Function SetHomePage() As String
      Dim hmpage As String = Mid(HttpContext.Current.Request.Url.AbsoluteUri, 1, InStr(HttpContext.Current.Request.Url.AbsoluteUri, HttpContext.Current.Request.Url.Segments(HttpContext.Current.Request.Url.Segments.Length - 1)) - 1)
      hmpage = hmpage & "webstep1.aspx"
      Return hmpage
    End Function

    Public Function bgThemeColor() As String
      Return "background-color:" & HttpContext.Current.Session("ThemeColor") & ";"
    End Function

  End Class
End Namespace

