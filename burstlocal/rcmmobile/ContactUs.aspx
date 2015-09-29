<%@ Page Language="VB" MasterPageFile="Site.Master" AutoEventWireup="false" CodeFile="ContactUs.aspx.vb"
  Inherits="ContactUs" %>

<%@ Register Src="~/userControls/PoweredBy.ascx" TagName="Control" TagPrefix="PoweredBy" %>
<%@ Register Src="~/userControls/Footer.ascx" TagName="Control" TagPrefix="footer" %>
<%@ Register Src="~/userControls/Header.ascx" TagName="Control" TagPrefix="header" %>
<%@ Import Namespace="mRCMAPI" %>
<asp:Content ID="title" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="Body" runat="server" ContentPlaceHolderID="MainContent" ViewStateMode="Disabled">
  <header:Control ID="Contactheader" runat="server" />
  <div id="maindiv">
    <div class="errordiv" runat="server" id="ErrorDiv" visible="false">
      <asp:Label ID="lblErrmsg" runat="server" Visible="false" Text="Sorry there's a problem"></asp:Label><br />
      <asp:Label ID="litErrorMessage" runat="server" CssClass="red" Visible="false"></asp:Label>
    </div>
    <table border="0" width="100%" cellpadding="0" cellspacing="0" style="padding: 10px;">
      <tr>
        <td>
          <div style="font-size: 10px">
            &nbsp;</div>
        </td>
      </tr>
      <tr>
        <td>
          <div style="font-size: 24px; font-family: Arial; font-weight: bold;">
            Call us today on :
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <div style="font-size: 20px">
            &nbsp;</div>
        </td>
      </tr>
      <tr>
        <td align="left">
          <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr runat="server" id="tr_tollfree1Value">
              <td style="width: 181">
                <asp:Label CssClass="text" ID="lbltollfree1" runat="server">FREE CALL </asp:Label>
              </td>
              <td>
                :
                <asp:Label HorizontalAlign="Left" CssClass="text" ID="lbltollfree1Value" runat="server" />
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <div style="font-size: 3px">
                  &nbsp;</div>
              </td>
            </tr>
            <tr runat="server" id="tr_tollfree2Value">
              <td style="width: 181">
                <asp:Label CssClass="text" ID="lbltollfree2" runat="server">INTERNATIONAL </asp:Label>
              </td>
              <td>
                :
                <asp:Label CssClass="text" ID="lbltollfree2Value" runat="server" />
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <div style="font-size: 3px">
            &nbsp;</div>
        </td>
      </tr>
      <tr>
        <td>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <div style="font-size: 13px">
            &nbsp;</div>
        </td>
      </tr>
      <tr>
        <td>
          <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td style="width: 181" valign="top">
                <asp:Label CssClass="text" ID="lblOfficeAddress" runat="server">Address</asp:Label>
              </td>
              <td>
                :
                <asp:Label CssClass="text" ID="lblOfficeAddressValue" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                &nbsp;
              </td>
              <td>
                :
                <asp:Label CssClass="text" ID="lblOfficeSuburbValue" runat="server" /><asp:Label CssClass="text" ID="lblOfficeCityValue" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                &nbsp;
              </td>
              <td>
                :
                <asp:Label CssClass="text" ID="lblOfficeStateValue" runat="server" /><asp:Label CssClass="text" ID="lblOfficePostCodeValue" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                &nbsp;
              </td>
              <td>
                :
                <asp:Label CssClass="text" ID="lblCountryValue" runat="server" />
              </td>
            </tr>
            <tr>
              <td colspan="2">
              <div style="font-size: 6px">&nbsp;</div>
              </td>
            </tr>
            <tr runat="server" id="tr_OfficeEmail">
              <td><asp:Label CssClass="text" ID="lblOfficeEmail" runat="server">Email : </asp:Label></td>
              <td> : <asp:Label CssClass="text" ID="lblOfficeEmailValue" runat="server"> Email </asp:Label></td>
            </tr>
            
            <tr runat="server" id="tr_OfficePhone">
              <td><asp:Label CssClass="text" ID="lblOffice" runat="server">Phone :</asp:Label></td>
              <td> : <asp:Label CssClass="text" ID="lblOffice1Value" runat="server" /></td>
            </tr>

            <tr runat="server" id="tr_OfficeFax">
              <td><asp:Label CssClass="text" ID="lblOfficeFax" runat="server">Fax :</asp:Label></td>
              <td> : <asp:Label CssClass="text" ID="lblOfficeFaxValue" runat="server">Fax :</asp:Label></td>
            </tr>

          </table>
        </td>
      </tr>
      <tr>
        <td>
        </td>
      </tr>
    </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="">
          <footer:Control ID="Contactusfooter" runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          <PoweredBy:Control ID="step1PoweredBy" runat="server" />
        </td>
      </tr>
      <tr>
        <td class="">
          &nbsp;
        </td>
      </tr>
    </table>
  </div>
</asp:Content>
