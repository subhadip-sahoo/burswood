<%@ Page Language="VB" MasterPageFile="Site.master" AutoEventWireup="false" CodeFile="webStep2.aspx.vb"
  Inherits="webStep2" %>

<%@ Register Src="~/userControls/Footer.ascx" TagName="Control" TagPrefix="footer" %>
<%@ Register Src="~/userControls/Header.ascx" TagName="Control" TagPrefix="header" %>
<%@ Register Src="~/userControls/PoweredBy.ascx" TagName="Control" TagPrefix="PoweredBy" %>
<%@ Import Namespace="mRCMAPI" %>
<asp:Content ID="title" ContentPlaceHolderID="HeadContent" runat="Server">
  <script language="javascript" type="text/javascript">
    function trOpen(id) {
      var style = document.getElementById(id).style;
      if (style.display == "none") {
        style.display = "table-row";
      }
      else {
        style.display = "none";
      }
    } 
  </script>
</asp:Content>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="Server">
  <%--  <div class="StepTitle" runat="server" id="StepTitle2">
    Select Vehicle Category
  </div>--%>
  <header:Control ID="step2header" runat="server" />
  <div id="maindiv">
    <div class="errordiv" runat="server" id="ErrorDiv" visible="false">
      <asp:Label ID="lblErrmsg" runat="server" Visible="false" Text="Sorry there's a problem"></asp:Label><br />
      <asp:Label ID="litErrorMessage" runat="server" CssClass="red" Visible="false"></asp:Label>
    </div>
    <table width="100%" style="height: auto;">
      <tr align="center">
        <td align="center">
          <asp:Table runat="server" ID="RequestDetails" Width="100%">
            <%--<asp:TableRow>
              <asp:TableCell>
                <asp:Label ID="lblPLoc" runat="server"></asp:Label> - <asp:Label ID="lblDLoc" runat="server"></asp:Label>
              </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
              <asp:TableCell>
                <asp:Label ID="lblPDateTime" runat="server"></asp:Label> - <asp:Label ID="lblDDateTime" runat="server"></asp:Label>
              </asp:TableCell>
            </asp:TableRow>
          </asp:Table>--%>
            <asp:TableRow>
              <asp:TableCell CssClass="text">
                <asp:Label CssClass="text" ID="lblPickup" Text="Pickup: " runat="server"></asp:Label>
              </asp:TableCell>
              <asp:TableCell>
                <asp:Label CssClass="text" ID="lblPLoc" runat="server"></asp:Label>
              </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
              <asp:TableCell>&nbsp;
              </asp:TableCell>
              <asp:TableCell>
                <asp:Label CssClass="text" ID="lblPDateTime" runat="server"></asp:Label>
              </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
              <asp:TableCell CssClass="text">
                <asp:Label CssClass="text" ID="lblReturn" Text="Return: " runat="server"></asp:Label>
              </asp:TableCell>
              <asp:TableCell>
                <asp:Label ID="lblDLoc" CssClass="text" runat="server"></asp:Label>
              </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
              <asp:TableCell>&nbsp;
              </asp:TableCell>
              <asp:TableCell>
                <asp:Label CssClass="text" ID="lblDDateTime" runat="server"></asp:Label>
              </asp:TableCell>
            </asp:TableRow>
          </asp:Table>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Literal ID="ltrDisplayVehicleDetails" runat="server" />
        </td>
      </tr>
    </table>
  </div>
</asp:Content>
<asp:Content ID="footer" ContentPlaceHolderID="FooterContent" runat="server">
  <footer:Control ID="step2footer" runat="server" />
  <table><tr><td align="left"><PoweredBy:Control ID="step1PoweredBy" runat="server" /></td></tr></table>
</asp:Content>
