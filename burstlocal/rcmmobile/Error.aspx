<%@ Page Title="" Language="VB" ValidateRequest="false" AutoEventWireup="false" CodeFile="Error.aspx.vb" Inherits="sError" %>
<head>
<link href="~/Styles/mobStyle.css" rel="stylesheet" type="text/css" />
<style>
body 
{
  font-family:Arial Narrow;
  font-size:16px;
}
</style>
</head>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="MainBodyContent" runat="Server">--%>
<body><!--bgcolor="#DBE5F1"-->
<p>&nbsp;</p>
<table width='100%' border='0' cellspacing='0' cellpadding='0' style='height: 100%;'>
    <tr>
        <td align="left" valign="top" style="">
            <table border='0' id='maintable' align='center' cellspacing='0' cellpadding='0' width="99%">
                <tr>
                    <td valign="top" align="center">
                        <h1>
                            <asp:label id="LblHeaderText" runat="server" Text="Rental Car Manager" />
                        </h1>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="red">
                        <asp:label id="lblMessage" runat="server" Text="We are sorry there has been an error displaying the page you were about to view." />
                    </td>
                </tr>

                <tr>
                    <td align="center"><p><br /></p><p>
                        &nbsp;The details relating to this problem have been automatically sent to our support team.</p>
                        <p><br /></p>
                    </td>
                </tr>


                <tr>
                    <td align="center">
                    
                    <p>

                        &nbsp;We apologise for the inconvenience and will endeavour to have the 
problem fixed as soon as possible. If the problem persists please email <br /></p><p>
<asp:hyperlink id="Hyperlink1" runat="server" NavigateUrl="mailto:support@rentalcarmanager.com" Text="support@rentalcarmanager.com" /></p>
                    </td>
                </tr>


                <tr>
                    <td align="center"><p><br /></p><p>
                        <asp:hyperlink id="lnkbtnNavigate" runat="server" NavigateUrl="Webstep1.aspx" Text="
 
To continue using Mobile Rental Car Manager please click here.

" /></p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
<%--</asp:Content>--%>