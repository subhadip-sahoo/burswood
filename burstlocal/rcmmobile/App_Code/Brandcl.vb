Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports System.Globalization


Namespace mRCMAPI
  Public Class Brandcl
    Dim m_sSQL As String = ""
    Public Sub Brandcl()
    End Sub
    Public Function GetLocationsBasedVehicleCategoryOnBrandId(ByVal iType As Integer, ByVal iBrand As Integer) As DataTable
      If iType = 1 Then
        m_sSQL = "select CategoryID as CategoryTypeId,CategoryType as CategoryTypeName from WebCategoryAvailability,CategoryType WHERE CategoryType.ID = CategoryID AND CompanyID = " & iBrand
      End If
      Return EasyDBPoolcl.GetDataTable(m_sSQL)
    End Function

    Public Function GetLocationsBasedExtraFeesOnBrandId(ByVal iType As Integer, ByVal iBrand As Integer) As DataTable
      If iType = 1 Then
        m_sSQL = "select [ID],LocationID from ExtraFees WHERE WebItems=1 AND CompanyID = " & iBrand
      End If
      Return EasyDBPoolcl.GetDataTable(m_sSQL)
    End Function
  End Class
End Namespace
