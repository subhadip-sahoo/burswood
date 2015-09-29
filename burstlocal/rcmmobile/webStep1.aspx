<%@ Page Language="VB" MasterPageFile="Site.Master" AutoEventWireup="false" CodeFile="webStep1.aspx.vb"
  Inherits="webStep1" %>

<%@ Register Src="~/userControls/PoweredBy.ascx" TagName="Control" TagPrefix="PoweredBy" %>
<%@ Import Namespace="mRCMAPI" %>
<asp:Content ID="title" runat="server" ContentPlaceHolderID="HeadContent">
  <!--<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script src="scripts/date.js"></script>

<script>
  $(function () {
    // http://lab.abhinayrathore.com/jquery_cdn/
    ////////////// PICKUP 
    //$( ".selector" ).datepicker( "option", "defaultDate", +7 );
    //alert(Date.today());
    //01/16/2013
    $("#PickUpDate").val(Date.today().addDays(15).toString("MM/dd/yyyy"));
    $("#alternate").html(Date.today().addDays(15).toString("ddd MMM dd"));

    $("#DropOffDate").val(Date.today().addDays(30).toString("MM/dd/yyyy"));
    $("#LabelDropOffDate").html(Date.today().addDays(30).toString("ddd MMM dd"));


    $("#PickUpDate").datepicker({
      //dateFormat: "D M d",
      minDate: 0,
      defaultDate:+15,
      onClose: function (selectedDate) {
        $("#DropOffDate").datepicker("option", "minDate", selectedDate);
      }
    });
    //http://www.datejs.com/2007/11/27/getting-started-with-datejs/
    $("#PickupCal").click(function () {
      $("#PickUpDate").focus();
    });

    $("#PickUpDate").change(function () {
      //alert('datepicker =' + $("#PickUpDate").val());
      //Wed jan 23
      var date_ = Date.parse($("#PickUpDate").val(), "d-MMM-yyyy");
      //alert(date_);
      var test = date_.toString("ddd MMM dd");
      //alert(test);
      $("#alternate").html(test);
    });
    ////////////// Pickup Date ends 

    ////////////// Pickup Hours Starts 
    //$("#combopickupTime").hide();
    $("#pickupClock").hide();
    $("#lblPickupClock").hide();

    $("#pickupClock").click(function () {
      $("#lblPickupClock").hide();
      $("#combopickupTime").show(function () {
        $("#combopickupTime").triggerHandler("click");
      });
    });
    ////////////// Pickup Hours Ends 


    ////////////// DropOff 
    $("#DropOffDate").datepicker({
      //dateFormat: "D M d",
      minDate: 0,
      onClose: function (selectedDate) {
        $("#PickUpDate").datepicker("option", "maxDate", selectedDate);
      }
    });
    //http://www.datejs.com/2007/11/27/getting-started-with-datejs/
    $("#DropOffDateCal").click(function () {
      $("#DropOffDate").focus();
    });

    $("#DropOffDate").change(function () {
      //alert('datepicker =' + $("#PickUpDate").val());
      //Wed jan 23
      var date_ = Date.parse($("#DropOffDate").val(), "d-MMM-yyyy");
      //alert(date_);
      var test = date_.toString("ddd MMM dd");
      //alert(test);
      $("#LabelDropOffDate").html(test);
    });
    ////////////// Dropoff Date ends 

  });

