<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Footer.ascx.vb" Inherits="Footer" %>
<%@ Register Src="~/UserControls/PoweredBy.ascx" TagName="Control" TagPrefix="PB" %>
<div class="blackbar" runat="server" id="footer">
  <div class="transparentbar">
    <%--<asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="alignLeft"  CausesValidation="false"></asp:LinkButton>--%>
    <%--<asp:LinkButton ID="lnkback" runat="server" Text="Back" CssClass="alignRight"  CausesValidation="false" ></asp:LinkButton>--%>
    <%--<asp:ImageButton ID="btnHome2" ImageUrl="~/images/home.png" runat="server" CssClass="alignLeft" CausesValidation="false" />&nbsp;
    <asp:HyperLink  id="lnkback2" runat="server" NavigateUrl="javascript:history.go(-1)"  CssClass="alignRight" ImageUrl="~/images/back.png"></asp:HyperLink>--%>

    <table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr style="height:32px;">
    <td style="width:3px;">&nbsp;</td>
    <td valign="middle" align="left">
      <asp:HyperLink ID="lnkback" runat="server" NavigateUrl="javascript:history.go(-1)" Text="Back" CssClass="HeaderButtonBack" />
    </td>
    <td valign="middle" align="right">
      <asp:HyperLink ID="btnHome" runat="server" Text="Home" CssClass="HeaderButtonHome" />
    </td>
    <td style="width:3px;">&nbsp;</td>
    </tr></table>

  </div>
    
</div>
