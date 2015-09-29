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
<!--  For more information contact support@rentalcarmanager.com -->
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
//-->
</script>


<% if Session("AuBurswood169_OnlineBookingNo")="" then
        Response.Redirect "webBookingStep1.asp"

end if

if Session("AuBurswood169_PickupLocationID")="" then
            Response.Redirect "webBookingStep1.asp"
 end if     %>
<link href="burbook.css" rel="stylesheet" type="text/css" />
<body bgcolor=#FFFFFF leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('images/homed.gif')">
<!-- Banner starts here -->
<table width="748" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"><img src="graphics/burswood-car-rental-banner.jpg" alt="Burswood Car Rentals" width="960" height="187" border="0" usemap="#carsMap" id="cars" />
              <map name="carsMap" id="carsMap">
                <area shape="rect" coords="33,30,254,117" href="http://www.burswoodcarrentals.net.au" alt="Burswood Car Rentals Home Page" />
              <area shape="rect" coords="790,103,949,176" href="http://www.burswoodcarrentals.net.au" alt="" />
              </map></td>
  </tr>
</table>
<!-- Banner ends here -->
<!-- Order steps start here -->
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="egg">
  <tr align="left" valign="top">
    <td width="45%" height="80" align="left" valign="top"><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30">&nbsp;</td>
        <td><img src="graphics/1-dates-completed.gif" alt="Select Pick-up  Location and Hire Dates" width="61" height="75" vspace="20" /></td>
        <td><img src="graphics/2-vehicle-completed.gif" alt="Select Vehicle" width="77" height="75" /></td>
        <td><img src="graphics/3-quote-completed.gif" alt="Review Car Rental Estimate" width="75" height="75" /></td>
        <td><img src="graphics/4-purchase-completed.gif" alt="Car Rental Purchase Details" width="76" height="75" /></td>
        <td><img src="graphics/5-confirm-current.gif" alt="Car Rental Booking Confirmation" width="62" height="75" border="0" /></td>
      </tr>
    </table></td>
    <td align="left" valign="middle"><a href="index.html"></a><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','home','',1)" onmouseover="MM_nbGroup('over','home','images/homed.gif','',1)" onmouseout="MM_nbGroup('out')"></a><img src="graphics/hd-confirm.gif" alt="Confirm your booking" width="248" height="75" border="0" /></td>
  </tr>
</table>
<!-- Order steps end here -->
<table width="960" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="egg">
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
<table width="960" border="0" align="center" cellpadding="10" cellspacing="0">
  <tr>
    <td align="left" valign="top"><p>&copy; 2009 Burswood Car Rentals</p></td>
    <td align="left" valign="top"><p>Head Office and Depot:<br />
      Burswood Car Rentals<br />
      54B Shepperton Road, Victoria Park, <br />
      Perth, Western Australia 6100</p>
    <p><a href="www.burswoodcarrentals.net.au/terms-conditions/">Terms &amp; Conditions</a></p></td>
    <td align="left" valign="top"><p><strong>Telephone: (08) 9362 4777</strong><br />
      Facsimile: (08) 9362 4877<br />
      International Dial: 0011 61 8 9362 4777<br />
      Freecall Australia Wide: 1800 624 810 </p></td>
  </tr>
</table>
<!-- Footer ends here -->
</body></html>

