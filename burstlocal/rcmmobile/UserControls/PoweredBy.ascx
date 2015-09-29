<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PoweredBy.ascx.vb" Inherits="FooterHome" %>
<%--<div class="grey">
<i>Powered by </i><b>RCM </b><img src="images/RCM.jpg" alt="Rental Car Manager" />
</div>
<div style="height:4px; width:auto;">&nbsp;</div>
<div>
Mobile | <a href="http://demo.rentalcarmanager.com/ssl/rcmdemo/rcmmobile/" style="color:#0671C1; text-decoration:underline;">Desktop</a>
</div>
<div style="height:1px; width:auto;">&nbsp;</div>--%>
<table>
  <tr>
    <td class="copy">&copy; 
      <asp:Label ID="lblCompanyName" runat="server" Text="" /></td>
  </tr>
  <tr>
    <td>
      <asp:HyperLink ID="lnkHome" Target="_self" runat="server">Book a Vehicle</asp:HyperLink>  <asp:Label runat="server" ID="lblPipe1" Text="|" />
      <asp:HyperLink ID="lnkTermsCondition" Target="_self" runat="server">Terms & Conditions</asp:HyperLink> <asp:Label runat="server" ID="lblPipe2" Text="|" />
      <asp:HyperLink ID="lnkPrivacyPolicy" Target="_self" runat="server">Privacy Policy</asp:HyperLink>  <asp:Label runat="server" ID="lblPipe3" Text="|" /> 
      <asp:HyperLink ID="lnkViewFullSite" Target="_blank" runat="server">View Full Site</asp:HyperLink>  
    </td>
  </tr>
</table>