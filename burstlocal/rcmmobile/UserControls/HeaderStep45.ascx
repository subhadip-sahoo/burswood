<%@ Control Language="VB" AutoEventWireup="false" CodeFile="HeaderStep45.ascx.vb" Inherits="HeaderStep45" %>
<div class="blackbar">
    <%--<asp:ImageButton ID="btnHome" ImageUrl="~/images/home.png" runat="server" CssClass="alignLeft" CausesValidation="false" />--%>
    <%--<asp:HyperLink ID="btnHome1" runat="server" NavigateUrl="../WebStep1.aspx" Text="Back" CssClass="alignLeft" ImageUrl="~/images/home.png" />--%>
    <%--<asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="alignLeft" CausesValidation="false"  ></asp:LinkButton>--%>
    <%--<asp:LinkButton ID="lnkback" runat="server" Text="Back"  CssClass="alignRight" CausesValidation="false"  ></asp:LinkButton>--%>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr style="height:32px;">
    <td style="width:3px;">&nbsp;</td>
    <td valign="middle" align="left">
      <asp:HyperLink ID="lnkback" runat="server" NavigateUrl="javascript:history.go(-1)" Text="Back" CssClass="HeaderButtonBack" />
    </td>
    <td align="right" valign="middle">
      <asp:HyperLink ID="btnHome" runat="server" Text="Home" CssClass="HeaderButtonHome" />
    </td>
    <td style="width:3px;">&nbsp;</td>
    </tr>
    <tr class="TransparentSeperator"><td colspan="4">&nbsp;</td></tr>
    </table>
</div>
<%--
  <div class="Header_" runat="server" id="StepTitle">
    <asp:Image ID="formheadertext" runat="server" CssClass="HeaderImage_" />
  </div>
--%>
<table border="0" width="100%" class="Header_" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" style="width:23px;">
      <asp:Image ID="formheadertext" runat="server" CssClass="HeaderImage_" />
    </td>

    <td align="left">
      <asp:Label CssClass="HeaderlblLeft_" ID="lblRight" Text="TOTAL" runat="server" />
    </td>
  </tr>
</table>
