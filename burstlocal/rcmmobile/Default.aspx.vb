Imports mRCMAPI
Imports System.Data
Imports System.Xml
Partial Class _Default
  Inherits System.Web.UI.Page
  Dim oBrandcl As New Brandcl
  Dim WS_RCMClientAPI As New WS_RCMClientAPI.RCMClientAPI
  Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    Dim sDBConnectStringRCMMain As String
    sDBConnectStringRCMMain = ""
    If Not mRCMAPI.EasyDBPoolcl.AreAllDBConnectionsSet() Then
      If (ConfigurationManager.ConnectionStrings.Count > 0) Then
        Dim connString As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("RCMMain")
        If connString IsNot Nothing Then
          sDBConnectStringRCMMain = connString.ConnectionString
        End If
        mRCMAPI.EasyDBPoolcl.SetAllDBConnections(sDBConnectStringRCMMain)
      End If
    End If

    Dim ds As DataSet = WS_RCMClientAPI.requestVehicleCategoryLocations(System.Configuration.ConfigurationManager.AppSettings("CompanyKey"))
    Dim sResponse As String = IOcl.GetXMLasStringFromDataSet(ds)
    Dim xDocResponse = New XmlDocument()
    'Load the Xml file
    xDocResponse.LoadXml(sResponse)

    Dim dtVehicleCategoryXML As New DataTable
    Dim root As XmlElement = xDocResponse.DocumentElement
    Dim elemList As XmlNodeList = root.GetElementsByTagName("CategoryType")
    dtVehicleCategoryXML = ConvertXmlNodeListToDataTable(elemList)

    ''''''''''''''''''
    Dim dtVehicleCategory As New DataTable
    dtVehicleCategory = oBrandcl.GetLocationsBasedVehicleCategoryOnBrandId(1, 19)

    ''now filter:
    ''get all rows that Id is higher then 6 (so 3 rows will be added to new dataTable):
    'Dim filterDT As DataTable = dtVehicleCategory.Clone()
    'Dim rows As DataRow() = dtVehicleCategory.[Select]("Id > 6")
    'For Each row As DataRow In rows
    '  filterDT.ImportRow(row)
    'Next
    'CompareDataTables(dtVehicleCategoryXML, dtVehicleCategory, 0)
    'Dim dtVehicleExtraFees As New DataTable
    'dtVehicleExtraFees = oBrandcl.GetLocationsBasedExtraFeesOnBrandId(1, 19)

    Dim dt3 As New DataTable()
    Dim dt4 As New DataTable()
    'http://forums.asp.net/t/1459790.aspx
    CompareTables(dtVehicleCategoryXML, dtVehicleCategory, dt3, dt4)

    Dim view As New DataView(dt3)
    Dim distinctValues As DataTable = view.ToTable(True, "CategoryTypeId")

  End Sub
  Private Shared Function InlineAssignHelper(Of T)(ByRef target As T, value As T) As T
    target = value
    Return value
  End Function
  Public Shared Function ConvertXmlNodeListToDataTable(xnl As XmlNodeList) As DataTable

    Dim dt As New DataTable()

    Dim TempColumn As Integer = 0



    For Each node As XmlNode In xnl.Item(0).ChildNodes

      TempColumn += 1

      Dim dc As New DataColumn(node.Name, System.Type.[GetType]("System.String"))

      If dt.Columns.Contains(node.Name) Then


        dt.Columns.Add(InlineAssignHelper(dc.ColumnName, dc.ColumnName + TempColumn.ToString()))
      Else



        dt.Columns.Add(dc)

      End If
    Next

    Dim ColumnsCount As Integer = dt.Columns.Count
    For i As Integer = 0 To xnl.Count - 1

      Dim dr As DataRow = dt.NewRow()

      For j As Integer = 0 To ColumnsCount - 1


        dr(j) = xnl.Item(i).ChildNodes(j).InnerText
      Next


      dt.Rows.Add(dr)
    Next

    Return dt

  End Function




  Private Sub populateRowsInFirstTableGrid(ByVal dt As DataTable)
    'Bind GridView
    'GridViewRowsInFirst.DataSource = dt
    'GridViewRowsInFirst.Refresh()

  End Sub


  Private Sub populateRowsInBothTableGrid(ByVal dt As DataTable)
    'Bind GridView
    'GridViewRowsInBoth.DataSource = dt
    'GridViewRowsInBoth.Refresh()


  End Sub

  Private Sub CompareTables(Dt1 As DataTable, Dt2 As DataTable, ByRef DtInBoth As DataTable, ByRef DtNotInBoth As DataTable)
    DtInBoth = New DataTable()
    DtInBoth = Dt1.Clone()
    DtNotInBoth = New DataTable()
    DtNotInBoth = Dt1.Clone()
    Dim vals As [Object]() = New [Object](0) {}
    Dim dtTableCompared As New DataTable()
    Dim dtTableSearched As New DataTable()
    If Dt1.Rows.Count >= Dt2.Rows.Count Then
      dtTableCompared = Dt1.Copy()
      dtTableSearched = Dt2.Copy()
    ElseIf Dt1.Rows.Count < Dt2.Rows.Count Then
      dtTableCompared = Dt2.Copy()
      dtTableSearched = Dt1.Copy()
    End If

    For Each row As DataRow In dtTableCompared.Rows
      vals(0) = row("CategoryTypeId")
      If dtTableSearched IsNot Nothing AndAlso dtTableSearched.Rows.Count >= 0 Then
        dtTableSearched.DefaultView.Sort = "CategoryTypeId"
        Dim intRowFound As Integer = dtTableSearched.DefaultView.Find(vals(0))
        If intRowFound <= -1 Then
          Dim newRow As DataRow = DtNotInBoth.NewRow()
          newRow.ItemArray = row.ItemArray
          DtNotInBoth.Rows.Add(newRow)
        Else
          Dim newRow As DataRow = DtInBoth.NewRow()
          newRow.ItemArray = row.ItemArray
          DtInBoth.Rows.Add(newRow)
        End If
      End If
    Next
    For Each row As DataRow In dtTableSearched.Rows
      vals(0) = row("CategoryTypeId")
      If dtTableCompared IsNot Nothing AndAlso dtTableCompared.Rows.Count >= 0 Then
        dtTableCompared.DefaultView.Sort = "CategoryTypeId"
        Dim intRowFound As Integer = dtTableCompared.DefaultView.Find(vals(0))
        If intRowFound <= -1 Then
          Dim newRow As DataRow = DtNotInBoth.NewRow()
          newRow.ItemArray = row.ItemArray
          DtNotInBoth.Rows.Add(newRow)
        Else
          Dim newRow As DataRow = DtInBoth.NewRow()
          newRow.ItemArray = row.ItemArray
          DtInBoth.Rows.Add(newRow)
        End If
      End If
    Next

  End Sub

  '=======================================================
  'Service provided by Telerik (www.telerik.com)
  'Conversion powered by NRefactory.
  'Twitter: @telerik, @toddanglin
  'Facebook: facebook.com/telerik
  '=======================================================

End Class
