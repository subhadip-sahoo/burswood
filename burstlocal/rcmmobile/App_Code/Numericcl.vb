Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Public Class Numericcl
  Public Sub New()
  End Sub

  Public Shared Function ConvertBool(ByVal bValue As Boolean) As String
    Return If(bValue, "1", "0")
  End Function

  '! \brief Function to get appended currency before the value and without currency symbol.
  '   *  \details It will return appended currency before the value and without currency symbol both on the basis of iType.
  '   *  \param[in] iType int 1 is for without currency symbol and 2 is for appended currecy symbol with value.
  '   

  Public Shared Function FormatCurrency(ByVal iType As Short, ByVal dcValue As Decimal) As String
    Dim sReturn As String = ""
    If iType = 1 Then
      sReturn = dcValue.ToString("0.00")
    ElseIf iType = 2 Then
      sReturn = dcValue.ToString("c")
    End If
    Return sReturn
  End Function

  Public Shared Function GetDecimalValue(ByVal oValue As Object) As Decimal
    Dim dReturn As Decimal = 0
    If oValue IsNot Nothing Then
      Decimal.TryParse(oValue.ToString(), dReturn)
    End If
    Return dReturn
  End Function

  Public Shared Function GetDecimalValue(ByVal sValue As String) As Decimal
    Dim dReturn As Decimal = 0
    If sValue IsNot Nothing Then
      Decimal.TryParse(sValue, dReturn)
    End If
    Return dReturn
  End Function

  Public Shared Function GetIntValue(ByVal sValue As String) As Integer
    Dim iReturn As Integer = 0
    If sValue IsNot Nothing Then
      Integer.TryParse(sValue, iReturn)
    End If
    Return iReturn
  End Function

  Public Shared Function GetIntValue(ByVal oValue As Object) As Integer
    Dim iReturn As Integer = 0
    If oValue IsNot Nothing Then
      Integer.TryParse(oValue.ToString(), iReturn)
    End If
    Return iReturn
  End Function

  Public Shared Function GetShortValue(ByVal sValue As String) As Short
    Dim iReturn As Short = 0
    If sValue IsNot Nothing Then
      Short.TryParse(sValue, iReturn)
    End If
    Return iReturn
  End Function

  '! \brief
  '   *  Function to get the integer part of decimal value
  '   * 
  '   *  \details
  '   *  This function returns the integer part of a decimal value
  '   *  
  '   *  \param[in] sValue Source Value
  '   * 
  '   

  Public Shared Function GetDecimalFloorValue(ByVal sValue As String) As Integer
    Dim iReturn As Integer = 0
    If sValue IsNot Nothing Then
      Dim dVal As Decimal = 0D
      Decimal.TryParse(sValue, dVal)
      iReturn = GetIntValue(Decimal.Floor(dVal))
    End If
    Return iReturn
  End Function

  '! \brief
  '   *  Function to get the integer part of decimal value
  '   * 
  '   *  \details
  '   *  This function returns the integer part of a decimal value
  '   *  
  '   *  \param[in] dValue Source Value
  '   * 
  '   

  Public Shared Function GetDecimalFloorValue(ByVal dValue As Decimal) As Integer
    Dim iReturn As Integer = 0
    iReturn = GetIntValue(Decimal.Floor(dValue))
    Return iReturn
  End Function
End Class
