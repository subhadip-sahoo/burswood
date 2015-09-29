<%@ Page Language="VB" MasterPageFile="Site.Master" AutoEventWireup="false" CodeFile="FindUs.aspx.vb"  Inherits="FindUs" %>
<%@ Register Src="~/userControls/PoweredBy.ascx" TagName="Control" TagPrefix="PoweredBy" %>
<%@ Register Src="~/userControls/Footer.ascx" TagName="Control" TagPrefix="footer" %>
<%@ Register Src="~/userControls/Header.ascx" TagName="Control" TagPrefix="header" %>
<%@ Import Namespace="mRCMAPI" %>
<asp:Content ID="title" runat="server" ContentPlaceHolderID="HeadContent">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
</asp:Content>
<asp:Content ID="Body" runat="server" ContentPlaceHolderID="MainContent" ViewStateMode="Disabled">
  <header:Control ID="FindUsheader" runat="server" />
  <div id="maindiv">
    <div class="errordiv" runat="server" id="ErrorDiv" visible="false">
      <asp:Label ID="lblErrmsg" runat="server" Visible="false" Text="Sorry there's a problem"></asp:Label><br />
      <asp:Label ID="litErrorMessage" runat="server" CssClass="red" Visible="false"></asp:Label>
    </div>
    <asp:Table ID="maintable" runat="server" BorderWidth="0" Width="100%">
      <asp:TableRow>
        <asp:TableCell HorizontalAlign="Center">
          <asp:Literal runat="server" ID="ltrMap" Visible="true" />
          <%--<asp:Image ID="imgGoogleMap" runat="server" />--%>
          <%--<iframe width="300" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com.au/maps?oe=utf-8&amp;client=firefox-a&amp;q=36+Aerodrome+Road,+Maroochydore+QLD+4558&amp;ie=UTF8&amp;hq=&amp;hnear=36+Aerodrome+Rd,+Maroochydore+Queensland+4558&amp;t=m&amp;source=embed&amp;ll=-26.662647,153.096714&amp;spn=0.023011,0.025749&amp;z=14&amp;output=embed"></iframe><br /><small><a href="http://maps.google.com.au/maps?oe=utf-8&amp;client=firefox-a&amp;q=36+Aerodrome+Road,+Maroochydore+QLD+4558&amp;ie=UTF8&amp;hq=&amp;hnear=36+Aerodrome+Rd,+Maroochydore+Queensland+4558&amp;t=m&amp;source=embed&amp;ll=-26.662647,153.096714&amp;spn=0.023011,0.025749&amp;z=14" style="color:#0000FF;text-align:left">View Larger Map</a></small>--%>
        </asp:TableCell>
      </asp:TableRow>
    </asp:Table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr><td class=""><footer:Control ID="Findusfooter" runat="server" /></td></tr>
    <tr><td><PoweredBy:Control ID="step1PoweredBy" runat="server" /></td></tr>
    <tr><td class="">&nbsp;</td></tr>
    </table>
  </div>
</asp:Content>
