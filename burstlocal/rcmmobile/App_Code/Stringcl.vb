Imports System.Data
Imports System.Configuration
Imports System.Text
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections
Imports System.Collections.Generic
Imports System.Globalization
Imports System.Threading

Namespace mRCMAPI
  '! \class Stringcl
  '   *  \brief 
  '   *  Provide utility functions to extend functionality of standard string class.
  '   * 
  '   *  \details 
  '   *  Provide utility functions to extend functionality of standard string class.
  '   * 
  '   *  \todo
  '   *  Functions documentation
  '   

  Public Class Stringcl
    Public Shared Sub ConvertHashTableToString(ByRef htValues As Hashtable, ByRef sReturn As String)
      Dim sbReturn As New StringBuilder(htValues.Count)
      For Each oValue As Object In htValues.Keys
        If TypeOf oValue Is String AndAlso TypeOf htValues(oValue) Is String Then
          sbReturn.Append(oValue.ToString() & " : " & htValues(oValue).ToString() & Environment.NewLine)
        End If
      Next
      sReturn = sbReturn.ToString()
    End Sub
    Public Shared Function FixQuotes(ByRef sValue As String) As String
      sValue = sValue.Replace("'", "''")
      Return sValue
    End Function

    Public Shared Function GetCleanUserInputAsString(ByVal sValue As String) As String
      GetCleanUserInputAsString = LTrim(RTrim(Replace(sValue, "'", "&#39;")))
    End Function


    Public Shared Sub GetArrayValue(ByVal oValue As Object, ByRef sValue As String)
      If oValue IsNot Nothing Then
        sValue = oValue.ToString()
      End If
    End Sub

    Public Shared Sub GetValue(ByVal sValue As String, ByRef sReturnValue As String)
      If sValue IsNot Nothing Then
        sReturnValue = sValue
      End If
    End Sub
    Public Shared Function GetValueWithNoReplace(ByVal oValue As Object) As String
      Dim sReturn As String = ""
      If oValue IsNot Nothing Then
        sReturn = Trim(oValue.ToString())
      End If
      Return sReturn
    End Function

    Public Shared Function GetValue(ByVal oValue As Object) As String
      Dim sReturn As String = ""
      If oValue IsNot Nothing Then
        sReturn = GetCleanUserInputAsString(Trim(oValue.ToString()))
        sReturn = Replace(sReturn, "(", "")
        sReturn = Replace(sReturn, ")", "")
        sReturn = Replace(sReturn, "&#39;", "")
        sReturn = Replace(sReturn, ",", "")
        sReturn = Replace(sReturn, Chr(22), "")
        sReturn = Replace(sReturn, "&#34;", "")
        sReturn = Replace(sReturn, """", "")
      End If
      Return sReturn
    End Function

    Public Shared Function GetValue(ByVal Itype As Integer, ByVal oValue As Object) As String
      Dim sReturn As String = ""
      If oValue IsNot Nothing Then
        If Itype = 1 Then
          sReturn = GetCleanUserInputAsString(Trim(oValue.ToString()))
          sReturn = Replace(sReturn, "(", "")
          sReturn = Replace(sReturn, ")", "")
          sReturn = Replace(sReturn, "&#39;", "")
          sReturn = Replace(sReturn, ",", "")
          sReturn = Replace(sReturn, Chr(22), "")
          sReturn = Replace(sReturn, "&#34;", "")
          sReturn = Replace(sReturn, """", "")
          sReturn = Replace(sReturn, "/", "") 'Incase of PageName
        End If
      End If
      Return sReturn
    End Function

    Public Shared Function GetCleanUserInputAsNumber(ByVal oValue As Object) As String
      GetCleanUserInputAsNumber = LTrim(RTrim(Replace(oValue, ",", "")))
    End Function

    Public Shared Function Left(ByVal sValue As String, ByVal iLength As Integer) As String
      Dim sReturn As String = sValue
      If sValue.Length >= iLength Then
        sReturn = sValue.Substring(0, iLength)
      End If
      Return sReturn
    End Function

    Public Shared Function Mid(ByVal sValue As String, ByVal iStartPosition As Integer, ByVal iLength As Integer) As String
      Dim sReturn As String = sValue
      If sValue.Length >= (iStartPosition + iLength) Then
        sReturn = sValue.Substring(iStartPosition, iLength)
      End If
      Return sReturn
    End Function

    Public Shared Function Right(ByVal sValue As String, ByVal iLength As Integer) As String
      Dim sReturn As String = sValue
      Dim iValueLength As Integer = sValue.Length
      If iValueLength > iLength AndAlso iLength > 0 Then
        sReturn = sValue.Substring(iValueLength - iLength)
      End If
      Return sReturn
    End Function
    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that accepts a text value parameter and returns it as a first character capitalized.
    '     

    Public Shared Function CapitalizeME(ByVal sText As String) As String
      Dim sReturn As String = ""
      If sText <> "" Then
        Dim oCultureInfo As CultureInfo = Thread.CurrentThread.CurrentCulture
        Dim oTextInfo As TextInfo = oCultureInfo.TextInfo
        sReturn = oTextInfo.ToTitleCase(sText)
      End If
      Return sReturn
    End Function
    '! \brief 
    '     *  Function
    '     * 
    '     *  \details 
    '     *  Function that accepts a stringbuilder parameter and returns HtmlTextWriter.
    '     

    Public Shared Function GetHtmlTextWriter(ByRef osbSource As StringBuilder) As HtmlTextWriter
      Dim swWrite As New System.IO.StringWriter(osbSource)
      Dim htwWrite As New HtmlTextWriter(swWrite)
      Return htwWrite
    End Function

    '! \brief This function returns the decoded value.
    '     *  \detail This function returns the decoded value.
    '     *  \param[in] This function takes one string type variable as an argument.
    '     

    Public Shared Function DecodeData(ByVal sSpecialMessage As String) As String
      Dim sUnicode As String = sSpecialMessage
      Dim bMessage As Byte() = Encoding.GetEncoding(0).GetBytes(sUnicode)
      Dim sEncodedMessage As String = Encoding.GetEncoding("UTF-8").GetString(bMessage)
      Return sEncodedMessage
    End Function

    '! \brief 
    '     *  Function
    '     *  AddZeroToString
    '     *  \details 
    '     *  Function that accepts a string parameter and returns with add zero.
    '     
    Public Shared Function AddZeroToString(ByVal sObject As String) As String
      sObject = "0" & sObject
      Return sObject
    End Function

    Public Shared Function GetValueTidyUpCode(ByVal oValue As Object) As String
      Dim sReturn As String = ""
      sReturn = oValue
      If oValue IsNot Nothing Then
        sReturn = LTrim(RTrim(Replace(sReturn, "'", "")))
        sReturn = Replace(sReturn, "<", "")
        sReturn = Replace(sReturn, "http", "")
        sReturn = Replace(sReturn, "://", "")
        sReturn = Replace(sReturn, "=", "")
        sReturn = Replace(sReturn, "?", "")
        sReturn = Replace(sReturn, "/", "")
        sReturn = Replace(sReturn, "+", "")
        sReturn = Replace(sReturn, "%", "")
        sReturn = Replace(sReturn, ">", "")
      End If
      Return sReturn
    End Function
    Public Shared Function ConvertYesNoToDatabaseBit(ByVal sValue As String) As Integer
      Dim bValue As Boolean = False
      Dim iReturn As Integer = 0
      If Stringcl.TryParseYesNo(sValue, bValue) Then
        iReturn = (If(bValue, 1, 0))
      Else
        Throw New Exception("Booleancl.TryParseYesNo: Parsing failed for value" & sValue)
      End If
      Return iReturn
    End Function

    Public Shared Function TryParseYesNo(ByRef sValue As String, ByRef bValue As Boolean) As Boolean
      Dim bReturn As Boolean = False
      sValue = sValue.ToLower()
      If sValue = "yes" OrElse sValue = "no" Then
        bValue = (If(sValue = "yes", True, False))
        bReturn = True
      End If
      Return bReturn
    End Function
  End Class
End Namespace