</script>
-->
<style type="text/css">
.RemoveWhite
{
white-space: pre; /* CSS 2.0 */
white-space: pre-wrap; /* CSS 2.1 */
white-space: pre-line; /* CSS 3.0 */
white-space: -pre-wrap; /* Opera 4-6 */
white-space: -o-pre-wrap; /* Opera 7 */
white-space: -moz-pre-wrap; /* Mozilla */
white-space: -hp-pre-wrap; /* HP Printers */
word-wrap: break-word; /* IE 5+ */
}
</style>
  <script language="javascript" type="text/javascript">
    txtCategoryType = document.getElementById("MainContent_txtCategoryType");
    bExistTxtCategoryType = elementExists(txtCategoryType);

    txtAge = document.getElementById("MainContent_txtAge");
    bExistTxtAge = elementExists(txtAge);

    function ShowDatePopupFrom() {
      $find("<%= RadDatePickerPickUpDate.ClientID %>").showPopup();
    }
    function ShowDatePopupTo() {
      $find("<%= RadDatePickerDropOffDate.ClientID %>").showPopup();
    }

    function ShowTimePopupFrom() {
      var picker = $find("<%= RadTimePickerPickupTime.ClientID %>");
      picker.showTimePopup();
    }

    function ShowTimePopupTo() {
      var picker = $find("<%= RadTimePickerDropoffTime.ClientID %>");
      picker.showTimePopup();
    }

    function OnClientSelectedIndexChangedPickupLoc(sender, eventArgs) {
      var item = eventArgs.get_item();
      document.getElementById("MainContent_txtPickupLocID").value = item.get_index();
    }
    function OnClientSelectedIndexChangedReturnLoc(sender, eventArgs) {
      var item = eventArgs.get_item();
      document.getElementById("MainContent_txtDropoffLocID").value = item.get_index();
    }
    function OnClientSelectedIndexChangedCategoryType(sender, eventArgs) {
      if (bExistTxtCategoryType == true) {
        var item = eventArgs.get_item();
        document.getElementById("MainContent_txtCategoryType").value = item.get_index();
      }
    }
    function OnClientSelectedIndexChangedAge(sender, eventArgs) {
      if (bExistTxtAge == true) {
        //alert('hii');
        var item = eventArgs.get_item();
        document.getElementById("MainContent_txtAge").value = item.get_index();
      }
    }

    function pageLoad() {
      txtCategoryType = document.getElementById("MainContent_txtCategoryType");
      bExistTxtCategoryType = elementExists(txtCategoryType);

      txtAge = document.getElementById("MainContent_txtAge");
      bExistTxtAge = elementExists(txtAge);

      //alert('pageLoad');
      //var datepicker = $find("<%= RadDatePickerPickUpDate.ClientID %>");
      //datepicker.set_enabled(false);
      var iPLocSelectedIndex = document.getElementById("MainContent_txtPickupLocID").value;
      //alert(iPLocSelectedIndex);
      var combopickupLoc = $find("<%= combopickupLoc.ClientID%>");
      //alert(combopickupLoc.get_id);
      if (iPLocSelectedIndex != "") {
        combopickupLoc.set_value(combopickupLoc.get_items().getItem(iPLocSelectedIndex).get_value());
      }
      else {
        combopickupLoc.set_value(combopickupLoc.get_items().getItem(0).get_value());
      }
      var iDLocSelectedIndex = document.getElementById("MainContent_txtDropoffLocID").value;
      var combodropoffLoc = $find("<%= combodropoffLoc.ClientID%>");
      if (iDLocSelectedIndex != "") {
        combodropoffLoc.set_value(combodropoffLoc.get_items().getItem(iDLocSelectedIndex).get_value());
      }
      else {
        combodropoffLoc.set_value(combodropoffLoc.get_items().getItem(0).get_value());
      }
      if (bExistTxtCategoryType == true) {
        var iDLocSelectedIndex = document.getElementById("MainContent_txtCategoryType").value;
        var combocategoryType = $find("<%= combocategoryType.ClientID%>");
        combocategoryType.set_value(combocategoryType.get_items().getItem(iDLocSelectedIndex).get_value());
      }
      //txtAge
      if (bExistTxtAge == true) {
        var iAgeSelectedIndex = document.getElementById("MainContent_txtAge").value;
        //alert(iAgeSelectedIndex);
        var comboage = $find("<%= comboage.ClientID%>");
        comboage.set_value(comboage.get_items().getItem(iAgeSelectedIndex).get_value());
      }
      var calendar = $find("<%=RadDatePickerPickUpDate.ClientID%>");
        //calendar.add_dateClick(onDateClickHandler1);
        //calendar.add_dateClick(onDateClickHandler2);
    }  
  </script>
