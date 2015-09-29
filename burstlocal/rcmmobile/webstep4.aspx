<%@ Page Language="VB" MasterPageFile="Site.master" AutoEventWireup="false" CodeFile="webstep4.aspx.vb"
  Inherits="webstep4" %>

<%@ Register Src="~/userControls/Footer.ascx" TagName="Control" TagPrefix="footer" %>
<%@ Register Src="~/userControls/HeaderStep45.ascx" TagName="Control" TagPrefix="header" %>
<%@ Register Src="~/userControls/HeaderLabels.ascx" TagName="Control" TagPrefix="LabelText" %>
<%@ Register Src="~/userControls/PoweredBy.ascx" TagName="Control" TagPrefix="PoweredBy" %>
<%@ Import Namespace="mRCMAPI" %>
<asp:Content ID="head" ContentPlaceHolderID="HeadContent" runat="Server">
  <script type="text/javascript" language="javascript">
    function ValidateCheckBox(sender, args) {
      if (document.getElementById("<%=chkbxTerms.ClientID %>").checked == true) {
        args.IsValid = true;
      } else {
        args.IsValid = false;
      }
    }
    function ShowdatePrimaryDriverDOB() {
      //alert('pageLoad');
      $find("<%= datePrimaryDriverDOB.ClientID %>").showPopup();
    }
    function ShowdateLicenseExpiry() {
      $find("<%= dateLicenseExpiry.ClientID %>").showPopup();
    }

    function pageLoad() {
      if (getParameterByName("type") != "quote") {
        //alert("booking");

        var ddlRentalSourceID = $find("<%= ddlRentalSourceID.ClientID%>");
        //alert("Count : " + ddlRentalSourceID.get_items().get_count());
        if ((ddlRentalSourceID != null) && (ddlRentalSourceID.get_items().get_count() >0)) {
          ddlRentalSourceID.set_value(ddlRentalSourceID.get_items().getItem(0).get_value());
        }
        var comboBoxLicenseIssuedCountry = $find("<%= ddlLicenseIssuedCountry.ClientID %>");
        comboBoxLicenseIssuedCountry.set_text("Australia");
        comboBoxLicenseIssuedCountry.set_value("7");

        var comboBoxCustomerCountryID = $find("<%= ddlCustomerCountryID.ClientID %>");
        comboBoxCustomerCountryID.set_text("Australia");
        comboBoxCustomerCountryID.set_value("7");
      }
    }

  </script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
  <script type="text/javascript">
    $(function () {
      //alert($("#MainContent_chkbxTerms").checked != false);
      /*
      $("#MainContent_btnRequestBooking").click(function (e) {

        if ($('input[id=MainContent_chkbxTerms]').is(':checked') == false) {
          document.getElementById("MainContent_btnRequestBookingError").style.display = "block";
          return false;
        }
      });
      */
    });

    function trOpenAdditionalContactDetails(id, idHide) {
      //alert('Hii');
      /*
      MainContent_trBDOB
      MainContent_trLicense
      MainContent_trLicenseIssued
      MainContent_trExpiry
      MainContent_tr_address
      MainContent_tr_city
      MainContent_tr_state
      MainContent_tr_postcode
      MainContent_tr_Country
      MainContent_tr_RentalSource
      MainContent_tr_AdditionalDetailBlank
      */
      var style_MainContent_tr_AdditionalDetailBlank = document.getElementById("MainContent_tr_AdditionalDetailBlank").style;
      //alert("style_MainContent_tr_AdditionalDetailBlank.display: " + style_MainContent_tr_AdditionalDetailBlank.display);
      if (style_MainContent_tr_AdditionalDetailBlank.display == "block") {
        style_MainContent_tr_AdditionalDetailBlank.display = "none";
      }
      else {
        style_MainContent_tr_AdditionalDetailBlank.display = "block";
      }

      var style_MainContent_trBDOB = document.getElementById("MainContent_trBDOB").style;
      if (style_MainContent_trBDOB.display == "none") {
        style_MainContent_trBDOB.display = "table-row";
      }
      else {
        style_MainContent_trBDOB.display = "none";
      }

      var style_MainContent_trLicense = document.getElementById("MainContent_trLicense").style;
      if (style_MainContent_trLicense.display == "none") {
        style_MainContent_trLicense.display = "table-row";
      }
      else {
        style_MainContent_trLicense.display = "none";
      }

      var style_MainContent_trLicenseIssued = document.getElementById("MainContent_trLicenseIssued").style;
      if (style_MainContent_trLicenseIssued.display == "none") {
        style_MainContent_trLicenseIssued.display = "table-row";
      }
      else {
        style_MainContent_trLicenseIssued.display = "none";
      }

      var style_MainContent_trExpiry = document.getElementById("MainContent_trExpiry").style;
      if (style_MainContent_trExpiry.display == "none") {
        style_MainContent_trExpiry.display = "table-row";
      }
      else {
        style_MainContent_trExpiry.display = "none";
      }

      var style_MainContent_tr_address = document.getElementById("MainContent_tr_address").style;
      if (style_MainContent_tr_address.display == "none") {
        style_MainContent_tr_address.display = "table-row";
      }
      else {
        style_MainContent_tr_address.display = "none";
      }

      var style_MainContent_tr_city = document.getElementById("MainContent_tr_city").style;
      if (style_MainContent_tr_city.display == "none") {
        style_MainContent_tr_city.display = "table-row";
      }
      else {
        style_MainContent_tr_city.display = "none";
      }
      /*
      var style_MainContent_tr_state = document.getElementById("MainContent_tr_state").style;
      if (style_MainContent_tr_state.display == "none") {
      style_MainContent_tr_state.display = "table-row";
      }
      else {
      style_MainContent_tr_state.display = "none";
      }
      */
      var style_MainContent_tr_postcode = document.getElementById("MainContent_tr_postcode").style;
      if (style_MainContent_tr_postcode.display == "none") {
        style_MainContent_tr_postcode.display = "table-row";
      }
      else {
        style_MainContent_tr_postcode.display = "none";
      }

      var style_MainContent_tr_Country = document.getElementById("MainContent_tr_Country").style;
      if (style_MainContent_tr_Country.display == "none") {
        style_MainContent_tr_Country.display = "table-row";
      }
      else {
        style_MainContent_tr_Country.display = "none";
      }

      var style_MainContent_trFlight = document.getElementById("MainContent_trFlight").style;
      if (style_MainContent_trFlight.display == "none") {
        style_MainContent_trFlight.display = "table-row";
      }
      else {
        style_MainContent_trFlight.display = "none";
      }
      
      //var tr_RentalSource = document.getElementById("MainContent_tr_RentalSource");
      var iLenghtRentalSource = $('#MainContent_tr_RentalSource').length;
      //alert(iLenghtRentalSource);
      if (iLenghtRentalSource != 0) {
        var style_MainContent_tr_RentalSource = document.getElementById("MainContent_tr_RentalSource").style;
        if (style_MainContent_tr_RentalSource.display == "none") {
          style_MainContent_tr_RentalSource.display = "table-row";
        }
        else {
          style_MainContent_tr_RentalSource.display = "none";
        }
      }

    }

  </script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
  <header:Control ID="step4header" runat="server" />
  <div id="maindiv">
    <div class="errordiv" runat="server" id="ErrorDiv" visible="false">
      <asp:Label ID="lblErrmsg" runat="server" Visible="false" Text="Sorry there's a problem" /><br />
      <asp:Label ID="litErrorMessage" runat="server" CssClass="red" Visible="false" />
    </div>
    <asp:ValidationSummary ID="valid" runat="server" ShowMessageBox="false" ShowSummary="false" />
    <asp:Table runat="server" ID="mainTable1" BorderWidth="0" CellPadding="0" CellSpacing="0"
      Width="100%">
      <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2" class="ImageCar">
                &nbsp;
                <asp:Image ID="imgCar" runat="server" Height="100" Width="200" AlternateText="Car" />
              </td>
            </tr>
            <tr>
              <td align="left" style="width:25%" valign="top">
                &nbsp;
                <asp:Label CssClass="text" ID="LabelDescription" runat="server" Text="Desc:" />
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblVehicle" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">
                &nbsp;
                <asp:Label CssClass="text" ID="LabelPickup" runat="server">Pickup : </asp:Label>
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblPLoc" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">
                &nbsp;
                <asp:Label CssClass="text" ID="Label16" runat="server" />
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblPDateTime" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">
                &nbsp;
                <asp:Label CssClass="text" ID="LabelReturn" runat="server">Return : </asp:Label>
              </td>
              <td>
                <asp:Label CssClass="text" ID="lblDLoc" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">
                &nbsp;
                <asp:Label CssClass="textPad" ID="Label18" runat="server"></asp:Label>
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblDDateTime" runat="server"></asp:Label>
              </td>
            </tr>
          </table>
        </asp:TableCell></asp:TableRow><asp:TableRow CssClass="detailsSelection" Style="cursor: pointer; height: 30px; padding: 5px 0 2px 0;"
        onclick="javascript:trOpen('MainContent_tr_AllFeeDetails_','','MainContent_tr_AllFeeDetailsBlank');">
        <asp:TableCell ColumnSpan="1" ID="rateTitle" runat="server">
          <LabelText:Control ID="LabelTextRateSummary" runat="server" />
        </asp:TableCell><asp:TableCell ColumnSpan="1" ID="TableCell1" runat="server">
                <img src='./images/white_arrow.png' style="text-align:right; float:right;" />
        </asp:TableCell></asp:TableRow><asp:TableRow>
        <asp:TableCell ColumnSpan="2" Width="100%">
          <table runat="server" id="maintable" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr id="tr_DisplayVehicleFreeDayDetails_" style='display: none;'>
              <td class="text" align="left" colspan="1">
                <asp:Literal ID="ltrDisplayVehicleFreeDayDetails_" runat="server" />
              </td>
            </tr>
            <tr id="tr_AllSeasonRates_" style='display: none;'>
              <td class="text" align="left" colspan="1">
                <asp:Literal ID="ltrAllSeasonRates_" runat="server" />
              </td>
            </tr>
            <tr id="tr_AllFeeDetails_" style='display: none;'>
              <td class="text" align="left" colspan="1">
                <asp:Literal ID="ltrAllFeeDetails_" runat="server" />
              </td>
            </tr>
            <tr id="tr_AllFeeDetailsBlank" runat="server" style='display: block;'>
              <td style="height: 2px;" colspan="2">
                &nbsp;
              </td>
            </tr>
            <tr id="tr_AlreadyCustomer">
              <td>
                <table runat="server" id="pnlAlreadyCustomer" visible="true" border="0" width="100%"
                  cellpadding="0" cellspacing="0">
                  <tr id="Tr1" runat="server" class="detailsSelection" style="cursor: pointer; height: 30px;
                    padding: 5px 0 2px 0;" onclick="javascript:trOpen('MainContent_PanelAlreadyCustomer','','MainContent_tr_AlreadyCustomerBlank');">
                    <td colspan="1">
                      <LabelText:Control ID="LabelTextAlreadyCustomer" runat="server" />
                    </td>
                    <td align='right'>
                      <img src='./images/white_arrow.png' />
                    </td>
                  </tr>
                  <tr id="PanelAlreadyCustomer" style='display: none;'>
                    <td colspan="2">
                      <table width="100%" cellpadding="0" cellspacing="0">
                        <tr valign="top" style="white-space: nowrap;">
                          <td>
                            &nbsp;<asp:Label ID="lblLastname_pnlAlreadyCustomer" CssClass="text" runat="server">Last Name</asp:Label>
                            <asp:Label ID="txtAstrik_pnlAlreadyCustomer" CssClass="red" runat="server" Text="*" />
                          </td>
                          <td>
                            <asp:TextBox ID="txtLastName_pnlAlreadyCustomer" runat="server" MaxLength="30" size="20" />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6_pnlAlreadyCustomer" runat="server"
                              ControlToValidate="txtLastName_pnlAlreadyCustomer" ErrorMessage="Last Name required"
                              ValidationGroup="validate_PnlAlreadyCustomer" CssClass="red" Text=" " Display="Dynamic" />
                          </td>
                        </tr>
                        <tr valign="top">
                          <td>
                            &nbsp;<asp:Label CssClass="text" ID="lblEmail_pnlAlreadyCustomer" runat="server"
                              Text="Email" />
                            <asp:Label ID="lblAsrikEmail_pnlAlreadyCustomer" CssClass="red" type="email" runat="server"
                              Text="*" />
                          </td>
                          <td>
                            <asp:TextBox ID="txtEmail_pnlAlreadyCustomer" runat="server" type="email" MaxLength="50"
                              size="20" />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail_pnlAlreadyCustomer"
                              ErrorMessage="Email required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlAlreadyCustomer" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtEmail_pnlAlreadyCustomer"
                              ErrorMessage="Invalid Email" CssClass="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                              Display="Dynamic" ValidationGroup="validate_PnlAlreadyCustomer" />
                          </td>
                        </tr>
                        <tr class="text" align="right">
                          <td style="padding-bottom: 10px; padding-right: 10px;" align="right" colspan="2">
                            <%--<asp:Button ID="btnExistingCustomer" runat="server" Text="            " ValidationGroup="validate_PnlAlreadyCustomer"
                              Style="background-image: url(images/continue__.png); width: 92px; height: 26px;
                              cursor: pointer; background-repeat: no-repeat;" BackColor="Transparent" BorderStyle="None"
                              ForeColor="Transparent" Height="26px" Width="92px" />--%>
                            <asp:Button ID="btnExistingCustomer" CssClass="ButtonStep34" Text="Continue" runat="server"
                              ValidationGroup="validate_PnlAlreadyCustomer" />
                            <%--<asp:ImageButton ID="btnExistingCustomer" runat="server" ImageUrl="images/continue__.png" ValidationGroup="validate_PnlAlreadyCustomer" ImageAlign="Right" />--%>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr id="tr_AlreadyCustomerBlank" runat="server" style='display: block;'>
                    <td style="height: 2px;" colspan="2">
                      &nbsp;
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <%--<asp:Panel runat="server" ID="pnlBooking" Visible="false">--%>
                <table runat="server" id="TableBooking" visible="true" border="0" width="100%" cellpadding="0"
                  cellspacing="0">
                  <tr id="sectiontxt" runat="server" class="detailsTr">
                    <td colspan="2">
                      <%--<asp:Label CssClass="white" ID="lblEnteryourContactDetails" Text="Enter your Contact Details " runat="server" />--%>
                      <%--<img src="./images/contactdetails.png" alt="Enter your Contact Details" />--%>
                      <LabelText:Control ID="LabelTextEnterYourContactDetails" runat="server" />
                    </td>
                    <%--<td align="right">
                <img src="./images/secure.png" alt="Secure" />
              </td>--%>
                  </tr>
                  <tr valign="top" style="white-space: nowrap; padding-top: 2px;">
                    <td>
                      &nbsp;<asp:Label ID="lblBFname" CssClass="text" runat="server" Text="First Name" />
                      <asp:Label ID="Label4" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td>
                      <asp:TextBox ID="txtCustomerFirstName" runat="server" MaxLength="30" size="20" />
                      <br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerFirstName"
                        ErrorMessage="First Name required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                    </td>
                  </tr>
                  <tr valign="top" style="white-space: nowrap;">
                    <td>
                      &nbsp;<asp:Label ID="lblBLname" CssClass="text" runat="server" Text="Last Name" />
                      <asp:Label ID="Label5" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td>
                      <asp:TextBox ID="txtCustomerLastName" runat="server" MaxLength="30" size="20" />
                      <br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCustomerLastName"
                        ErrorMessage="Last Name required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                    </td>
                  </tr>
                  <tr valign="top" runat="server" id="trNoTravelling">
                    <td>
                      &nbsp;<asp:Label CssClass="text" ID="lblBNoTravelling" runat="server" Text="No. People" />
                      <asp:Label ID="Label7" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td>
                      <asp:TextBox ID="txtNoOfTravelling" runat="server" MaxLength="20" size="20" autocorrect="off"
                        defVal="{Required|PhoneNumber, 'Zip'}" type="number" min="1" />
                      <br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtNoOfTravelling"
                        ErrorMessage="No Travelling required" CssClass="red" Text=" " Display="Dynamic"
                        ValidationGroup="validate_PnlCustomer" />
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtNoOfTravelling"
                        ErrorMessage="Please enter numbers only" CssClass="red" Text="*" ValidationExpression="^\d+$"
                        Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                    </td>
                  </tr>
                  <tr valign="top">
                    <td>
                      &nbsp;<asp:Label CssClass="text" ID="lblBEmail" runat="server" Text="Email" />
                      <asp:Label ID="Label6" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td>
                      <asp:TextBox ID="txtCustomerEmailID" runat="server" type="email" MaxLength="50" size="20" />
                      <br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtCustomerEmailID"
                        ErrorMessage="Email required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCustomerEmailID"
                        ErrorMessage="Invalid Email" CssClass="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                    </td>
                  </tr>
                  <tr valign="top">
                    <td>
                      &nbsp;<asp:Label CssClass="text" ID="lblBPhone" runat="server" Text="Phone" />
                      <asp:Label ID="Label9" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td>
                      <asp:TextBox ID="txtCustomerPhone" runat="server" MaxLength="20" size="20" type="tel"
                        inputmode="digits" CssClass="phone" autocorrect="off" defVal="{Required|PhoneNumber, 'Phone'}" />
                      <%--<input name="ctl05$p$ctl01$txtPhone" type="tel" maxlength="16" id="ctl05_p_ctl01_txtPhone" autocorrect="off" placeholder="Enter your phone number" defVal="{Required|PhoneNumber, 'Phone'}" />--%>
                      <br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCustomerPhone"
                        ErrorMessage="Phone number required" CssClass="red" Text=" " Display="Dynamic"
                        ValidationGroup="validate_PnlCustomer" />
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtCustomerPhone"
                        ErrorMessage="Invalid Phone" CssClass="red" ValidationExpression="^(\+\d*|\d*)$"
                        Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                    </td>
                  </tr>
                  <tr class="detailsSelection" style="cursor: pointer; height: 30px; padding: 5px 0 2px 0;"
                    onclick="javascript:trOpenAdditionalContactDetails();" runat="server" id="tr_AdditionalDetails">
                    <td colspan="2">
                      <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                          <td colspan="1" id="TableCell2" runat="server">
                            <LabelText:Control ID="LabelTextAdditionalContactDetails" runat="server" />
                          </td>
                          <td id="TableCell3" runat="server">
                            <img alt=">" src='./images/white_arrow.png' style="text-align: right; float: right;" />
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr valign="top" runat="server" id="trBDOB" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label CssClass="text" ID="lblBDOB" runat="server" Text="DOB" />
                      <asp:Label ID="star_dob" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td style="padding: 2px;">
                      <%--<asp:DropDownList ID="ddlPrimaryDriverDOBDay" runat="server" /><asp:DropDownList ID="ddlPrimaryDriverDOBMonth" runat="server" /><asp:DropDownList ID="ddlPrimaryDriverDOBYear" runat="server" />--%>
                      <telerik:RadDatePicker ID="datePrimaryDriverDOB" runat="server" EnableTyping="false">
                        <DateInput type="date" ID="DateInput2" ToolTip="" DateFormat="dd-MM-yyyy" runat="server"
                          DisplayDateFormat="dd-MM-yyyy" onclick="ShowdatePrimaryDriverDOB()" />
                        <DatePopupButton Visible="true" ToolTip="Select to date" />
                      </telerik:RadDatePicker>
                    </td>
                  </tr>
                  <tr valign="top" runat="server" id="trLicense" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblLicense" CssClass="text" runat="server" Text="License No" />
                      <asp:Label ID="star_License" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td>
                      <asp:TextBox ID="txtPrimaryDriverLicenseNo" runat="server" MaxLength="30" size="20" />
                      <%--<br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPrimaryDriverLicenseNo"
                        ErrorMessage="licence number required" CssClass="red" Text=" " Display="Dynamic"
                        ValidationGroup="validate_PnlCustomer" />--%>
                    </td>
                  </tr>
                  <tr valign="top" runat="server" id="trLicenseIssued" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblLicenseIssued" CssClass="text" runat="server" Text="Issued in" />
                      <asp:Label ID="star_LicenseIssued" CssClass="red" runat="server" Text="*" />
                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtLicenseIssuedCountry" ErrorMessage="License Issued required" CssClass="red" Text="*" />--%>
                    </td>
                    <td style="padding: 2px;">
                      <%--<asp:TextBox ID="txtLicenseIssuedCountry" runat="server" MaxLength="80" size="20" />--%>
                      <%--<asp:DropDownList ID="ddlLicenseIssuedCountry" runat="server" />--%>
                      <telerik:RadComboBox runat="server" ID="ddlLicenseIssuedCountry" Width="150px" />
                      <%--<br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPrimaryDriverLicenseNo"
                        ErrorMessage="Country required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />--%>
                    </td>
                  </tr>
                  <tr runat="server" visible="true" id="trExpiry" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblExpiry" CssClass="text" runat="server" Text="Expiry Date" />
                      <asp:Label ID="star_Expiry" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td style="padding: 2px;">
                      <%--<asp:DropDownList ID="ddlLicenseExpiryDateDay" runat="server" /><asp:DropDownList ID="ddlLicenseExpiryDateMonth" runat="server" /><asp:DropDownList ID="ddlLicenseExpiryDateYear" runat="server" />--%>
                      <telerik:RadDatePicker ID="dateLicenseExpiry" runat="server" EnableTyping="false">
                        <DateInput type="date" ID="DateInput1" ToolTip="" DateFormat="dd-MM-yyyy" runat="server"
                          DisplayDateFormat="dd-MM-yyyy" onclick="ShowdateLicenseExpiry()" />
                        <DatePopupButton Visible="true" ToolTip="Select to date" />
                      </telerik:RadDatePicker>
                    </td>
                  </tr>
                  <tr id="tr_address" runat="server" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblBAddress" CssClass="text" runat="server" Text="Address" />
                      <asp:Label ID="star_BAddress" CssClass="red" runat="server" Text="*" />
                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address required" CssClass="red" Text="*" />--%>
                    </td>
                    <td>
                      <asp:TextBox ID="txtAddress" runat="server" MaxLength="80" size="20" />
                      <%--<br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="Address required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />--%>
                    </td>
                  </tr>
                  <tr id="tr_city" runat="server" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblBCity" CssClass="text" runat="server" Text="City" />
                      <asp:Label ID="star_city" Visible="false" CssClass="red" runat="server" Text="*" />
                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCity" ErrorMessage="City required" CssClass="red" Text="*" />--%>
                    </td>
                    <td>
                      <asp:TextBox ID="txtCity" runat="server" MaxLength="30" size="20" />
                      <%--<br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="City required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />--%>
                    </td>
                  </tr>
                  <tr runat="server" visible="false" id="tr_state" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblBState" CssClass="text" runat="server">State/Province</asp:Label>
                    </td>
                    <td>
                      <asp:TextBox ID="txtStateProvince" runat="server" MaxLength="30" size="20" />
                    </td>
                  </tr>
                  <tr runat="server" visible="true" id="tr_postcode" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblBZip" CssClass="text" runat="server" Text="Postcode/ZIP" />
                      <asp:Label ID="Label11" Visible="false" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td>
                      <asp:TextBox ID="txtPostalCode" runat="server" MaxLength="10" size="20" />
                      <%--<br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPostalCode"
                        ErrorMessage="Postal Code required" CssClass="red" Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />--%>
                    </td>
                  </tr>
                  <tr runat="server" visible="true" id="tr_Country" style='display: none;'>
                    <td>
                      &nbsp;<asp:Label ID="lblBCountry" CssClass="text" runat="server" Text="Country" />
                      <asp:Label Visible="false" ID="Label19" CssClass="red" runat="server" Text="*" />
                    </td>
                    <td style="padding: 2px;">
                      <%--<asp:DropDownList ID="ddlCustomerCountryID" runat="server" />--%>
                      <telerik:RadComboBox runat="server" ID="ddlCustomerCountryID" Width="150px" />
                    </td>
                  </tr>
                  <tr runat="server" visible="true" id="tr_RentalSource" style='display: none;'>
                    <td style="white-space: nowrap;">
                      &nbsp;<asp:Label ID="lblBRentalSource" CssClass="text" runat="server" Visible="true">Found us where?</asp:Label>
                    </td>
                    <td style="padding: 2px;">
                      <%--<asp:DropDownList ID="ddlRentalSourceID" runat="server" Visible="true" />--%>
                      <telerik:RadComboBox runat="server" ID="ddlRentalSourceID" Width="150px" />
                    </td>
                  </tr>
                  <tr runat="server" visible="true" id="trFlight" style='display: none;'>
                    <td style="white-space: nowrap;">
                      &nbsp;<asp:Label ID="lblFlight" CssClass="text" runat="server">Arrival flight(if airport pickup)</asp:Label>
                    </td>
                    <td style="padding: 2px;">
                      <asp:TextBox ID="txtArrivalFlight" runat="server" MaxLength="20" size="20" /><br />
                      <asp:RequiredFieldValidator ID="RvalArrivalFlight" Enabled="false" runat="server"
                              ControlToValidate="txtArrivalFlight" ErrorMessage="Flight No. Required"
                              ValidationGroup="validate_PnlCustomer" CssClass="red" Text=" " Display="Dynamic" />
                    </td>
                  </tr>
                  <tr runat="server" visible="false">
                    <td>
                      <asp:Label ID="lblPickReq" CssClass="text" runat="server">Pick Up Required From</asp:Label>
                    </td>
                    <td>
                      <asp:TextBox ID="txtPickUpRequiredFrom" runat="server" MaxLength="20" size="20" />
                    </td>
                  </tr>
                  <tr runat="server" visible="false">
                    <td>
                      <asp:Label ID="lblDropReq" CssClass="text" runat="server">Drop Off Required to</asp:Label>
                    </td>
                    <td>
                      <asp:TextBox ID="txtDropOffRequiredTo" runat="server" MaxLength="20" size="20" />
                    </td>
                  </tr>
                  <tr runat="server" visible="false">
                    <td>
                      <asp:Label ID="lblBtransmission" CssClass="text" runat="server">Preference for car transmission</asp:Label>
                    </td>
                    <td>
                      <asp:DropDownList ID="Btransmission" runat="server">
                      </asp:DropDownList>
                    </td>
                  </tr>
                  <tr runat="server" visible="false">
                    <td>
                      <asp:Label ID="lblBAddDet" CssClass="text" runat="server">Special Requests or Additional Details</asp:Label>
                    </td>
                    <td>
                      <asp:TextBox ID="txtAdditionalDetails" runat="server" ClientIDMode="AutoID" TextMode="MultiLine"
                        Width="130" />
                    </td>
                  </tr>
                  <tr id="tr_AdditionalDetailBlank" style='display: block;'>
                    <td class="text" align="left" colspan="2">
                      &nbsp;
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      <tr runat="server" visible="true" class="detailsSelection" id="CCHeader">
                        <%--<td colspan="2" id="CCDetails" runat="server">
                      <asp:Label ID="lblCCDetails" CssClass="white" runat="server" Text="Enter Your Payment Details"></asp:Label>
                    </td>--%>
                        <td colspan="2">
                          <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                              <td>
                                <%--<img src="./images/payment.png" alt="Enter Your Payment Details" />--%>
                                <LabelText:Control ID="LabelTextPayment" runat="server" />
                              </td>
                              <td align="right">
                                <img src="./images/lock-60.png" alt="Secure" />
                              </td>
                            </tr>
                          </table>
                        </td>
                        <%--<asp:Label CssClass="white" ID="lblEnteryourContactDetails" Text="Enter your Contact Details " runat="server" />--%>
                        <%--&nbsp;<asp:Label CssClass="AlreadyCustomer" ID="Label21" Text=" Enter Your Payment Details " runat="server" />--%>
                      </tr>
                      <tr runat="server" visible="false">
                        <td colspan="2" class="text" align="left">
                          <asp:Label ID="lblDPSPaymentMsg" runat="server" />
                        </td>
                      </tr>
                      <tr  runat="server" id="tr_CCMessage">
                        <td colspan="2"><div class="CCExtraMessage"><asp:Label runat="server" ID="lblCCMessage_" /></div></td>
                      </tr>
                    <%--  <tr runat="server" id="tr_CCType">
                        <td class='text'>
                          &nbsp;Card Type
                          <asp:Label ID="Label12" CssClass="red" runat="server" Text="*" />
                        </td>
                        <td style="padding: 2px;">
                          <asp:DropDownList ID="ddlCCType" runat="server" />
                          <br />
                          <asp:RequiredFieldValidator ID="rfvalddlCCType" runat="server" ControlToValidate="ddlCCType"
                            InitialValue="Select Card" ErrorMessage="* Card Type required" CssClass="red" Text=" "
                            Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                        </td>
                      </tr>
                      <tr runat="server" id="tr_CardNumber">
                        <td class='text'>
                          &nbsp;Card number
                          <asp:Label ID="Label13" CssClass="red" Visible="false" runat="server" Text="*" />
                        </td>
                        <td>
                          <asp:TextBox ID="txtCardNumber" type="number" min="10" runat="server" MaxLength="16" />
                          <br />
                          <asp:RequiredFieldValidator ID="rfvaltxtCardNumber" runat="server" ControlToValidate="txtCardNumber"
                            ErrorMessage="* Card Number required" CssClass="red" Text=" " Display="Dynamic"
                            ValidationGroup="validate_PnlCustomer" />
                          <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtCardNumber"
                            ID="ReValtxtCardNumber" ValidationGroup="validate_PnlCustomer" ValidationExpression="^[\d+]{10,16}$"
                            CssClass="red" runat="server" ErrorMessage="* Min 10 characters allowed." />
                        </td>
                      </tr>
                      <tr runat="server" id="tr_NameOnCard">
                        <td class='text'>
                          &nbsp;Name
                          <asp:Label ID="Label15" Visible="false" CssClass="red" runat="server" Text="*" />
                        </td>
                        <td>
                          <asp:TextBox ID="txtNameOnCard" runat="server" />
                          <br />
                          <asp:RequiredFieldValidator ID="rfvaltxtNameOnCard" runat="server" ControlToValidate="txtNameOnCard"
                            ErrorMessage="* Name on Card required" CssClass="red" Text=" " Display="Dynamic"
                            ValidationGroup="validate_PnlCustomer" />
                        </td>
                      </tr>
                      <tr runat="server" id="tr_ExpiryDate">
                        <td class='text'>
                          &nbsp;Expiry Date
                        </td>
                        <td style="padding: 2px;">
                          <asp:DropDownList ID="ddlExpiryDateMonth" runat="server" ValidationGroup="valid" />
                          <asp:DropDownList ID="ddlExpiryDateYear" runat="server" ValidationGroup="valid" />
                         
                          <asp:RequiredFieldValidator ID="rfvalddlExpiryDateMonth" runat="server" ControlToValidate="ddlExpiryDateMonth"
                            InitialValue="Mon" ErrorMessage="<br />* Expiry month required" CssClass="red"
                            Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                          <asp:RequiredFieldValidator ID="rfvalddlExpiryDateYear" runat="server" ControlToValidate="ddlExpiryDateYear"
                            InitialValue="Year" ErrorMessage="<br />* Expiry year required" CssClass="red"
                            Text=" " Display="Dynamic" ValidationGroup="validate_PnlCustomer" />
                        </td>
                      </tr>
                      <tr runat="server" id="tr_CVV">
                        <td class='text'>
                          &nbsp;CCV
                          <asp:Label ID="Label14" CssClass="red" runat="server" Visible="false" Text="*" />
                          <a class='red' href="javascript:window.open('cvv.htm','','width=200,height=200');">
                            <img src="./images/information.png" width="18" height="18" alt="?" style="vertical-align: text-bottom;
                              border: 0px;" /></a>
                        </td>
                        <td>
                          <asp:TextBox ID="txtCCV" type="number" min="3" runat="server" MaxLength="4" />
                          <br />
                          <asp:RequiredFieldValidator ID="rfvaltxtCCV" runat="server" ControlToValidate="txtCCV"
                            ErrorMessage="* CCV Number required" CssClass="red" Text=" " Display="Dynamic"
                            ValidationGroup="validate_PnlCustomer" />
                          <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtCCV" ID="ReValtxtCCV"
                            ValidationGroup="validate_PnlCustomer" ValidationExpression="^[\d+]{3,5}$" CssClass="red"
                            runat="server" ErrorMessage="* Min 3 characters allowed." />
                        </td>
                      </tr>--%>
                      <tr runat="server" id="tr_chkbxTerms">
                        <td class='text' colspan="2">
                          <asp:Label ID="Label1" CssClass="red" runat="server" Visible="false" Text="*" />
                          <%--<a class='text' href="javascript:window.open('cvv.htm','','width=200,height=200');"></a>--%>
                          <b>Accept Terms and Conditions </b>
                          <asp:CheckBox ID="chkbxTerms" runat="server" Checked="false" /><%--<span id="MainContent_btnRequestBookingError"
                            class="red" style="display: none;">* Please Select Terms & Condition.</span>--%>
                          <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="* Please Select Terms & Condition."
                            ValidationGroup="validate_PnlCustomer" Display="Dynamic" CssClass="red" ClientValidationFunction="ValidateCheckBox" />
                        </td>
                      </tr>
                      <%--<tr>
                    <td colspan="2" align="center">
                      &nbsp;
                    </td>
                  </tr>--%>
                    </td>
                  </tr>
                  <tr valign="middle" id="btnBook" runat="server">
                    <td colspan="2" align="right" style="padding: 10px;">
                      <%--<asp:ImageButton ID="btnRequestBooking1" runat="server" ImageUrl="~/images/btnBookingw4.png" ImageAlign="Right" />--%>
                      <asp:Button ID="btnRequestBooking" CssClass="ButtonStep34" runat="server" ValidationGroup="validate_PnlCustomer" />
                      <%--<asp:ImageButton ID="btnRequestBooking" runat="server" ValidationGroup="validate_PnlCustomer" ImageAlign="Right" />--%>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr runat="server" visible="false">
              <td colspan="2" class="StepTitle">
                <table width="100%">
                  <asp:Literal ID="ltrDPS" runat="server" Visible="false" />
                </table>
              </td>
            </tr>
          </table>
        </asp:TableCell></asp:TableRow></asp:Table></div></asp:Content><asp:Content ID="footer" ContentPlaceHolderID="FooterContent" runat="Server">
  <footer:Control ID="step4footer" runat="server" />
  <table>
    <tr>
      <td align="left">
        <PoweredBy:Control ID="step4PoweredBy" runat="server" />
      </td>
    </tr>
  </table>
</asp:Content>
