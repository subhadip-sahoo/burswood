<%@ Page Language="VB" MasterPageFile="Site.master" AutoEventWireup="false" CodeFile="WebStep3.aspx.vb"
  Inherits="WebStep3" %>

<%@ Register Src="~/userControls/Footer.ascx" TagName="Control" TagPrefix="footer" %>
<%@ Register Src="~/userControls/HeaderStep45.ascx" TagName="Control" TagPrefix="header" %>
<%@ Register Src="~/userControls/HeaderLabels.ascx" TagName="Control" TagPrefix="LabelText" %>
<%@ Register Src="~/userControls/PoweredBy.ascx" TagName="Control" TagPrefix="PoweredBy" %>
<%@ Import Namespace="mRCMAPI" %>
<asp:Content ID="head" ContentPlaceHolderID="HeadContent" runat="Server" />
<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
  <header:Control ID="step3header" runat="server" />
  <div id="maindiv">
    <div class="errordiv" runat="server" id="ErrorDiv" visible="false">
      <asp:Label ID="lblErrmsg" runat="server" Visible="false" Text="Sorry there's a problem"></asp:Label><br />
      <asp:Label ID="litErrorMessage" runat="server" CssClass="red" Visible="false"></asp:Label>
    </div>
    <asp:Table runat="server" ID="maintable" BorderWidth="0" BorderColor="Black" CellPadding="0"
      CellSpacing="0" Width="100%">
      <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2" class="ImageCar">&nbsp;
                <asp:Image ID="imgCar" runat="server" Height="100" Width="200" AlternateText="Car" />
              </td>
            </tr>
            <tr>
              <td align="left" Style="width:25%" Valign="top">&nbsp;
                <asp:Label CssClass="text" ID="Label1" runat="server" Text="Desc : " />
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblVehicle" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">&nbsp;
                <asp:Label CssClass="text" ID="Label2" runat="server">Pickup : </asp:Label>
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblPLoc" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">
                <asp:Label CssClass="text" ID="Label3" runat="server" />
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblPDateTime" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">&nbsp;
                <asp:Label CssClass="text" ID="Label4" runat="server">Return : </asp:Label>
              </td>
              <td>
                <asp:Label CssClass="text" ID="lblDLoc" runat="server" />
              </td>
            </tr>
            <tr>
              <td align="left">
                <asp:Label CssClass="textPad" ID="Label5" runat="server"></asp:Label>
              </td>
              <td>
                <asp:Label CssClass="textPad" ID="lblDDateTime" runat="server"></asp:Label>
              </td>
            </tr>
          </table>
        </asp:TableCell>
      </asp:TableRow>
      <asp:TableRow CssClass="_showhide" Visible="false" onclick="javascript:trOpen('_trRateSumamry','');">
        <asp:TableCell ColumnSpan="1" CssClass="detailsTr" ID="rateTitle" runat="server">
          <LabelText:Control ID="LabelTextRateSummary" runat="server" />
        </asp:TableCell>
        <asp:TableCell ColumnSpan="1" CssClass="detailsTr" ID="TableCell1" HorizontalAlign="Right"
          runat="server">
          <img src="./images/white_arrow.png" alt="Secure" />
        </asp:TableCell>
      </asp:TableRow>
      <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Width="100%">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <%--<asp:Literal ID="ltrUpdate" runat="server"></asp:Literal>--%>
            <tr id="_trRateSumamry" style='display: none;' runat="server" visible="false">
              <td class="text" align="left" nowrap='nowrap' colspan="2">
                <asp:Literal ID="ltrSeasonText" runat="server" Text="" />
              </td>
            </tr>
            <%--<tr id="_trRateSumamry2"><td>&nbsp;</td></tr>--%>
            <tr runat="server" id="Label_trInsurance" class="detailsSelection" style="cursor: pointer;
              height: 30px; padding: 5px 0 2px 0;" onclick="javascript:trOpen('_trInsurance','','MainContent_tr_InsuranceBlank');">
              <td align='left'>
                <%--<img src='./images/selectinsurance.png' />--%>
                <LabelText:Control ID="LabelTextinsurance" runat="server" />
              </td>
              <%--<td colspan="0" align="center" class="header" style='cursor: pointer; background-color: #e60316;
                color: #ffffff; font-size: 15px; font-family: Arial; text-align: left; font-weight: 100;
                height: 25px; padding: 5px 0 2px 0;'>
                # # Select Insurance (Optional)
              </td>--%>
              <td align='right'>
                <img src='./images/white_arrow.png' />
              </td>
            </tr>
            <tr id="_trInsurance" style='display: none;'>
              <td class="text" align="left" colspan="2">
                <%--<asp:Literal ID="ltrInsurance" runat="server" />--%>
                <asp:RadioButtonList ID="rbtnInsurance" runat="server" RepeatDirection="Vertical" />
              </td>
            </tr>
            <tr id="tr_InsuranceBlank" runat="server" style='display: block;'>
              <td style="height: 2px;" colspan="2">
                &nbsp;
              </td>
            </tr>
            <tr runat="server" id="tr_ExtraFeeLabel" class="detailsSelection" style="cursor: pointer;
              height: 30px; padding: 5px 0 2px 0;" onclick="javascript:trOpen('tr_Extra','','tr_ExtraFeesBlank');">
              <td align='left'>
                <%--<img src='./images/selectextras.png' />--%>
                <LabelText:Control ID="LabelTextSelectExtras" runat="server" />
              </td>
              <%--<td colspan="0" align="center" class="header" style='cursor: pointer; background-color: #e60316;
                color: #ffffff; font-size: 15px; font-family: Arial; text-align: left; font-weight: 100;
                height: 25px; padding: 5px 0 2px 0;'>
                # # Select Extra Fees (Optional)
              </td>--%>
              <td align='right'>
                <img src='./images/white_arrow.png' />
              </td>
            </tr>
            <tr id="tr_Extra" style='display: none;'>
              <td class="text" align="left" nowrap='nowrap' colspan="2">
                <asp:Literal ID="ltrExtraFees" runat="server" />
              </td>
            </tr>
            <tr id="tr_ExtraFeesBlank" style='display: block;'>
              <td style="height: 2px;" colspan="2">
                &nbsp;
              </td>
            </tr>
            <tr runat="server" id="tr_KmFeeExtra" class="detailsSelection" style="cursor: pointer;
              height: 30px; padding: 5px 0 2px 0;" onclick="javascript:trOpen('tr_KmFeeExtra2','','MainContent_tr_KmFeeExtraBlank');">
              <td>
                <LabelText:Control ID="LabelTextSelectFree_KM" runat="server" />
              </td>
              <td align='right'>
                <img src='./images/white_arrow.png' />
              </td>
            </tr>
            <tr id="tr_KmFeeExtra2" style='display: none;'>
              <td class="text" align="left" nowrap='nowrap' colspan="2">
                <asp:RadioButtonList ID="rbtnKmFeeExtra" runat="server" RepeatDirection="Vertical" />
              </td>
            </tr>
            <tr id="tr_KmFeeExtraBlank" runat="server" style='display: block;'>
              <td style="height: 2px;" colspan="2">
                &nbsp;
              </td>
            </tr>
            <tr id="tr_AreaOfUse" runat="server">
              <td class="text" align="left" nowrap='nowrap' colspan="2">
                <table border='0' cellspacing="0" cellpadding="2" width='100%'>
                  <tr>
                    <td class="text">&nbsp;
                      Area of Use <br />
                      &nbsp;<asp:DropDownList ID="ddlAreaOfUse" runat="server" />
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </asp:TableCell></asp:TableRow>
      <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Width="100%" CssClass="lessHeight">
          <asp:Button PostBackUrl="webstep4.aspx?type=quote" CssClass="ButtonStep34" ID="btnEmailMeQuote"
            runat="server" Text="Email Quote" />
          <%--<asp:ImageButton AlternateText="Email Me Quote" ID="btnEmailMeQuote" runat="server" PostBackUrl="webstep4.aspx?type=quote" ImageUrl="~/images/btnQuote.png" />--%>
          &nbsp;&nbsp;
          <asp:Button ID="btnRequestBooking" runat="server" CssClass="ButtonStep34" Text="Book Now"
            PostBackUrl="webstep4.aspx?type=booking" />
          <%--<asp:ImageButton ID="btnRequestBooking" runat="server" ImageUrl="~/images/btnBooking.png" PostBackUrl="webstep4.aspx?type=booking" />--%>
        </asp:TableCell></asp:TableRow>

    </asp:Table>
  </div>
</asp:Content>
<asp:Content ID="footer" ContentPlaceHolderID="FooterContent" runat="server">
  <footer:Control ID="step3footer" runat="server" />
  <table><tr><td align="left"><PoweredBy:Control ID="step3PoweredBy" runat="server" /></td></tr></table>
</asp:Content>
