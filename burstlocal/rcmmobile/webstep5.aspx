<%@ Page Language="VB" MasterPageFile="Site.master" AutoEventWireup="false" CodeFile="webstep5.aspx.vb"
  Inherits="webstep5" %>

<%@ Register Src="~/userControls/Footer.ascx" TagName="Control" TagPrefix="footer" %>
<%@ Register Src="~/userControls/HeaderStep45.ascx" TagName="Control" TagPrefix="header" %>
<%@ Register Src="~/userControls/PoweredBy.ascx" TagName="Control" TagPrefix="PoweredBy" %>
<%@ Import Namespace="mRCMAPI" %>
<asp:Content ID="head" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="Server">
  <header:Control ID="step4header" runat="server" />
  <%-- <div class="StepTitle" runat="server" id="StepTitle5">
    Booking Confirmation
  </div>--%>
  <div id="maindiv">
    <div class="errordiv" runat="server" id="ErrorDiv" visible="false">
      <asp:Label ID="lblErrmsg" runat="server" Visible="false" Text="Sorry there's a problem"></asp:Label><br />
      <asp:Label ID="litErrorMessage" runat="server" CssClass="red" Visible="false"></asp:Label>
    </div>
    <asp:Literal ID="ltrBookSummary" runat="server"></asp:Literal>
    <br />
    <div style="text-align: center; padding-bottom: 4px; padding-top: 4px;">
      <input id="btnBookAnother" runat="server" type='button' onclick="window.open('WebStep1.aspx','_self')"
        name='Available' value='Click for another booking' class='rcmbutton2' />
    </div>
  </div>
</asp:Content>
<asp:Content ID="footer" ContentPlaceHolderID="FooterContent" runat="Server">
  <footer:Control ID="step4footer" runat="server" />
  <table><tr><td align="left"><PoweredBy:Control ID="step4PoweredBy" runat="server" /></td></tr></table>
</asp:Content>
