<%
ignorehack = True
allowanything = False
%>
<!--#include file="a_server-checks.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<!-- Copyright 2003-2006 GMH SYSTEMS LTD  -->
<!-- Product Development - Rental Car Manager  ( www.rentalcarmanager.com )  -->
<!--  All Rights Reserved  -->
<!--  This product and related documentation is protected by copyright and   -->
<!--  distributed under license restricting its use, copying, distribution   -->
<!--  and decompilation. No part of this product or related documentation may  -->
<!--  reproduced in any form by any means without prior written consent of -->
<!--  GMH Systems LTD  -->
<!--  For more information contact sales@rentalcarmanager.com -->
<STYLE TYPE="text/css">
.white {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }
.text  {  font-family: Arial;font-size: 8pt;color: #666666; }
.red  {  font-family: Arial;font-size: 8pt;color: red; }
.formtext {  font-family: Arial;font-size: 8pt;color: #666666; font-weight: bold; }
.header {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }
SELECT {   font-family: Arial;font-size: 8pt;color: #666666; }
.button {   font-family: Arial;font-size: 8pt;color: #666666; }
input  {   font-family: Arial;font-size: 8pt;color: #666666; }

</STYLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
 
function checkNumericField(objName,minval, maxval,comma,period,hyphen)
{
   var numberfield = objName;
   if (chkNumeric(objName,minval,maxval,comma,period,hyphen) == false)
   {     numberfield.select();
      numberfield.focus();
      return false;
   }
   else
   {     return true;
   }
}
function chkNumeric(objName,minval,maxval,comma,period,hyphen)
{
// only allow 0-9 be entered, plus any values passed
// if all numbers allow commas, periods, hyphens or whatever,
// just hard code it here and take out the passed parameters
var checkOK = "0123456789";
var checkStr = objName;
var allValid = true;
var decPoints = 0;
var allNum = "";

for (i = 0;  i < checkStr.value.length;  i++)
{
ch = checkStr.value.charAt(i);
for (j = 0;  j < checkOK.length;  j++)
if (ch == checkOK.charAt(j))
break;
if (j == checkOK.length)
{
allValid = false;
break;
}
if (ch != ",")
allNum += ch;
}
if (!allValid)
{  
alertsay = "Card is invalid"
alert(alertsay);
return (false);
}
// set the minimum and maximum
var chkVal = allNum;
var prsVal = parseInt(allNum);
if (chkVal != "" && !(prsVal >= minval && prsVal <= maxval))
{
alertsay = "Card is invalid"

alert(alertsay);
return (false);
}
}

function Validate() 
{  //if (document.paymentForm.PaymentButton[1].checked )  
  {      var ccNumber1 = document.paymentForm.ccNumber1.value;    
         var ccNumber2 = document.paymentForm.ccNumber2.value;    
         var ccNumber3 = document.paymentForm.ccNumber3.value;    
         var ccNumber4 = document.paymentForm.ccNumber4.value;    
       
      var sCCnum1 = document.paymentForm.ccNumber1.value; 
        var sName = document.paymentForm.ccName.value;
   var sYear = document.paymentForm.ccDate2.value;
   var sMonth = document.paymentForm.ccDate1.value;
   var iTotal = 0;
      var iNumLen1 = sCCnum1.length; 
         var myDate = new Date()
         var theYear = myDate.getYear()+ ""
         var theMonth = myDate.getMonth() + ""
         var monthsGone = parseInt(theYear.substr(2,2))*12 + parseInt(theMonth)
       
      var intMonth=0;
         var intYear=0;
         
         switch (sMonth)
           {
             case "01":
              intMonth=1
              break
            case "02":
              intMonth=2
              break  
            case "03":
              intMonth=3
              break  
            case "04":
              intMonth=4
              break
             case "05":
              intMonth=5
              break
            case "06":
              intMonth=6
              break  
            case "07":
              intMonth=7
              break  
            case "08":
              intMonth=8
              break
            case "09":
              intMonth=9
              break
            default :
              intMonth=parseInt(sMonth)  
          }

         switch (sYear)
           {
             case "04":
              intYear=4
              break
             case "05":
              intYear=5
              break
             case "06":
              intYear=6
              break
             case "07":
              intYear=7
              break
             case "08":
              intYear=8
              break
             case "09":
              intYear=9
              break
            default :
              intYear=parseInt(sYear)  
          }
         var monthstoGo = intYear*12 + intMonth   
         //var monthstoGo = parseInt(sYear)*12 + parseInt(sMonth) 
        
        if  (document.paymentForm.ccType.selectedIndex == 0)
   {        alert("Please select Credit Card Type.");
               return false;
   }
  
   else if (ccNumber1.length < 4 )
         {      alert("Invalid Credit Card Number")
            document.paymentForm.ccNumber1.focus();
               return false;
         }  
        else if (ccNumber2.length < 4 )
         {      alert("Invalid Credit Card Number")  
            document.paymentForm.ccNumber2.focus();
               return false;
         }  
         else if (ccNumber3.length < 4 )
         {      alert("Invalid Credit Card Number")
            document.paymentForm.ccNumber3.focus();
               return false;
         }  
        else if (ccNumber4.length < 2 )
         {      alert("Invalid Credit Card Number")
            document.paymentForm.ccNumber4.focus();
               return false;
         }  
         else if( sName =="") 
      {       alert("Please enter the Name as it appears on the Credit Card")
         document.paymentForm.ccName.focus();
         return false;
      }
      
         else if( sMonth == "") 
      {  alert("Please enter the Expiry Month")
         document.paymentForm.ccDate1.focus();
         return false;
      } 
      else if( sYear == "") 
      {  alert("Please enter the Expiry Year")
              document.paymentForm.ccDate2.focus();
         return false;
      } 
         
         else if (monthstoGo - monthsGone < 1) 
         {  alert("The Credit Card has Expired")
            document.paymentForm.ccDate2.focus();
            return false;
      }
         else
   {  return true;
      
   }
   }  
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>


<% if Session("RCM71_OnlineBookingNo")="" then
        Response.Redirect "webBookingStep1.asp"

end if

if Session("RCM71_PickupLocationID")="" then
            Response.Redirect "webBookingStep1.asp"
 end if     %>
<link href="ausbook.css" rel="stylesheet" type="text/css" />
<body bgcolor=#FFFFFF leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('images/homed.gif','graphics/homed.gif')">
<!-- Banner starts here -->
<table width="748" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"><img src="graphics/auswide-car-banner.jpg" alt="Australia Wide Car Rentals" name="cars" width="748" height="164" border="0" id="cars" /></td>
          </tr>
</table>
<!-- Banner ends here -->
<!-- Order steps start here -->
<table class="egg" width="748" border="0" align="center" cellpadding="10" cellspacing="0">
        <tr align="left" valign="top" class="pink">
          <td height="80" align="center" valign="middle"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="graphics/rentals-dates.gif" alt="Select Pick-up  Location and Hire Dates" width="80" height="53"></td>
              <td><img src="graphics/rentals-vehicle.gif" alt="Select Vehicle" width="80" height="53"></td>
              <td><img src="graphics/rentals-estimate.gif" alt="Review Car Rental Estimate" width="80" height="53"></td>
              <td><img src="graphics/rentals-purchase.gif" alt="Car Rental Purchase Details" width="80" height="53"></td>
              <td><img src="graphics/rentals-confirm-grn.gif" alt="Car Rental Booking Confirmation" width="80" height="53" border="0"></td>
            </tr>
          </table></td>
          <td align="center" valign="middle"><a href="http://www.australiawidecarrentals.com.au"><img src="graphics/home.gif" alt="Home Page" width="191" height="38" border="0" id="home" onmouseover="MM_swapImage('home','','graphics/homed.gif',1)" onmouseout="MM_swapImgRestore()" /></a><a href="index.html"></a><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','home','',1)" onmouseover="MM_nbGroup('over','home','images/homed.gif','',1)" onmouseout="MM_nbGroup('out')"></a><a href="http://www.australiawidecarrentals.com.au"></a></td>
        </tr>
</table>
<!-- Order steps end here -->
<table width="748" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="egg">
<tr><td height="100%"> 
    
</td></tr>
<tr><td>
<!-- RCM HTML CODE-----------> 
   <form name="paymentForm" action="webBookingStep6.asp?dir=booking" method="POST" onSubmit="return Validate()"> 
 
   <TABLE  width=400  align=center bgcolor=#00509F  cellSpacing=0 cellPadding=1  border=0><tr><td>
   <TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>
   <tr height=20><td  align=center class=header bgColor=#00509F colspan=3>STEP 5 - Enter Your Payment Details</td></tr>
   

         
              <tr>
                <td></td>
                <td align=left class=text><BR><font color=red>*</font>Credit Card:&nbsp;</td>
                <td align=left><BR>
                <select name=ccType size=1>")
                     <option value="" selected="selected">Please select</option>
                  <option value="Visa">Visa</option>
                  <option value="Master Card">Master Card</option>  
                     <option value="Amex">Amex</option>  
                        <option value="Diners">Diners</option>

               </select>
                </td>
              </tr>
              <tr>
                <td></td>
                <td  align=left class=text><font color=red>*</font>Card number:&nbsp;</td>
                <td align=left>
                  <input type="text" maxlength="4" size="4" name="ccNumber1" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                  <input type="text" maxlength="4" size="4" name="ccNumber2" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                  <input type="text" maxlength="4" size="4" name="ccNumber3" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                  <input type="text" maxlength="4" size="4" name="ccNumber4" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                </td>
              </tr>
              <tr>
                <td></td>
                <td align=left class=text><font color=red>*</font>Name on Card:&nbsp;</td>
                <td align=left>
                  <input type=text name=ccName size=25>
                </td>
              </tr>
              <tr>
                <td></td>
                <td  align=left class=text nowrap><font color=red>*</font>Expiry Date:&nbsp;</td>
                 <td class=text align=left>
                  <input type="text" maxlength="2" size="2" name="ccDate1" onBlur="checkNumericField(this,0,12,'','','');"  value"">&nbsp;mm&nbsp;
                  <input type="text" maxlength="2" size="2" name="ccDate2" onBlur="checkNumericField(this,0,99,'','','');"  value"">&nbsp;yy
                </td>
              </tr>
             
              <tr height=2>
                <td colspan=3><HR SIZE="1" COLOR="#CCCCCC"></td>
              </tr>
              <tr>
                <td colspan=3 class=text align=right>
                <INPUT TYPE=button NAME=Back  VALUE=Back  class=button onClick='javascript:history.back(-1)'>&nbsp;&nbsp;
                <input name="submit" type="submit" class="button" value="Submit Booking Request"  /></td>
              </tr>
              <tr>
                <td colspan=3 align=right class=text><font color=red><b>*</b></font> 
                  Required fields must be completed</td></form>
  </tr>
</table>
       
     
      </td>
     </tr>
      </table>  </td>
     </tr>
      <tr> <td height=220></td></tr>
      </table>
    </td>
  </tr>
</table>   
<!-- END RCM HTML CODE-----------> 
<!-- Footer starts here -->
<table class="egg" width="748" border="0" align="center" cellpadding="10" cellspacing="0">
        <tr align="left" valign="top">
          <td height="80" align="center" valign="middle">&copy; Australia Wide Car Rentals  |  
 <a href="http://www.australiawidecarrentals.com.au/perth.html">Perth</a> | <a href="http://www.australiawidecarrentals.com.au/melbourne.html">Melbourne</a> | <a href="http://www.australiawidecarrentals.com.au/brisbane.html">Brisbane</a> | <a href="http://www.australiawidecarrentals.com.au/sydney.html">Sydney</a> | <a href="http://www.australiawidecarrentals.com.au/canberra.html">Canberra</a> |  <a href="http://www.australiawidecarrentals.com.au/adelaide.html">Adelaide</a>  |  <a href="http://www.australiawidecarrentals.com.au/hobart.html">Hobart</a><br />
 <br />
 For Customer Service please phone the appropriate number below<br />
 <strong>Melbourne</strong> 1800 331 220 | <strong>Canberra</strong> 1800 331 001 | <strong>Sydney</strong> 1800 331 002 <br />
 <strong>Brisbane</strong> 1800 443 400 |<strong> Adelaide</strong> 1800 331 033 | <strong>Hobart</strong> 6231 2888 | <strong>Perth</strong> 08 9472 5025 </td>
        </tr>
</table>
<!-- Footer ends here -->
</body></html>

