<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DetectscreenHeightWidth.aspx.vb" Inherits="DetectscreenHeightWidth" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- http://devcity.net/Articles/64/1/screenresolution.aspx -->
</head>
<body>
    <form id="form1" runat="server">
<script language="javascript">
  res = "&res=" + screen.width + "x" + screen.height + "&d=" + screen.colorDepth
  top.location.href = "DetectscreenHeightWidth.aspx?action=set" + res 
</script>
    </form>
</body>
</html>
