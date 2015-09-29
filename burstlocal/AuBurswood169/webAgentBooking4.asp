<%
If Request.ServerVariables("SERVER_PORT")=80 Then

      Response.Redirect "https://secure20.rentalcarmanager.com.au/ssl/Australiawide71/AuBurswood169/webAgentBooking1.asp"
   End If
ignorehack = True
allowanything = False
%>
<!--#include file="a_server-checks.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<title></title>
<head>
<!-- Copyright 2003-2009 GMH SYSTEMS LTD  -->
<!-- Product Development - Rental Car Manager  ( www.rentalcarmanager.com )  -->
<!--  All Rights Reserved  -->
<!--  This product and related documentation is protected by copyright and   -->
<!--  distributed under license restricting its use, copying, distribution   -->
<!--  and decompilation. No part of this product or related documentation may  -->
<!--  reproduced in any form by any means without prior written consent of -->
<!--  GMH Systems LTD  -->
<!--  For more information contact info@rentalcarmanager.com -->
 <STYLE TYPE="text/css">
.white {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }  
.text  {  font-family: Arial;font-size: 8pt;color: #666666; }
.formtext {  font-family: Arial;font-size: 8pt;color: #666666; font-weight: bold; }
.header {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }
.red {  font-family: Arial;font-size: 8pt;color: #FF0000; font-weight: bold; }
SELECT {   font-family: Arial;font-size: 8pt;color: #666666; }
.button {   font-family: Arial;font-size: 8pt;color: #666666; }
input  {   font-family: Arial;font-size: 8pt;color: #666666; }
.BGColour input {
 font: 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
 background-color: #FFFFCC;
 color: #102132;

}
</STYLE>

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin  
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
var checkOK = "0123456789.";
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
{
        if (document.theForm.firstname.value == "")
  {      alert("First Name required.");
      document.theForm.firstname.focus();
      return (false);
  }
   if (document.theForm.lastname.value == "")
  {      alert("Last Name required.");
      document.theForm.lastname.focus();
      return (false);
  }
  if (document.theForm.address.value == "")
  {   alert("Address details required.");
      document.theForm.address.focus();
      return (false);
  }
  if (document.theForm.city.value == "")
  {   alert("Address details required.");
      document.theForm.city.focus();
      return (false);
  }
  if (document.theForm.CountryID.value == "0")
  {      alert("Please select Country of Residence");
      document.theForm.CountryID.focus();
      return (false);
  }
if (document.theForm.CustomerEmail.value == "")
  {      alert("Email address required.");
      document.theForm.CustomerEmail.focus();
      return (false);
  }
   if (document.theForm.Phone.value == "") {
      alert("Phone number is required.");
      document.theForm.Phone.focus();
      return (false);
    }
  if (document.theForm.NoTravelling.value == "")
  {      alert("Number of Travelling required.");
      document.theForm.NoTravelling.focus();
      return (false);
    }


//add creditcard validation here

   var ccNumber1 = document.theForm.ccNumber1.value;
   var ccNumber2 = document.theForm.ccNumber2.value;
   var ccNumber3 = document.theForm.ccNumber3.value;
   var ccNumber4 = document.theForm.ccNumber4.value;

   var sCCnum1 = document.theForm.ccNumber1.value;
   var sName = document.theForm.ccName.value;
   var sYear = document.theForm.ccDate2.value;
   var sMonth = document.theForm.ccDate1.value;
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

   if  (document.theForm.ccType.selectedIndex == 0)
   {        alert("Please select Credit Card Type.");
            return false;
   }

   else if (ccNumber1.length < 4 )
         {      alert("Invalid Credit Card Number")
            document.theForm.ccNumber1.focus();
               return false;
         }
        else if (ccNumber2.length < 4 )
         {      alert("Invalid Credit Card Number")
            document.theForm.ccNumber2.focus();
               return false;
         }
         else if (ccNumber3.length < 4 )
         {      alert("Invalid Credit Card Number")
            document.theForm.ccNumber3.focus();
               return false;
         }
        else if (ccNumber4.length < 2 )
         {      alert("Invalid Credit Card Number")
            document.theForm.ccNumber4.focus();
               return false;
         }
         else if( sName =="")
      {       alert("Please enter the Name as it appears on the Credit Card")
         document.theForm.ccName.focus();
         return false;
      }

         else if( sMonth == "")
      {  alert("Please enter the Expiry Month")
         document.theForm.ccDate1.focus();
         return false;
      }
      else if( sYear == "")
      {  alert("Please enter the Expiry Year")
              document.theForm.ccDate2.focus();
         return false;
      }

      else if (monthstoGo - monthsGone < 1)
      {  alert("The Credit Card has Expired")
         document.theForm.ccDate2.focus();
         return false;
      }
      else
      {  return true;

      }
//--------creditcard validation end
//return (true)

}
//-->
</script>
<script type="text/javascript">
function ismaxlength(obj){
var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
if (obj.getAttribute && obj.value.length>mlength)
obj.value=obj.value.substring(0,mlength)
}
</script>


</head>


<%      if Session("RCM169a_PickupLocationID")="" then
            Response.Redirect "webAgentBooking1.asp"
    end if
    
    


        RCMURL="https://secure20.rentalcarmanager.com.au"


        CompanyCode="Australiawide71"
        DatabaseFile="Australiawide71"

        Dim webConn     'webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

         webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"




      
         
     
 
 FUNCTION tidyup(thisString)
   thisString=LTrim(RTrim(Replace(thisString, "'" , "")))
      thisString=Replace(thisString, "”" , "")
      thisString=Replace(thisString, "<" , "")
      thisString=Replace(thisString, "http" , "")
      thisString=Replace(thisString, "://" , "")
      thisString=Replace(thisString, "=" , "")
       thisString=Replace(thisString, "?" , " ")
      thisString=Replace(thisString, "/" , "")
      thisString=Replace(thisString, "+" , "")
      thisString=Replace(thisString, "%" , "")
      tidyup=Replace(thisString, ">" , "")
END FUNCTION
%> 

   <table width=100% height="122" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      <td align="center" valign="top"><img src="graphics/burswoodBanner.jpg" alt="Burswood Car Rentals" name="cars" width="599" height="133" border="0" usemap="#carsMap" id="cars" /></td>
      </tr>
      </table>

<TABLE align=center width="599" cellSpacing=0 cellPadding=0  border=0>
<tr><td >   

<!-- RCM HTML CODE----------->

<%
SUB   KmsReSelectedInSubs  '--used in all subs
               SQL="SELECT * from KmsFree  WHERE ID="&Request.Form("KmsFreeID")&" "
                  Set s_km=webConn.Execute(SQL)
                  KmsFree=s_km("KmsFree")
                  AddKmsFee=s_km("AddKmsFee")
                  KmsMaxcharge=s_km("MaxPrice")
                  KmsDailyRate=s_km("DailyRate")
                  Session("RCM169a_KmsFree") =s_km("KmsFree")
                 Session("RCM169a_AddKmsFee") =s_km("AddKmsFee")
                   sKmsMaxprice=""
                   Session("RCM169a_KmsDesc")=""
                         if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                            '--unlimited without daily charge
                            Session("RCM169a_KmsDesc")="Unlimited Kms"
                             '--if  pass Unlimited, save the 0 Daily rate  to the Reservationfees table
                             '--if daily rate =0 then print unlimited in the documents
                               Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='1'>")
                               webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM169a_OnlineBookingNo")&" ")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                        SQL=SQL&"VALUES ("&Session("RCM169a_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                                  'Response.Write(SQL)
                     webConn.Execute(SQL)

                  elseif s_km("AddKmsFee")>0 and s_km("DailyRate")>0 then
                             iKmsDailyRate=s_km("DailyRate")
                           Session("RCM169a_KmsDesc")="Daily rate @"&Session("RCM169a_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))&", "&s_km("KmsFree")&" Kms free per day, additional per Kms "&Session("RCM169a_CompanyCurrency")&" "&FormatNumber(s_km("AddKmsFee"))
                          Response.Write("<input type='hidden' name='KmsSaveFees' size='5' value='1' />")
                          webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM169a_OnlineBookingNo")&" ")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                           SQL=SQL&"VALUES ("&Session("RCM169a_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                           'Response.Write(SQL)
                           webConn.Execute(SQL)
                           Session("RCM169a_KmsCost")= iKmsDailyRate*Session("RCM169a_TotalRentalDays")

                  elseif s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate") >0 then
                           '--unlimited with daily charge
                           iKmsDailyRate=s_km("DailyRate")
                          Session("RCM169a_KmsDesc")="Unlimited Kms, daily rate @ $"&FormatNumber(s_km("DailyRate"))
                          Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='1'>")
                             webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM169a_OnlineBookingNo")&" ")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                           SQL=SQL&"VALUES ("&Session("RCM169a_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                              'Response.Write(SQL)
                           webConn.Execute(SQL)
                           Session("RCM169a_KmsCost")= iKmsDailyRate*Session("RCM169a_TotalRentalDays")
                  elseif  s_km("MaxPrice")>0 then
                           sKmsMaxprice=", max charge $"&FormatNumber(s_km("MaxPrice"))&" per day"
                           Session("RCM169a_KmsDesc")=s_km("KmsFree")&" Kms free per day, additional per Kms $"&FormatNumber(s_km("AddKmsFee"))&" "&sKmsMaxprice
                            Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='1'>")
                               webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM169a_OnlineBookingNo")&" ")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                        SQL=SQL&"VALUES ("&Session("RCM169a_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                              'Response.Write(SQL)
                     webConn.Execute(SQL)
                        'Session("RCM169a_KmsCost")=s_km("MaxPrice")
                     else
                        Session("RCM169a_KmsDesc")=s_km("KmsFree")&" Kms free per day, additional per Kms $"&FormatNumber(s_km("AddKmsFee"))
                            Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='0'>")
                      end if
                     Response.Write("<input type='hidden' name='KmsFree' size=5 value='"&KmsFree&"' >")
                  Response.Write("<input type='hidden' name='AddKmsFee' size=5 value='"&AddKmsFee&"' >")
                  Response.Write("<input type='hidden' name='KmsMaxcharge' size=5 value='"&KmsMaxcharge&"'>")
                  Response.Write("<input type='hidden' name='KmsDailyRate' size=5 value='"&KmsDailyRate&"'>")
                      s_km.CLOSE
                        set s_km=nothing
                            TotalCost=TotalCost+   Session("RCM169a_KmsCost")

END SUB
SUB PersonalInfoForm
%>

         <TR ><td colspan=4 align=center bgColor=<%=Session("RCM169a_CompanyColour")%>   class=header>Renter Information - Please fill in all the renter information
</td></tr>
        <tr><td></td><td class=text colspan=3>
         <table width=100% border=0  cellpadding=0 cellspacing=1>
             <tr><td width=120 align=left class=text><font color=red>*</font>First Name:</td><td align=left class=text  colspan=2><input Type=text name=firstname maxlength=30 Size=30 value='<%=Session("RCM169a_FirstName")%>'></td></tr>
       <tr><td align=left class=text><font color=red>*</font>Last Name:</td><td align=left class=text colspan=2><input Type=text name=lastname maxlength=30 Size=30 value='<%=Session("RCM169a_LastName")%>'></td></tr>

        </td></tr>

        <tr><td align=left class=text><font color=red>*</font>Address:</td><td align=left class=text  colspan=2><input type=text name=address size=30 maxlength=80 value='<%=Session("RCM169a_address")%>'></td></tr>
        <tr><td align=left class=text><font color=red>*</font>City:</td><td align=left class=text  colspan=2><input type=text name=city size=30 maxlength=50 value='<%=Session("RCM169a_city")%>'></td></tr>
        <tr><td align=left class=text>State/Province:</td><td align=left class=text  colspan=2><input type=text name=state maxlength=30 size=30 value='<%=Session("RCM169a_state")%>' ></td></tr>
        <tr><td align=left class=text>Postcode/ZIP:</td><td align=left class=text  colspan=2><input type=text name=postcode maxlength=10 size=30 value='<%=Session("RCM169a_postcode")%>'></td></tr>
        <tr><td align=left class=text><font color=red>*</font>Country of Residence:</td><td align=left class=text  colspan=2>
             <%   Set s_c=webConn.Execute("SELECT * FROM Country ORDER BY  Country " )
            Response.Write("<SELECT name=CountryID>")
             Response.Write("<option value=0 selected>Please Select</option>")
                WHILE NOT s_c.EOF  
                        if  Cstr(s_c("ID"))=Session("RCM169a_countryID") then
                               Response.Write("<option value='"&s_c("ID")&"' selected='selected'>"&s_c("Country")&"</option>")
                        else
                           if s_c("Defaulted")=-1 then
                              Response.Write("<option value='"&s_c("ID")&"' selected='selected'>"&s_c("Country")&"</option>")
                              else
                                 Response.Write("<option value='"&s_c("ID")&"' >"&s_c("Country")&"</option>")
                              end if
                         end if
            s_c.MoveNext 
            Wend
            s_c.Close
      Set s_c=nothing
            Response.Write("</SELECT>")  
         
           
           %>
</td></tr>
   <tr><td align=left class=text><font color=red>*</font>Email Address:</td><td align=left class=text  colspan=2><input Type=text name=CustomerEmail maxlength=50 Size=30 value='<%=Session("RCM169a_CustomerEmail")%>'></td></tr>
             <tr><td align=left class=text></td><td align=left class=text  colspan=2><small><b><font color=red>(Please check renter's Email Address is correct)</font></td></tr>
       <tr><td align=left class=text><font color=red>*</font>Phone (incl area code):</td><td align=left class=text  colspan=2><input Type=text name=Phone Size=30 maxlength=20 value='<%=Session("RCM169a_phone")%>'></td></tr>
         <tr><td align=left class=text>Facsimile:</td><td align=left class=text  colspan=2><input type=text name=fax size=30 maxlength=15 value='<%=Session("RCM169a_Fax")%>'></td></tr>
     <!--  <tr>
       <td CLASS=text align=left>Arrival FLT:</td>
       <td CLASS=text align=left><input Type=text name=Flight maxlength=50 Size=30 value='<%=Session("RCM169a_Flight")%>'></td>
     </tr><tr>
        <td CLASS=text align=left>Departure FLT:</td>
       <td CLASS=text align=left><input Type=text name=Flightout maxlength=50 Size=30 value='<%=Session("RCM169a_Flightout")%>'></td>
       </tr> <tr>-->
        <td CLASS=text align=left><font color=red>*</font>Number of Travelling:</td>
       <td CLASS=text align=left><input Type=text name=NoTravelling Size=30 value='<%=Session("RCM169a_NoTravelling")%>'></td>
      </tr>  <tr> <tr>
        <td align=left class=text>Additional Details:</td>
        <td align=left class=text colspan=2><textarea name=Notes cols=40 maxlength=250 onkeyup="return ismaxlength(this)" rows=3><%=Session("RCM169a_Notes")%></textarea></td>
     </tr>  </table></td></tr>

         <TR ><td colspan=4 align=center bgColor=<%=Session("RCM169a_CompanyColour")%>   class=header>Payment Details</td></tr>
         <tr><td></td><td class=text colspan=3>

<!--
             <table width=100% border=0  cellpadding=0 cellspacing=1>
            <tr> <td align=left width=120 class=text><font color=red>*</font>Credit Card:&nbsp;</td>
                <td align=left colspan=2>
               <select name=ccType>")
               <option value="" selected="selected">Please select</option>
     <%  Set s_ct=webConn.Execute("SELECT * from CreditCardType where WebType=1 and LocationID='"&Session("RCM169a_PickupLocationID")&"' order by CardType")
         if  s_ct.EOF then
                  s_ct.close
                  set s_ct=nothing
                  Set s_ct=webConn.Execute("SELECT * from CreditCardType where WebType=1 and LocationID=0 order by CardType")
         end if
         While Not s_ct.EOF
                  Response.Write("<option value='"&s_ct("CardType")&"'>"&s_ct("CardType")&"</option> ")

         s_ct.MoveNext
         Wend
         s_ct.close
         set s_ct=nothing

       %>
             </select> </td> </tr>
             <tr><td  align=left class=text><font color=red>*</font>Card number:&nbsp;</td>
                <td align=left colspan=2>
                  <input type="text" maxlength="16" size=25 name="ccNumber" onBlur="checkNumericField(this,0,9999999999999999,'','','');"  value"">
                </td></tr>
              <tr><td align=left class=text><font color=red>*</font>Name on Card:&nbsp;</td>
                <td align=left colspan=2><input type=text name=ccName size=25>
                </td></tr>
              <tr><td  align=left class=text nowrap><font color=red>*</font>Expiry Date:&nbsp;</td>
                 <td class=text align=left colspan=2>
                  <input type="text" maxlength="2" size="2" name="ccDate1" onBlur="checkNumericField(this,0,12,'','','');"  value"">&nbsp;mm&nbsp;
                  <input type="text" maxlength="2" size="2" name="ccDate2" onBlur="checkNumericField(this,0,15,'','','');"  value"">&nbsp;yy
                  </td></tr>
                  </table></td></tr>

-->

<!--    -----------test start -->

      <table width=100% border=0  cellpadding=0 cellspacing=1>
            <tr> <td align=left width=120 class=text><font color=red>*</font>Credit Card:&nbsp;</td>
                <td align=left colspan=2>
               <select name=ccType>")

               <option value="" selected="selected">Please select</option>
                  <option value="Visa">Visa</option>
                  <option value="Master Card">Master Card</option>
                     <option value="Amex">Amex</option>
                        <option value="Diners">Diners</option>

               </select>
                </td>
              </tr>

                <tr><td  align=left class=text><font color=red>*</font>Card number:&nbsp;</td>
                <td align=left colspan=2>

                  <input type="text" maxlength="4" size="4" name="ccNumber1" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                  <input type="text" maxlength="4" size="4" name="ccNumber2" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                  <input type="text" maxlength="4" size="4" name="ccNumber3" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                  <input type="text" maxlength="4" size="4" name="ccNumber4" onBlur="checkNumericField(this,0,9999,'','','');"  value"">
                </td>
              </tr>
             <tr><td align=left class=text><font color=red>*</font>Name on Card:&nbsp;</td>
                <td align=left colspan=2>
                <input type=text name=ccName size=25>
               </td>
             </tr>

            <tr><td  align=left class=text nowrap><font color=red>*</font>Expiry Date:&nbsp;</td>
                 <td class=text align=left colspan=2>
                  <input type="text" maxlength="2" size="2" name="ccDate1" onBlur="checkNumericField(this,0,12,'','','');"  value"">&nbsp;mm&nbsp;
                  <input type="text" maxlength="2" size="2" name="ccDate2" onBlur="checkNumericField(this,0,35,'','','');"  value"">&nbsp;yy

      </td></tr>
                  </table></td></tr>
<!--
---------test end
-->


         <TR height=2><td colspan=4 bgColor=<%=Session("RCM169a_CompanyColour")%>  ></td></tr>
       <TR><td colspan=4 align=right  class=text>
         <font color=red>*</font><font color="#FF6600">Required fields must be completed</font>
         <INPUT TYPE=button NAME=Back  VALUE=Back  class=button onClick='javascript:history.back(-1)'>
        &nbsp;&nbsp;
        <input type=submit class=button value='Continue'>


     </td></tr></form>

<%   
END SUB
  
   
 
'------ check, Not to let under 21years proceed with booking
 

 
'------------------------------------------------------------------------------------------
if Request.QueryString("dir")="Rate"  then
  
   '---Vehicle Type----------  
   Session("RCM169a_CarType")=""
         Session("RCM169a_CarSizeID")=0
         Session("RCM169a_CarImageName")=""
         SQL="SELECT * FROM CarSize WHERE (ID)='"&Request.Form("CarSizeID")&"'"
         Set s_cs=webConn.Execute(SQL) 
         Session("RCM169a_CarType")=s_cs("Size")
         if s_cs("WebDesc")<>"" then
         Session("RCM169a_CarType")=s_cs("WebDesc")
         end if
         Session("RCM169a_CarSizeID")=Request.Form("CarSizeID")
         Session("RCM169a_FreeSale")=s_cs("FreeSale")
         Session("RCM169a_CarImageName")=s_cs("ImageName")
         Session("RCM169a_Flight")=tidyup(Request.Form("Flight"))
      Session("RCM169a_Flightout")=tidyup(Request.Form("Flightout"))
      Session("RCM169a_NoTravelling")=tidyup(Request.Form("NoTravelling"))
    
        s_cs.CLOSE 
        SET s_cs=nothing
        Session("RCM169a_URL")="Burswood Agent"
    '---Insert the booking details to WebReservation table  
   IF Session("RCM169a_OnlineBookingNo") <>"" then
      SQL="UPDATE WebReservation SET "
        'SQL=SQL&" URL ='"&Session("RCM169a_URL")&"',  "
         SQL=SQL&"AgencyName ='"&Left(tidyup(Session("RCM169a_AgencyName")),40)&"', "
         SQL=SQL&"AgentBranchID ='"&Session("RCM169a_AgentBranchID")&"', "
        SQL=SQL&" Email ='"&Left(tidyup(Request.Form("CustomerEmail")),50)&"',  "
         SQL=SQL&" Name ='"&Left(tidyup(Request.Form("lastname")),30)&"',  "
        SQL=SQL&"Phone ='"&Left(tidyup(Session("RCM169a_phone")),20)&"' , "
      SQL=SQL&"NoTravelling ='"&Left(tidyup(Session("RCM169a_NoTravelling")),20)&"' , "
      SQL=SQL&"CarSizeID ="&(Session("RCM169a_CarSizeID"))&", "
        SQL=SQL&"Flight ='"&Left(tidyup(Session("RCM169a_Flight")),50)&"', "
        SQL=SQL&"Flightout ='"&Left(tidyup(Session("RCM169a_Flightout")),50)&"', "
        SQL=SQL&"PickupdateTime ='"&Session("RCM169a_RequestPickDateTime")&"', "
         SQL=SQL&"DropoffDateTime ='"&Session("RCM169a_RequestDropDateTime")&"', "
         SQL=SQL&"Pickupdate ='"&Session("RCM169a_RequestPickDate")&"', "
         SQL=SQL&"PickupTime ='"&Session("RCM169a_RequestPickTime")&"', "
         SQL=SQL&"DropoffDate ='"&Session("RCM169a_RequestDropDate")&"', "
        SQL=SQL&"DropoffTime ='"&Session("RCM169a_RequestDropTime")&"', "
         SQL=SQL&"PickupLocationID ="&Session("RCM169a_PickupLocationID")&", "
        SQL=SQL&"DropoffLocationID ="&Session("RCM169a_DropoffLocationID")&" "
        SQL=SQL&"WHERE (ReservationNo) ='"&Session("RCM169a_OnlineBookingNo")&"'"
       'Response.Write(SQL)
        webConn.Execute(SQL)
           '---if reflash the screen, delete the extra and rate then insert again   
          'webConn.Execute("DELETE  FROM WebReservationPayment WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' ")
          webConn.Execute("DELETE  FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' ")
          webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' ")
          
  else                 
      
        SQL="INSERT INTO WebReservation (AgencyName,AgentBranchID,BrandID,URL,Phone,Email,Name, NoTravelling,Flightout,Flight,PickupDateTime,DropoffDateTime,RentalSource,CarSizeID,PickupTime,Pickupdate,DropoffTime,DropoffDate,PickupLocationID,DropoffLocationID,ReservationTypeID)"
        SQL=SQL&"VALUES ('"&Left(tidyup(Session("RCM169a_AgencyName")),30)&"','"&Session("RCM169a_AgentBranchID")&"',6,'"&Session("RCM169a_URL")&"','"&Left(tidyup(Session("RCM169a_phone")),20)&"','"&Left(tidyup(Request.Form("CustomerEmail")),50)&"','"&Left(tidyup(Request.Form("lastname")),30)&"','"&Left(tidyup(Session("RCM169a_NoTravelling")),20)&"', '"&Left(tidyup(Session("RCM169a_Flightout")),50)&"','"&Left(tidyup(Session("RCM169a_Flight")),50)&"','"&Session("RCM169a_RequestPickDateTime")&"','"&Session("RCM169a_RequestDropDateTime")&"' ,'Online Booking',"&(Session("RCM169a_CarSizeID"))&",'"&Session("RCM169a_RequestPickTime")&"','"&Session("RCM169a_RequestPickDate")&"','"&Session("RCM169a_RequestDropTime")&"', '"&Session("RCM169a_RequestDropDate")&"', "&Session("RCM169a_PickupLocationID")&", "&Session("RCM169a_DropoffLocationID")&", '1')"
       
       'Response.Write("<p>") 
       'Response.Write(SQL)
   webConn.Execute(SQL)  
 
   '---get the ReservationNo
    Set s_No=webConn.Execute("SELECT Max(ReservationNo)  as ResNo FROM WebReservation where AgentBranchID='"&Session("RCM169a_AgentBranchID")&"' ")
    Session("RCM169a_OnlineBookingNo")=s_No("ResNo")
      'Response.Write(Session("RCM169a_OnlineBookingNo"))
      s_No.close
    end if
    

        '----Relocation fee-------------
         Session("RCM169a_RelocationFee")=0
         Session("RCM169a_RelocationFeeID")=0
         Session("RCM169a_RelocationFeeName")=""
         RelocationFeeGST=0
         RelocationFeeStampDuty=0
                '--1. check Relocation record (with caterory, date range)
         SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
         SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID and (CarSizeID)='"&Session("RCM169a_CarSizeID")&"'  and Mandatory=0 "
         SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM169a_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM169a_DropoffLocationID")&"'  "
         SQL=SQL&" AND PickupDateFrom<='"&Session("RCM169a_RequestPickDate")&"'  and PickupDateTo >= '"&Session("RCM169a_RequestPickDate")&"' "
                  '--next line of code will return the max Minbookingday if there are 2 records entered for same conditin
         SQL=SQL&"  AND MinBookingDay<='"&Session("RCM169a_TotalRentalDays")&"' order by MinBookingDay desc "
         'Response.Write(SQL)
          Set s_o=webConn.Execute(SQL)
          if  s_o.EOF THEN
                  s_o.close
                  Set s_o=Nothing
                  '--2. if no vehicle category Relocation fee found, check Relocation record (with  date range only)
                  SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                  SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID  and Mandatory=0  "
                  SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM169a_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM169a_DropoffLocationID")&"'  "
                  SQL=SQL&" AND PickupDateFrom<='"&Session("RCM169a_RequestPickDate")&"'  and PickupDateTo >= '"&Session("RCM169a_RequestPickDate")&"' "
                  SQL=SQL&"  AND MinBookingDay<='"&Session("RCM169a_TotalRentalDays")&"' order by MinBookingDay desc "
                  'Response.Write(SQL)
                   Set s_o=webConn.Execute(SQL)
                   if  s_o.EOF THEN
                        s_o.close
                        Set s_o=Nothing
                        '--3. if no vehicle category Relocation fee found, check Relocation record (with  catgory, no date ragne)
                        SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                        SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID  and (CarSizeID)='"&Session("RCM169a_CarSizeID")&"' "
                        SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM169a_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM169a_DropoffLocationID")&"'  "
                        SQL=SQL&"  AND  Year(PickupDateFrom)=2100  and Mandatory=0 "
                        SQL=SQL&"  AND MinBookingDay<='"&Session("RCM169a_TotalRentalDays")&"' order by MinBookingDay desc "
                        'Response.Write(SQL)
                        Set s_o=webConn.Execute(SQL)
                        if  s_o.EOF THEN
                              s_o.close
                              Set s_o=Nothing
                                    '--4. if no vehicle category Relocation fee found, check Relocation record (with no catgory, no date ragne)
                              SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                              SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID   and Mandatory=0 "
                              SQL=SQL&" AND CarSizeID=0 "
                              SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM169a_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM169a_DropoffLocationID")&"'  "
                              SQL=SQL&"  AND  Year(PickupDateFrom)=2100 and CarSizeID=0"
                              SQL=SQL&"  AND MinBookingDay<='"&Session("RCM169a_TotalRentalDays")&"' order by MinBookingDay desc "
                              'Response.Write(SQL)
                              Set s_o=webConn.Execute(SQL)
                        end if
                  end if

         end if



         if NOT s_o.EOF THEN
                if  s_o("DaysNocharge")=0 or (s_o("DaysNocharge")>0 and Session("RCM169a_TotalRentalDays")<s_o("DaysNocharge"))  then
                     Session("RCM169a_RelocationFee")=s_o("Fees")
                     Session("RCM169a_RelocationFeeID")=s_o("ID")
                     Session("RCM169a_RelocationFeeName")=s_o("Name")
                     if s_o("GST")="True" then
                           RelocationFeeGST=s_o("Fees")
                     end if
                     if s_o("StampDuty")="True" then
                           RelocationFeeStampDuty=s_o("StampDuty")
                     end if

                     webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&s_o("ID")&" ")
                        if s_o("Fees")<>0 then
                           SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
                           SQL=SQL&"VALUES ("&s_o("Fees")&",'"&Session("RCM169a_OnlineBookingNo")&"','"&s_o("ID")&"','"&s_o("Fees")&"',1)"
                           'Response.Write("<br>")
                                  'Response.Write(SQL)
                                 webConn.Execute(SQL)
                        end if
                 end if
         end if
         s_o.CLOSE
         SET s_o=NOTHING





 '-----Pickup Location After hours and befores fee, check if the pickup time is between the office time-------------
        Session("RCM169a_AfterHoursFee")=0
        Session("RCM169a_PickupAfterHoursFee")=0
        AfterHoursFeeGST=0
        AfterHoursFeeStampDuty=0
        if Session("RCM169a_PickupAfterHourFeeID")<>0  then 'check the time
               AfterHoursFee=0
               Set s_st=webConn.Execute("SELECT ID, Name, Fees,GST,StampDuty FROM ExtraFees WHERE (ID)='"&Session("RCM169a_PickupAfterHourFeeID")&"' ")
               if s_st("Fees")  <>0 then
               AfterHoursFee=s_st("Fees")
               AfterHoursGST=s_st("GST")
               AfterHoursStampDuty=s_st("StampDuty")
                     PickupAfterHoursFeeID=s_st("ID")

            end if
            s_st.close
         SET s_st=nothing
               '---Pickup Location After Hour fees   'do not convert to CDate
                PickupOpeningTime=(Session("RCM169a_RequestPickDate")&" "&Session("RCM169a_PickupOfficeOpeningTime"))
            PickupClosingTime=(Session("RCM169a_RequestPickDate")&" "&Session("RCM169a_PickupOfficeClosingTime"))
                if (Session("RCM169a_RequestPickDateTime") < PickupOpeningTime) or (Session("RCM169a_RequestPickDateTime") > PickupClosingTime) THEN
                        Session("RCM169a_PickupAfterHoursFee")=AfterHoursFee

          if AfterHoursGST="True" then
                           AfterHoursFeeGST=Session("RCM169a_PickupAfterHoursFee")
                      end if
                      if AfterHoursStampDuty="True" then
                           AfterHoursFeeStampDuty=Session("RCM169a_PickupAfterHoursFee")
                  end if
                end if
   end if

     '------------Dropoff Location After Hour Fees ------------------
    Session("RCM169a_DropoffAfterHoursFee")=0
    if Session("RCM169a_DropoffAfterHourFeeID")<>0  then
           Set s_st=webConn.Execute("SELECT ID, Name, Fees,GST,StampDuty FROM ExtraFees WHERE (ID)='"&Session("RCM169a_DropoffAfterHourFeeID")&"' ")
                 if s_st("Fees")  <>0 then
               AfterHoursFee=s_st("Fees")
               AfterHoursGST=s_st("GST")
               AfterHoursStampDuty=s_st("StampDuty")
               DropoffAfterHoursFeeID=s_st("ID")

            end if
            s_st.close
         SET s_st=nothing
           DropoffOpeningTime=(Session("RCM169a_RequestDropDate")&" "&Session("RCM169a_DropoffOfficeOpeningTime"))
            DropoffClosingTime=(Session("RCM169a_RequestDropDate")&" "&Session("RCM169a_DropoffOfficeClosingTime"))
         if (Session("RCM169a_RequestDropDateTime") < DropoffOpeningTime) or (Session("RCM169a_RequestDropDateTime") > DropoffClosingTime) THEN
                        Session("RCM169a_DropoffAfterHoursFee")=  AfterHoursFee
                        if AfterHoursGST="True" then
                           AfterHoursFeeGST=AfterHoursFeeGST+Session("RCM169a_DropoffAfterHoursFee")
                      end if
                      if AfterHoursStampDuty="True" then
                           AfterHoursFeeStampDuty=AfterHoursFeeStampDuty+Session("RCM169a_DropoffAfterHoursFee")
                  end if
                end if



        end if
         AfterHoursFee=   Session("RCM169a_PickupAfterHoursFee")+Session("RCM169a_DropoffAfterHoursFee")
             Session("RCM169a_AfterHoursFee")=AfterHoursFee
      if Session("RCM169a_PickupAfterHoursFee")>0  and Session("RCM169a_DropoffAfterHoursFee")=0 then
                 '---insert AfterHours Fee to WebPaymentExtraFees table
                  webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&PickupAfterHoursFeeID&" ")
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&Session("RCM169a_PickupAfterHoursFee")&",'"&Session("RCM169a_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("RCM169a_PickupAfterHoursFee")&",1,1)"
                  'Response.Write("<p>")
                  'Response.Write(SQL)
                  webConn.Execute(SQL)

        elseif Session("RCM169a_PickupAfterHoursFee")=0 and Session("RCM169a_DropoffAfterHoursFee")>0 then
                  '---insert AfterHours Fee to WebPaymentExtraFees table
                  webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&DropoffAfterHoursFeeID&" ")
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&Session("RCM169a_DropoffAfterHoursFee")&",'"&Session("RCM169a_OnlineBookingNo")&"',"&DropoffAfterHoursFeeID&","&Session("RCM169a_DropoffAfterHoursFee")&",1,1)"
               '  Response.Write("<p>")
                ' Response.Write(SQL)
                  webConn.Execute(SQL)
        elseif Session("RCM169a_PickupAfterHoursFee")>0 and Session("RCM169a_DropoffAfterHoursFee")>0 then

               if PickupAfterHoursFeeID=DropoffAfterHoursFeeID then
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&AfterHoursFee&",'"&Session("RCM169a_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("RCM169a_PickupAfterHoursFee")&",1,2)"
               '  Response.Write("<p>")
                ' Response.Write(SQL)
                  webConn.Execute(SQL)
                else
                     SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                     SQL=SQL&"VALUES ("&AfterHoursFee&",'"&Session("RCM169a_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("RCM169a_PickupAfterHoursFee")&",1,1)"
                      ' Response.Write("<p>")
                       'Response.Write(SQL)
                     webConn.Execute(SQL)
                    SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                     SQL=SQL&"VALUES ("&AfterHoursFee&",'"&Session("RCM169a_OnlineBookingNo")&"',"&DropoffAfterHoursFeeID&","&Session("RCM169a_PickupAfterHoursFee")&",1,1)"
                     '  Response.Write("<p>")
                     ' Response.Write(SQL)
                   webConn.Execute(SQL)
                end if
        end if


   '----Get TaxName 1  ----------------------
   Session("RCM169a_TaxName1") ="GST"
   Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='TAX1'  ")
   If not s_st.EOF then
            Session("RCM169a_TaxName1") = s_st("syValue")
   END IF
   s_st.CLOSE
   SET s_st=NOTHING
         
   '----get TaxName 2 --------------  
    Session("RCM169a_TaxName2") ="Stamp Duty"
    Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='TAX2'  ")
    If not s_st.EOF then     
               Session("RCM169a_TaxName2") = s_st("syValue")
    END IF
    s_st.CLOSE
    SET s_st=NOTHING   
        
'----GST Inclusive--------------------------------
   Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='GSINC'  ")
   Session("RCM169a_GSTInclusive") = "Yes"
   If not s_st.EOF then     
            Session("RCM169a_GSTInclusive") = s_st("syValue")
   END IF
   s_st.CLOSE
   SET s_st=NOTHING 
      
    
      
END IF     %>






   <TABLE  width=600  align=center bgcolor=<%=Session("RCM169a_CompanyColour")%>   cellSpacing=0 cellPadding=1  border=0><tr><td>
   <TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>
   <tr height=20><td  align=center class=header bgColor=<%=Session("RCM169a_CompanyColour")%>  colspan=4>STEP 4 - Confirm Quote & Enter Personal Information</td></tr>
    
    <%   '----------the form
    'Response.Write("<form method=post action='webAgentBooking3.asp?dir=checkAge'  name='emailbooking'  onsubmit='return Validate(this)'>")
          Response.Write("<form method=post action='webAgentBooking5.asp'  name='theForm'  onSubmit='return Validate();'>")
      
            Response.Write("<tr><td></td><td width=""120"" align=left class=text>Pickup Location:</td><td align=left class=text colspan=2> ")
                        Response.Write(Session("RCM169a_PickupLocation"))
                        Response.Write("</td></tr>")
                       
                        Response.Write("<tr><td></td><td align=left class=text>Pickup Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("RCM169a_RequestPickDate")))&", ")
                        'Response.Write(Session("RCM169a_RequestPickDateTime"))
                        Response.Write(Day(Session("RCM169a_RequestPickDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestPickDate"))),3)&"/"&Year(Session("RCM169a_RequestPickDate")))
                        Response.Write("&nbsp;")
                        Response.Write(Session("RCM169a_RequestPickTime"))
                        Response.Write("</td></tr>")
                        

                        Response.Write("<tr><td></td><td align=left class=text>Return Location: </td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM169a_DropoffLocation"))
                        Response.Write("</td></tr>") 
                       
                      
                        Response.Write("<tr><td></td><td align=left class=text>Return Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("RCM169a_RequestDropDate")))&", ")
                         'Response.Write(Session("RCM169a_RequestDropDateTime"))
                        Response.Write(Day(Session("RCM169a_RequestDropDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestDropDate"))),3)&"/"&Year(Session("RCM169a_RequestDropDate")))
                        Response.Write("&nbsp;")
                        Response.Write(Session("RCM169a_RequestDropTime"))
                       
                        Response.Write("</td></tr>")
                      

                       
   '---Vehicle Type---------- 
       Response.Write("<tr><td></td><td align=left class=text>Vehicle Type: </td><td align=left class=text>"&Session("RCM169a_CarType")&"</td><td align=left class=text align=right></td></tr>")
       
      '---Vehicle Type----------
      
     theimage=RCMURL&"/DB/"&CompanyCode&"/"&Session("RCM169a_CarImageName")
                 
       Response.Write("<tr><td></td><td align=left class=text> </td><td class=text><img src='"&theimage&"'  WIDTH=100 ></td><td class=text align=right></td></tr>")
      
    
   '-------------Rate -----------------
    if Request.QueryString("dir")="Rate"  then
        '---------if  from step3, do all calculation ----
          'SQL="DELETE  FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' "
          'Response.Write("<br>")
          'Response.Write(SQL)
          webConn.Execute("DELETE FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' ")
          for i=1 to Request.Form("SeasonCount")
                 SeasonID=Request.Form("SeasonID"&i&"")  
                NoOfDaysEachSeason=0
            if Request.Form("NoOfDaysEachSeason"&i&"")  <>"" then
               NoOfDaysEachSeason=Request.Form("NoOfDaysEachSeason"&i&"")
            end if
            TotalNoDays=TotalNoDays+NoOfDaysEachSeason 
          
                 '------------- need recalculate the rate--------------  
                StandardRate=  Request.Form("StandardRate"&i&"") 
                Rate=  Request.Form("Rate"&i&"") 
          
               costEachSeason=Rate*Session("RCM169a_NoOfDaysEachSeason"&i&"")
            RentalCost=RentalCost+costEachSeason
                
                        
                '--insert rate to WebPaymentDetail table
                 '--get each season record from the form and insert to paymentdetailes table 
  
                '---insert to the PaymentDetail table
                  SQL="INSERT INTO WebPaymentDetail (DiscountID,DiscountName,DiscountType,DiscountPerc,StandardRate,Rate,ReservationNo,SeasonID,Days,RateName)" 
                  SQL=SQL&"VALUES ("&Session("RCM169a_DiscountID")&",'"&tidyup(Session("RCM169a_DiscountName"))&"','"&(Session("RCM169a_DiscountType"))&"',"&Session("RCM169a_DiscountRate")&",'"&StandardRate&"','"&Rate&"','"&Session("RCM169a_OnlineBookingNo")&"','"&Request.Form("SeasonID"&i&"")&"','"&NoOfDaysEachSeason&"','"&Request.Form("RateName"&i&"")&"')"
               'Response.Write("<br>") 
            'Response.Write(SQL)
               webConn.Execute(SQL) 
            
   NEXT           
        
     
      
      TotalCost=RentalCost+Session("RCM169a_RelocationFee")+Session("RCM169a_AfterHoursFee")
    
     
      '-------------Selected Extra fees-----------------  
     EachExtraFees=0 
     TotalExtraFees=0 
     ExtraStamp=0
     ExtraGST=0
     k=0  
     For j=0 to CInt(Request.Form("ExtraFeeCount"))
        if Request.Form("ExtraFeesID"&j&"")<>"" then
                  'if daily, save the totalnodays and extrafee rate to PaymentExtraFees table
              'if fixed ExtraFeesNoDays = 1....
                           SetMaxPrice=0 
                           if Request.Form("ExtraFees"&j&"")<>"" then 
                        ExtraFeesRate=Request.Form("ExtraFees"&j&"")
                    end if  
                    
                    if Request.Form("FeeType"&j&"")="Daily" then   
                              if CCur(Request.Form("Maxprice"&j&""))>0 and Session("RCM169a_TotalRentalDays")*Request.Form("ExtraFees"&j&"")>CCur(Request.Form("Maxprice"&j&"")) then
                                          EachExtraFees=Request.Form("Maxprice"&j&"")*Request.Form("QTY"&j&"")
                                       ExtraFeesRate=Request.Form("Maxprice"&j&"")
                                       ExtraFeesNoDays=1
                                       ExtraType="Fixed" 
                                       SetMaxPrice=1
                                 else 
                                       EachExtraFees=Session("RCM169a_TotalRentalDays")*Request.Form("ExtraFees"&j&"")*Request.Form("QTY"&j&"")
                                       ExtraFeesNoDays=Session("RCM169a_TotalRentalDays")
                                       ExtraType="Daily" 
                                    end if 
                         elseif Request.Form("FeeType"&j&"")="Fixed" then 
                                 EachExtraFees = Request.Form("ExtraFees"&j&"")*Request.Form("QTY"&j&"")
                                 ExtraFeesNoDays=1
                                 ExtraType="Fixed"
            
                         else   
                                 EachExtraFees =(Request.Form("ExtraFees"&j&"")/100)*RentalCost* Request.Form("QTY"&j&"")
                                 ExtraFeesNoDays=1
                                 ExtraType="Perscentage"
                  
                           end if   
                           
                        
                            
                        TotalExtraFees=EachExtraFees+ TotalExtraFees   
                              
                        '----Stamp Duty for extraFees ---------
              eachExtraStamp=0  
              if Request.Form("StampDuty"&j&"")="True" Then  
                                  eachExtraStamp=EachExtraFees
                        end if
                        ExtraStamp=ExtraStamp+eachExtraStamp  
                              
                           '----GST for extraFees ---------
                           eachExtraGST=0
                           if Request.Form("GST"&j&"")="True" Then  
                                 eachExtraGST=EachExtraFees
                           end if
                           ExtraGST=ExtraGST+eachExtraGST    
                         '--insert the selected Extra Fees to WebPaymentExtraFees table       
              webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and (ExtraFeesID)='"&Request.Form("ExtraFeesID"&j&"")&"' ")
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,SetMaxPrice,QTY, ReservationNo,ExtraFeesID,Fees,Days)" 
               SQL=SQL&"VALUES ("&EachExtraFees&","&SetMaxPrice&",'"&Request.Form("QTY"&j&"")&"','"&Session("RCM169a_OnlineBookingNo")&"','"&Request.Form("ExtraFeesID"&j&"")&"','"&ExtraFeesRate&"','"&ExtraFeesNoDays&"')"
                
                     webConn.Execute(SQL) 
                        
                end if    
     NEXT
     TotalCost=TotalCost+TotalExtraFees
     
    
    
    
     '-----Insurance Fee------------
        InsuranceExtraValue=0
        Session("RCM169a_InsuranceFee")=0
        GSTInsurance=0 
         if Request.Form("InsuranceID")<>"" then
                 Session("RCM169a_InsuranceID")=Request.Form("InsuranceID")
                SQL="SELECT * from ExtraFees WHERE (ID)='"&Request.Form("InsuranceID")&"' "
                 Set s_insu=webConn.Execute(SQL)
            if NOT s_insu.EOF  then
                     'InsuranceExtraValue=s_insu("Fees") 
                     Session("RCM169a_InsuranceFee")=s_insu("Fees")  '--for pass to step5
                   
                     if s_insu("Type")="Daily" then
                           InsuranceExtraValue=Session("RCM169a_TotalRentalDays")*s_insu("Fees")
                     elseif s_insu("Type")="Fixed" then
                           InsuranceExtraValue=s_insu("Fees")
                     else
                        InsuranceExtraValue=(s_insu("Fees")/100)*RentalCost
                     end if  
                           InsuranceSetMaxPrice =0   
                        InsuranceRate=s_insu("Fees")
                        
                     
                           InsuranceNoDays=Session("RCM169a_TotalRentalDays")
                           if s_insu("MaxPrice") >0  and  InsuranceExtraValue>s_insu("MaxPrice") then 
                              InsuranceExtraValue=s_insu("MaxPrice")  
                              InsuranceSetMaxPrice =1 
                              InsuranceNoDays=1
                              InsuranceRate =s_insu("MaxPrice")
                 end if       
                  if s_insu("GST")="True" Then  
                              GSTInsurance=InsuranceExtraValue
                         end if 
                          if s_insu("StampDuty")="True" Then  
                                  StampInsurance=InsuranceExtraValue
                        end if   
                        
                     webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&s_insu("ID")&" ")
                        SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,SetMaxPrice,QTY, ReservationNo,ExtraFeesID,Fees,Days)" 
               SQL=SQL&"VALUES ("&InsuranceExtraValue&","&InsuranceSetMaxPrice&",1,'"&Session("RCM169a_OnlineBookingNo")&"',"&s_insu("ID")&","&InsuranceRate&",'"&InsuranceNoDays&"')"
                   'Response.Write("<br>") 
                         'Response.Write(SQL)
                     webConn.Execute(SQL) 
                end if
                s_insu.close
            SET s_insu=Nothing
         end if
        'Session("RCM169a_InsuranceFee")=InsuranceExtraValue
      TotalCost=TotalCost+ InsuranceExtraValue
   
        
  '-------------KmsFree per day -----------------
             KmsMaxcharge=0
        KmsDailyRate=0
        AddKmsFee=0
        KmsFree=0
        Session("RCM169a_KmsFree") =0
        Session("RCM169a_AddKmsFee") =0
          Session("RCM169a_KmsCost") =0
           if Request.Form("KmsFreeID")<>"" then
                   KmsReSelectedInSubs
         end if

 
          '----------------check Holiday Charges for pickup  from table HolidayextraFees  ---------------------
         SQL="SELECT ExtraFees.* FROM ExtraFees4Holiday,ExtraFees WHERE eh_ExtraFeeID=ExtraFees.ID and (eh_HolidayDate='"&Session("RCM169a_RequestPickDate")&"' and  eh_LocationID='"&Session("RCM169a_PickupLocationID")&"')  "
         'Response.Write(SQL)
       Set s_ex=webConn.Execute(SQL)
       HolidayPickupExtraID=0
       HolidayChargeQty=0
       if NOT s_ex.EOF THEN
               HolidayPickupExtraID=s_ex("ID")
               HolidayChargeQty=1
               webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&s_ex("ID")&" ")
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
               SQL=SQL&"VALUES ("&s_ex("Fees")&",'"&Session("RCM169a_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"',1)"
                'Response.Write("<br>")
                'Response.Write(SQL)
               webConn.Execute(SQL)
               TotalCost=TotalCost+ s_ex("Fees")
      end if
      s_ex.close
      Set s_ex=Nothing

      '--check Holiday Charges for dropoff  from table HolidayextraFees
       SQL="SELECT ExtraFees.*  FROM ExtraFees4Holiday,ExtraFees WHERE   eh_ExtraFeeID=ExtraFees.ID and (eh_HolidayDate='"&Session("RCM169a_RequestdropDate")&"' and  eh_LocationID='"&Session("RCM169a_DropoffLocationID")&"') "
       'Response.Write(SQL)
       Set s_ex=webConn.Execute(SQL)
       HolidayDropoffExtraID=0
       if NOT s_ex.EOF THEN
              HolidayDropoffExtraID=s_ex("ID")
               HolidayChargeQty=1
               if  HolidayDropoffExtraID=HolidayPickupExtraID  then
                  HolidayChargeQty=2
               end if
               webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&s_ex("ID")&" ")
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
               SQL=SQL&"VALUES ("&(s_ex("Fees")*HolidayChargeQty)&",'"&Session("RCM169a_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"',1,'"&HolidayChargeQty&"')"
                'Response.Write("<br>")
                'Response.Write(SQL)
                  TotalCost=TotalCost+ s_ex("Fees")
               webConn.Execute(SQL)
      end if
      s_ex.close
      Set s_ex=Nothing
          '----------------END check Holiday Charges for pickup  from table HolidayextraFees  ---------------------


       '-------------Web Mandatory Extra fees-----------------
   '---should not include InsuranceExtra (mandatory as default)
       SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("RCM169a_PickupLocationID")&"'  or LocationID=0) and WebItems=1 and InsuranceExtra=0  and Mandatory=1 AND inUse=1 and PercentageTotalCost=0 and MerchantFee=0 order by Type,Name"
     Set s_ex=webConn.Execute(SQL)
     j=0
     EachMandatoryExtraFees=0
     TotalMandatoryExtraFees=0
     MandatoryExtraStamp=0
     MandatoryExtraGST=0
     MandatoryExtraFeesNoDays=1
     DO WHILE NOT s_ex.EOF
            MandatoryExtraFeesNoDays=1

             if s_ex("Type")="Daily" then

                  '---daily fees always use   Session("RCM169a_TotalRentalDays") (fixed number)
                  MandatoryExtraFeesNoDays=Session("RCM169a_TotalRentalDays")
                        EachMandatoryExtraFees=MandatoryExtraFeesNoDays*s_ex("Fees")
             elseif s_ex("Type")="Fixed" then
                        EachMandatoryExtraFees = s_ex("Fees")
             else
                       EachMandatoryExtraFees = (s_ex("Fees")/100)*RentalCost
             end if
                  TotalMandatoryExtraFees=EachMandatoryExtraFees+ TotalMandatoryExtraFees

                 '----Stamp Duty for Mandatory extraFees ---------
                  eachMandatoryExtraStamp=0
                  if s_ex("StampDuty")="True" Then
                        eachMandatoryExtraStamp=EachMandatoryExtraFees
                 end if
                 MandatoryExtraStamp=MandatoryExtraStamp+eachMandatoryExtraStamp

                 '----GST for Mandatory extraFees ---------
                  eachMandatoryExtraGST=0
                  if s_ex("GST")="True" Then
                        eachMandatoryExtraGST=EachMandatoryExtraFees
                  end if
                 MandatoryExtraGST=MandatoryExtraGST+eachMandatoryExtraGST


                '--insert the Mandatory Extra Fees to WebPaymentExtraFees table
                 webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&s_ex("ID")&" ")

                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
                  SQL=SQL&"VALUES ("&EachMandatoryExtraFees&",'"&Session("RCM169a_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"','"&MandatoryExtraFeesNoDays&"')"
                  'Response.Write("<br>")
                  'Response.Write(SQL)
                  webConn.Execute(SQL)

      s_ex.MoveNext
     j=j+1
     Loop
     s_ex.close
     SET s_ex=nothing
     TotalCost=TotalCost+TotalMandatoryExtraFees




'---Stamp Duty, GST  are location(state) based,  check if the extra fees are StampDuty, GST Apply
   StampDutyRate=0
   GSTRate= 0
   Set s_st=webConn.Execute("SELECT * FROM QStampDuty WHERE ID="&Session("RCM169a_PickupLocationID")&"  ")
   If not s_st.EOF then
        if ISNull(s_st("StampDuty"))<>True then
         StampDutyRate=s_st("StampDuty")/100
         end if
         if ISNull(s_st("GSTRate"))<>True then
         GSTRate= s_st("GSTRate")/100
         end if
  end if
  s_st.close
  set s_st=nothing  

'----Stamp Duty calculation------------------------------------
  StampDuty=0
  Session("RCM169a_StampDuty")=0
  if StampDutyRate>0 then  '--if StampDutyRate=0 then no Stampduty applied
        '---stampduty is the revenues less GST times Stampduty rate
        '--- GSTInclusive means stampduty caclutations use Revenue less GST
        '--- Not GSTInclusive means, Revenues do not include GST
        if Session("RCM169a_GSTInclusive") = "Yes"  then
               StampDuty=StampDutyRate*(RentalCost+ RelocationFeeStampDuty + AfterHoursFeeStampDuty + ExtraStamp + MandatoryextraStamp +StampInsurance)*(1-GSTRate) 
        else
                StampDuty=StampDutyRate*(RentalCost + RelocationFeeStampDuty + AfterHoursFeeGST + ExtraStamp+ MandatoryextraStamp + StampInsurance)
        end if
        StampDuty=Round(StampDuty,2)               
        Session("RCM169a_StampDuty")=StampDuty
 end if 
   
'----GST calculation------------------------------------
 GST=0 
 Session("RCM169a_GST")=0
 if GSTRate>0 then  '--if GSTRate=0 then no GST applied
        if Session("RCM169a_GSTInclusive") = "Yes"  then
                GST=(RentalCost + AfterHoursFeeGST + RelocationFeeGST + ExtraGST+ MandatoryExtraGST+ GSTInsurance)*(1-100/(100+GSTRate*100)) 
                
        else
               GST=(RentalCost + AfterHoursFeeGST + RelocationFeeGST + ExtraGST+ MandatoryExtraGST + GSTInsurance)*GSTRate 
        end if
        GST=Round(GST,2)                 
       Session("RCM169a_GST")=GST
end if 

'--insert GST and StampDuty to WebReservation table 
              
        '----STAMPDUTY GST diferent layout------------------------------------  
        SubTotal=0
        if Session("RCM169a_GSTInclusive") = "Yes"  then
                  TotalCost=StampDuty+ TotalCost
           
               
                              '-------------Web Mandatory MerchantFee or airport fees-----------------
         SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("RCM169a_PickupLocationID")&"'  or LocationID=0) and WebItems=1 and Mandatory=1 AND inUse=1 and (PercentageTotalCost=1 or MerchantFee=1) and Type='Percentage' Order by PercentageTotalCost Desc,MerchantFee,Name"
         'Response.Write(SQL)
         Set s_ex=webConn.Execute(SQL) 
         j=0
         EachMerchantFee=0 
         TotalMerchantFee=0 
         MerchantFeeStamp=0
         MerchantFeeGST=0 
         MerchantFeeNoDays=1
         BankBaseCalculationFee= TotalCost 
           percentageBaseCalculationFee= TotalCost     
         
         'Response.Write(BankBaseCalculationFee)  
            ' Response.Write("<tr><td colspan=4 >"&rentalCost&"+"&TotalExtraFees&" +"&TotalMandatoryExtraFees&" + "&InsuranceExtraValue&" + "&StampDuty&"</td></tr>")
             
         '--TotalCost =rentalCost + extraFees + Insurance + Stamp
         DO WHILE NOT s_ex.EOF          
                         if s_ex("MerchantFee")=True then
                         EachMerchantFee =(s_ex("Fees")/100)*BankBaseCalculationFee  
                  else
                      EachMerchantFee =(s_ex("Fees")/100)*percentageBaseCalculationFee 
                      end if
                   EachMerchantFee =Round(EachMerchantFee,2)
                  TotalCost=TotalCost+EachMerchantFee
                BankBaseCalculationFee=BankBaseCalculationFee+EachMerchantFee  
                
                
                      '--insert the 
                      webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID="&s_ex("ID")&" ")
                      SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)" 
                     SQL=SQL&"VALUES ("&EachMerchantFee&","&Session("RCM169a_OnlineBookingNo")&","&s_ex("ID")&","&s_ex("Fees")&",'1')"
                         ' Response.Write("<br>") 
                     'Response.Write(SQL)
                     webConn.Execute(SQL)  
               
            s_ex.MoveNext                                    
         j=j+1    
         Loop 
         s_ex.close
         SET s_ex=nothing 
       
        else
                  SubTotal=RentalCost+TotalInsurance+TotalExtraFees
                  TotalCost=(StampDuty+ TotalCost)+GST
                
              
          end if    
            TotalCost=Round(TotalCost,2)
   Session("RCM169a_TotalEstimateofCharges")=TotalCost
   
    END IF
    
    
      Response.Write("<tr><td colspan=4 height=1 bgcolor=#C0C0C0></td></tr>")         
            
    '---------display all rates and fees here
         Set s_rate=webConn.Execute("SELECT WebPaymentDetail.*,Season FROM WebPaymentDetail,Season WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and  SeasonID = Season.ID ")
        RentalCost=0
        costEachSeason=0
   While Not s_rate.EOF
               if s_rate("Season")="Default" then
                     Season="Standard Rates" 
                  else
                  Season=s_rate("Season")
                  end if  
                  costEachSeason=s_rate("Days")*s_rate("Rate")  
                  CarTotalCost=CartotalCost + s_rate("Days")*s_rate("Rate")
                  RentalCost=s_rate("Days")* s_rate("Rate") + RentalCost 
            Response.Write("<tr><td></td><td align=left class=text>"&Season&"</td>")
                Response.Write("<td align=right class=text>"&s_rate("Days")&" Days @ $"&FormatNumber(s_rate("Rate"),2)&"</td><td class=text align=right>$"&FormatNumber(costEachSeason,2)&"</td></tr>")
              
        s_rate.MoveNext 
   Wend
   s_rate.Close
   Set l_s=nothing 
      
         if  Session("RCM169a_KmsDesc")<>"" then
                  Response.Write("<tr><td></td><td align=left colspan=3 class=text>"&Session("RCM169a_KmsDesc")&" </td></tr>")
         end if
          
          '--- extra fees
        Set s_extra=webConn.Execute("SELECT WebPaymentExtraFees.*, Name, Type,PayAgency FROM WebPaymentExtraFees, ExtraFees WHERE  (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID = ExtraFees.ID ORDER BY InsuranceExtra desc,TYPE, NAME ")
      EachExtraFees=0
        TotalExtraFees=0
        DO WHILE NOT s_extra.EOF
                  ExtraFeesQTY=s_extra("QTY")
                  EachExtraFees=s_extra("ExtraValue")
               theQTY=""
                  if ExtraFeesQTY>1 then
                  theQTY="(QTY "&ExtraFeesQTY&")"
                  end if
                       if s_extra("Type")="Percentage" then
                            Response.Write("<tr><td></td><td class=text  align=left>"&s_extra("Name")&"<td class=text align=right> "&theQTY&"</td><td  align=right class=text>$"&FormatNumber(EachExtraFees,2)&"</td></tr>")
                           elseif s_extra("Type")="Daily" then
                  extraType =s_extra("Type")
                        if s_extra("SetMaxPrice")  =True then
                        extraType="Fixed"
                  end if
                     Response.Write("<tr><td></td><td class=text nowrap  align=left>"&s_extra("Name")&"<td class=text align=right>  "&extraType&" at $"&FormatNumber(s_extra("Fees"),2)&" "&theQTY&"</td><td  align=right class=text>$"&FormatNumber(EachExtraFees,2)&"</td></tr>")
                     elseif s_extra("Type")="Fixed" then
                        Response.Write("<tr><td></td><td class=text align=left>"&s_extra("Name")&"<td class=text align=right>  "&s_extra("Type")&" at $"&FormatNumber(s_extra("Fees"),2)&" "&theQTY&"</td><td  align=right class=text>$"&FormatNumber(EachExtraFees,2)&"</td></tr>")
                     end if
                     
                  TotalExtraFees=TotalExtraFees+EachExtraFees
                     
                
        s_extra.MoveNext
        Loop
         s_extra.close
         set s_extra=nothing
        if  Session("RCM169a_StampDuty") >0 then
                Response.Write("<tr><td></td><td class=text  colspan=2  align=left>"&Session("RCM169a_TaxName2")&"</td>")
                Response.Write("<td  align=right class=text>$"&FormatNumber(Session("RCM169a_StampDuty"),2)&"</td></tr>")
        end if

       Response.Write("<tr><td></td><td class=text  align=left> GST</td><td class=text colspan=2 align=right> $"&FormatNumber(Session("RCM169a_GST"),2)&")</td></tr>")
        Response.Write("<tr><td colspan=4 height=1 bgcolor=#999999></td></tr>")
         Response.Write("<tr><td></td><td align=left class=text colspan=2><b>Total Estimate of Charges</td><td class=text align=right><b>AUD $"&FormatNumber(Session("RCM169a_TotalEstimateofCharges"),2)&"</td></tr>")

             '--------------- Agent Commintion--------------- 
    Session("RCM169a_OnlineReservationNo")=""
    Session("RCM169a_CustomerID")=""
    Session("RCM169a_AgentCommissionValue")=0
    if    Session("RCM169a_AgentCommission")<>0  then

            AgencyCommintion=RentalCost
            Set s_extra=webConn.Execute("SELECT WebPaymentExtraFees.*, Name, Type,PayAgency FROM WebPaymentExtraFees, ExtraFees WHERE  (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID = ExtraFees.ID ORDER BY TYPE, NAME ")
            EachExtraFees=0
            While Not s_extra.EOF
               if s_extra("PayAgency")=True then
                     AgencyCommintion=AgencyCommintion+ s_extra("ExtraValue")
               end if       
            s_extra.MoveNext 
         Wend
         s_extra.Close
         Set s_extra=nothing
      Session("RCM169a_AgentCommissionValue")=0

         if Session("RCM169a_BCommissionType")="p"  then
            AgentCommissionValue= Round((AgencyCommintion*Session("RCM169a_AgentCommission")/100),2)
          else
                  AgentCommissionValue= Session("RCM169a_AgentCommission")
         end if
         Session("RCM169a_AgentCommissionValue")=AgentCommissionValue

            Response.Write("<tr><td colspan=4 height=1 bgcolor=#D8D8D8></td></tr>")
            Response.Write("<tr><td></td><td class=text align=left colspan=2><b>Agent Commission </td><td class=text align=right>$"&FormatNumber(AgentCommissionValue,2)&"</td></tr>")
            Response.Write("<TR bgColor="&Session("RCM191a_CompanyColour")&"  ><td align=center colspan=4 class=white>Agent Collected Amout</td></tr>")
            Response.Write("<tr><td></td><td class=text align=left ><b><font color=red>Amount to collect from customer</td>")
            Response.Write("<td align=right colspan=2 CLASS=BGColour><span class=text>  <input type=text name=AgentCollected  CLASS=BGColour style='BACKGROUND-COLOR=#FFFFCC' size=5 value="&AgentCommissionValue&" onBlur='checkNumeric(this);'></td></tr>")
             ' Response.Write("<tr><td></td><td class=text align=left colspan=2><b><font color=red>PLEASE ENTER THE TOTAL AMOUNT YOU ARE COLLECTING FOR THIS BOOKING</td>")
            'Response.Write("<td CLASS=BGColour align=right><input type=text name=AgentCollected  style='BACKGROUND-COLOR=#FFFFCC' size=10 value="&TotalCost&" onBlur='checkNumeric(this);'></td></tr>")

     end if
   PersonalInfoForm
                 
   Response.Write("</td></tr></table>")
   Response.Write("</td></tr></table></form>")
         
         
        
  Response.Write("</td></tr></table>")
  webConn.CLOSE 
         
     
%> </td>
     </tr>
        </table>
    </td>
  </tr>
</table>   
<!-- END RCM HTML CODE-----------> 

   