</asp:Content>
<asp:Content ID="Body" runat="server" ContentPlaceHolderID="MainContent" ViewStateMode="Disabled">
  <div class="StepHeader" runat="server" id="StepTitle1" style="text-align: left;">
    <%--<img src="./images/home_header.png" alt="home" />--%>
    <table border="0" width="100%">
      <tr>
        <td align="right" style="width: 23px; height: 23px;">
          <img src="./images/home_header_icon.png" alt="header" />
        </td>
        <td>
          Select Locations Dates and Times
        </td>
      </tr>
    </table>
  </div>
  <div id="maindiv">
    <div class="errordiv" runat="server" id="ErrorDiv" visible="false">
      <asp:Label ID="lblErrmsg" runat="server" Visible="false" Text="Sorry there's a problem"></asp:Label><br />
      <asp:Label ID="litErrorMessage" runat="server" CssClass="red" Visible="false"></asp:Label>
    </div>
    <table border="0" id="maintable" width="100%">
      <tr>
        <td>
          <asp:Label CssClass="text" ID="lblpickupLoc" runat="server">Pickup :</asp:Label>
        </td>
        <td>
          <%--<asp:DropDownList ID="combopickupLoc" runat="server" ViewStateMode="Disabled" />--%>
          <input type="hidden" runat="server" id="txtPickupLocID" />
          <telerik:RadComboBox runat="server" ID="combopickupLoc" Width="150px" onclientselectedindexchanged="OnClientSelectedIndexChangedPickupLoc" RenderingMode="Simple" />
        </td>
      </tr>
      <tr>
        <td>
          <asp:Label CssClass="text" ID="lblpickupDate" runat="server">Pickup Date :</asp:Label>
        </td>
        <td>
          <asp:DropDownList ID="combopickupday" runat="server" Visible="false" />
          <asp:DropDownList ID="combopickupmnth" runat="server" Visible="false" />
          <asp:DropDownList ID="combopickupyr" runat="server" Visible="false" />
          <telerik:RadDatePicker ID="RadDatePickerPickUpDate" runat="server" EnableTyping="false">
            <DateInput ID="DateInput1" ToolTip="" DateFormat="dd-MM-yyyy" runat="server" DisplayDateFormat="dd-MM-yyyy" onclick="ShowDatePopupFrom()">
              <%--<ClientEvents OnFocus="ShowDatePopupFrom" /><ClientEvents OnMouseOver="ShowDatePopupFrom" />--%>
            </DateInput>
            <DatePopupButton Visible="true" ToolTip="Select from date" />
          </telerik:RadDatePicker>

          <input id="PickUpDate" name="PickUpDate" style="display: none;" />&nbsp;<label id="alternate"
            style="vertical-align: top; text-align: left; display: none;"><font color="gray">Select
              date</font></label>&nbsp;<img alt="Cal" id='PickupCal' src='images/calendar-icon.png'
                style="vertical-align: text-top; display: none;" />
        </td>
      </tr>
      <tr id="tr_PickupTime" runat="server">
        <td>
          <asp:Label CssClass="text" ID="lblpickupTime" runat="server">Pickup Time :</asp:Label>
        </td>
        <td>
          <asp:DropDownList ID="combopickupTime" runat="server" Visible="false" />
          <telerik:RadTimePicker ID="RadTimePickerPickupTime" runat="server" EnableTyping="false" onclick='ShowTimePopupFrom()'>
            <%--<ClientEvents OnPopupClosing="ShowTimePopupFrom()" />--%>
          </telerik:RadTimePicker>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Label CssClass="text" ID="lbldropoffLoc" runat="server">Return :</asp:Label>
        </td>
        <td>
          <%--<asp:DropDownList ID="combodropoffLoc" runat="server"/>--%>
          <input type="hidden" runat="server" id="txtDropoffLocID" />
          <telerik:RadComboBox runat="server" ID="combodropoffLoc" Width="150px" onclientselectedindexchanged="OnClientSelectedIndexChangedReturnLoc" RenderingMode="Simple" />
        </td>
      </tr>
      <tr>
        <td>
          <asp:Label CssClass="text" ID="lbldropoffDate" runat="server">Return Date :</asp:Label>
        </td>
        <td>
          <asp:DropDownList ID="combodropoffday" runat="server" Visible="false" />
          <asp:DropDownList ID="combodropoffmnth" runat="server" Visible="false" />
          <asp:DropDownList ID="combodropoffyr" runat="server" Visible="false" />
          <telerik:RadDatePicker ID="RadDatePickerDropOffDate" runat="server" EnableTyping="false">
            <DateInput type="date" ID="DateInput2" ToolTip="" DateFormat="dd-MM-yyyy" runat="server" DisplayDateFormat="dd-MM-yyyy" onclick="ShowDatePopupTo()">
              <%--<ClientEvents OnFocus="ShowDatePopupTo" />--%>
            </DateInput>
            <DatePopupButton Visible="true" ToolTip="Select to date" />
          </telerik:RadDatePicker>

          <input name="DropOffDate" id="DropOffDate" style="display: none" />&nbsp;<label id="LabelDropOffDate"
            style="vertical-align: top; text-align: left; display: none"><font color="gray">Select
              date</font></label>&nbsp;<img alt="Cal" id='DropOffDateCal' src='images/calendar-icon.png'
                style="vertical-align: text-top; display: none" />
        </td>
      </tr>
      <tr id="tr_DropoffTime" runat="server">
        <td>
          <asp:Label CssClass="text" ID="lbldropoffTime" runat="server">Return Time :</asp:Label>
        </td>
        <td>
          <telerik:RadTimePicker ID="RadTimePickerDropoffTime" runat="server" onclick="ShowTimePopupTo()" EnableTyping="false" />
          <asp:DropDownList ID="combodropoffTime" runat="server" Visible="false" />
        </td>
      </tr>
      <tr id="tr_Category" runat="server">
        <td>
          <asp:Label CssClass="text" ID="lblcategoryType" runat="server">Category :</asp:Label>
        </td>
        <td>
          <%--<asp:DropDownList ID="combocategoryType" runat="server" />--%>
          <input type="hidden" runat="server" id="txtCategoryType" />
          <telerik:RadComboBox runat="server" ID="combocategoryType"  Width="150px" onclientselectedindexchanged="OnClientSelectedIndexChangedCategoryType" RenderingMode="Simple" />
        </td>
      </tr>
      <tr id="tr_Age" runat="server">
        <td>
          <asp:Label CssClass="RemoveWhite" ID="lbldriverage" runat="server">Youngest Driver : </asp:Label>
        </td>
        <td>
          <%--<asp:DropDownList ID="comboage" runat="server" />--%>
          <input type="hidden" runat="server" id="txtAge" />
          <telerik:RadComboBox runat="server" ID="comboage"  Width="150px" onclientselectedindexchanged="OnClientSelectedIndexChangedAge" RenderingMode="Simple" />
        </td>
      </tr>
      <tr id="tr_PromoCode" runat="server">
        <td>
          <asp:Label CssClass="text" ID="lblPromoCode" runat="server">Promo Code : </asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtPromoCode" runat="server" />
          <asp:HiddenField ID="hdnSecureKey" runat="server" />
        </td>
      </tr>
      <%--<tr>
<asp:TableCell ColumnSpan="2" CssClass="aligncenter">
<asp:Button ID="btnContinue" runat="server" Text="Continue" PostBackUrl="~/webStep1.aspx" />
</td>
</tr>--%>
    </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="StepTitle" style="padding: 0px;">
          <asp:Button ID="btnContinue" CssClass="Button" runat="server" Text="Continue" PostBackUrl="~/webStep1.aspx" />
          <%--<asp:ImageButton ID="btnContinue" runat="server" ImageUrl="~/images/continue.png"
        AlternateText="Continue" ImageAlign="Right" />--%>
        </td>
        <td class="StepTitle">
          &nbsp;
        </td>
      </tr>
      <tr>
        <td>
          <PoweredBy:Control ID="step1PoweredBy" runat="server" />
        </td>
      </tr>
    </table>
  </div>
</asp:Content>
