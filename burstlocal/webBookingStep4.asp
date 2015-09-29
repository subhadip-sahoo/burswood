<%
If Request.ServerVariables("SERVER_PORT")=80 Then

      Response.Redirect "https://secure20.rentalcarmanager.com.au/ssl/Australiawide71/webbookingstep2.asp"
   End If

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
<script Language="JavaScript">
<!--


function Validate()
{   //   var boxCheck = false;
    //   if (document.theForm.agree.checked) {
     //  boxCheck = true; }
            
  if (document.theForm.lastname.value == "")
  {      alert("Last Name required.");
      document.theForm.lastname.focus();
      return (false);
  } 
   if (document.theForm.CustomerEmail.value == "")
  {      alert("Email Address required.");
      document.theForm.CustomerEmail.focus();
      return (false);
  } 
   if (document.pressed == 'Request Booking' && theForm.License.value == "")
  {      alert("License# required.");
      theForm.License.focus();
      return (false);
  }

   if (document.pressed == 'Request Booking' && document.theForm.address.value == "")
  {      alert("Address required.");
      document.theForm.address.focus();
      return (false);
  }
    if (document.pressed == 'Request Booking' && document.theForm.city.value == "")
  {      alert("City required.");
      document.theForm.city.focus();
      return (false);
  }
 
   if (document.pressed == 'Request Booking' && document.theForm.Phone.value == "")
  {      alert("Phone No required.");
      document.theForm.Phone.focus();
      return (false);
  }

  if (document.pressed == 'Request Booking' && document.theForm.Mobile.value == "")
  {      alert("Mobile Phone No required.");
      document.theForm.Mobile.focus();
      return (false);
  }

// if (document.pressed == 'Request Booking'  && !boxCheck )
 {     //   alert("Please accept the Rentals terms and conditions of hire");
       //   document.theForm.agree.focus();
      // return (false); 
}

return (true);

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
<link href="ausbook.css" rel="stylesheet" type="text/css" />
<body onload="MM_preloadImages('images/homed.gif','graphics/homed.gif')">
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
              <td><img src="graphics/rentals-purchase-grn.gif" alt="Car Rental Purchase Details" width="80" height="53"></td>
              <td><img src="graphics/rental-confirm.jpg" alt="Car Rental Booking Confirmation" width="80" height="53" border="0"></td>
            </tr>
          </table></td>
          <td align="center" valign="middle"><a href="http://www.australiawidecarrentals.com.au"><img src="graphics/home.gif" alt="Home Page" width="191" height="38" border="0" id="home" onmouseover="MM_swapImage('home','','graphics/homed.gif',1)" onmouseout="MM_swapImgRestore()" /></a><a href="http://www.australiawidecarrentals.com.au"></a></td>
        </tr>
</table>
<!-- Order steps end here -->

<%  

         Session("RCM71_URL")="AusWide"
       Company="Australia Wide Car Rental"
       CompanyCode="Australiawide71"
        RCMURL="https://secure20.rentalcarmanager.com.au"
         theimage=RCMURL&"/DB/"&CompanyCode&"/"&Session("RCM71_CarImageName")

   Dim webConn
   Set webConn = Server.CreateObject("ADODB.Connection")
   DatabaseFile="Australiawide71"
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


<!-- WEB PAGE HEAD -----------> 
<table width="748" height="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="egg">

<tr><td>    


<!-- RCM HTML CODE-----------> 

<%
SUB   KmsReSelectedInSubs  '--used in all subs
               SQL="SELECT * from KmsFree  WHERE ID="&Request.Form("KmsFreeID")&" "
                  Set s_km=webConn.Execute(SQL)
                  KmsFree=s_km("KmsFree")
                  AddKmsFee=s_km("AddKmsFee")
                  KmsMaxcharge=s_km("MaxPrice")
                  KmsDailyRate=s_km("DailyRate")
                  Session("RCM71_KmsFree") =s_km("KmsFree")
                 Session("RCM71_AddKmsFee") =s_km("AddKmsFee")
                   sKmsMaxprice=""
                   Session("RCM71_KmsDesc")=""
                   if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                            '--unlimited without daily charge
                            Session("RCM71_KmsDesc")="Unlimited Kms"
                             '--if  pass Unlimited, save the 0 Daily rate  to the Reservationfees table
                             '--if daily rate =0 then print unlimited in the documents
                               Response.Write("<input type='hidden' name='KmsSaveFees' size='5' value='1' />")
                               webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM71_OnlineBookingNo")&" ")
                              SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                              SQL=SQL&"VALUES ("&Session("RCM71_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                                  'Response.Write(SQL)
                              webConn.Execute(SQL)
                   elseif s_km("AddKmsFee")>0 and s_km("DailyRate")>0 then
                             iKmsDailyRate=s_km("DailyRate")
                           Session("RCM71_KmsDesc")="Daily rate @"&Session("RCM71_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))&", "&s_km("KmsFree")&" Kms free per day, additional per Kms "&Session("RCM71_CompanyCurrency")&" "&FormatNumber(s_km("AddKmsFee"))
                          Response.Write("<input type='hidden' name='KmsSaveFees' size='5' value='1' />")
                          webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM71_OnlineBookingNo")&" ")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                           SQL=SQL&"VALUES ("&Session("RCM71_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                           'Response.Write(SQL)
                           webConn.Execute(SQL)
                           Session("RCM71_KmsCost")= iKmsDailyRate*Session("RCM71_TotalRentalDays")



                   elseif s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate") >0 then
                           '--unlimited with daily charge
                           iKmsDailyRate=s_km("DailyRate")
                          Session("RCM71_KmsDesc")="Unlimited Kms, daily rate @"&Session("RCM71_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))
                          Response.Write("<input type='hidden' name='KmsSaveFees' size='5' value='1' />")
                          webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM71_OnlineBookingNo")&" ")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                           SQL=SQL&"VALUES ("&Session("RCM71_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                           'Response.Write(SQL)
                           webConn.Execute(SQL)
                           Session("RCM71_KmsCost")= iKmsDailyRate*Session("RCM71_TotalRentalDays")
                     elseif  s_km("MaxPrice")>0 then
                           sKmsMaxprice=", max charge "&Session("RCM71_CompanyCurrency")&""&FormatNumber(s_km("MaxPrice"))&" per day"
                           Session("RCM71_KmsDesc")=s_km("KmsFree")&" Kms free per day, additional per Kms "&Session("RCM71_CompanyCurrency")&""&FormatNumber(s_km("AddKmsFee"))&" "&sKmsMaxprice
                            Response.Write("<input type='hidden' name='KmsSaveFees' size='5' value='1' />")
                               webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("RCM71_OnlineBookingNo")&" ")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                           SQL=SQL&"VALUES ("&Session("RCM71_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                              'Response.Write(SQL)
                           webConn.Execute(SQL)
                          ' Session("RCM71_KmsCost")=s_km("MaxPrice")
                     else
                           Session("RCM71_KmsDesc")=s_km("KmsFree")&" Kms free per day, additional per Kms "&Session("RCM71_CompanyCurrency")&""&FormatNumber(s_km("AddKmsFee"))
                            Response.Write("<input type='hidden' name='KmsSaveFees' size='5' value='0' />")
                      end if
                     Response.Write("<input type='hidden' name='KmsFree' size='5' value='"&KmsFree&"'  />")
                     Response.Write("<input type='hidden' name='AddKmsFee' size='5' value='"&AddKmsFee&"'  />")
                     Response.Write("<input type='hidden' name='KmsMaxcharge' size='5' value='"&KmsMaxcharge&"' />")
                     Response.Write("<input type='hidden' name='KmsDailyRate' size='5' value='"&KmsDailyRate&"' />")
                      s_km.CLOSE
                        set s_km=nothing
                            TotalCost = TotalCost+   Session("RCM71_KmsCost")

END SUB

SUB PersonalInfoForm
%>

<TR ><td colspan=4 align=center bgColor=#00509F  class=header>Renter Information</td></tr>
        <tr><td></td><td class=text colspan=3>
         <table>
            <tr><td align=left class=text>&nbsp;First Name:</td><td align=left class=text  colspan=2><input Type=text name=firstname Size=30 value='<%=Session("RCM71_FirstName")%>'></td></tr>
       <tr><td align=left class=text><font color=red>*</font>Last Name:</td><td align=left class=text colspan=2><input Type=text name=lastname Size=30 value='<%=Session("RCM71_LastName")%>'></td></tr>
       <tr><td align=left class=text><font color=red>*</font>DOB:</td><td align=left class=text  colspan=2>
          <table border=0 cellspacing=0 cellpadding=0><tr><td align=left CLASS=formtext>
               <SELECT name=DOBDay>
           <%  if Request.Form("DOBYear")="1900" then
                  Response.Write("<option value='1' selected>Day</option>")
                  end if
            for pd=1 to 31
                  if CStr(pd)=(Request.Form("DOBDay")) and  Request.Form("DOBYear")<>"1900"   then
                        Response.Write("<option value='"&pd&"' selected>"&pd&"</option>")
                  else
                  Response.Write("<option value='"&pd&"'>"&pd&"</option>")
                  end if
          next                      
           %>     </SELECT></td>
            <td align=left CLASS=formtext ><SELECT name=DOBMonth>
         <%     if Request.Form("DOBYear")="1900" then
                  Response.Write("<option value='Jan' selected>Month</option>")
                  end if
            for pm=1 to 12 
                                 theMonth=Left(MonthName(pm),3)
                     'if pm=Month(date) then 
                  if theMonth=Request.Form("DOBMonth")  and   Request.Form("DOBYear")<>"1900"   then
                   
                       Response.Write("<option value='"&theMonth&"' selected>"&theMonth&"</option>")
                  else     
                  Response.Write("<option value='"&theMonth&"'>"&theMonth&"</option>")
                  end if
          next                      
           %>  </SELECT>
         </td>
       
            <td align=left CLASS=formtext><SELECT name=DOBYear>
             <%   if Request.Form("DOBYear")="1900"  then
                  Response.Write("<option value='1900' Selected>Year</option>")
                  end if
                    for y=(Year(Date)-90) to (Year(Date)-21)   
                  ' if y=(Year(Date)-21) then 
                      if CStr(y)=Request.Form("DOBYear") and  Request.Form("DOBYear")<>"1900"  then
                 Response.Write("<option value='"&y&"' Selected>"&y&"</option>")
                      else
                      Response.Write("<option value='"&y&"'>"&y&"</option>")
                       end if
                  next
                  'Response.Write("<option value='"&Year(Date)&"' Selected>"&Year(Date)&"</option>")
                   'Response.Write("<option value='"&Year(Date)+1&"'>"&Year(Date)+1&"</option>")
           %>     </SELECT></td></tr></table>
        
        </td></tr>
        <tr><td align=left class=text><font color=red>*</font>License No:</td><td align=left class=text  colspan=2><input Type=text name=License Size=30 value='<%=Session("RCM71_License")%>'></td></tr>
        <tr><td align=left class=text><font color=red>*</font>Expiry Date:</td><td align=left class=text  colspan=2> <table border=0 cellspacing=0 cellpadding=0><tr><td align=left CLASS=formtext><SELECT name=licensDay>
           <%  for d=1 to 31       
                  if d=Day(Date) then
                        Response.Write("<option value='"&d&"' selected>"&d&"</option>")
                  else
                  Response.Write("<option value='"&d&"'>"&d&"</option>")
                  end if
          next                      
           %>     </SELECT></td>
       <td align=left CLASS=formtext><SELECT name=licensMonth>
         <%    for m=1 to 12 
                 theMonth=Left(MonthName(m),3)
                     if theMonth=Left(MonthName(Month(Date)),3) then
                       Response.Write("<option value='"&theMonth&"' selected>"&theMonth&"</option>")
                  else     
                  Response.Write("<option value='"&theMonth&"'>"&theMonth&"</option>")
                  end if
          next                      
           %>  </SELECT></td>
   <td align=left CLASS=formtext>   <SELECT name=licensYear>
            <%  for theYear=Year(Date) to (Year(Date)+10)
                  if theYear=Year(Date) then
               Response.Write("<option value='"&theYear&"' Selected>"&theYear&"</option>")
                      else
                        Response.Write("<option value='"&theYear&"'>"&theYear&"</option>")
                     end if
                next
           %>   </SELECT></td></tr></table></td></tr>
        <tr><td align=left class=text><font color=red>*</font>&nbsp;Address:</td><td align=left class=text  colspan=2><input type=text name=address size=30 value='<%=Session("RCM71_address")%>'></td></tr>
        <tr><td align=left class=text><font color=red>*</font>&nbsp;City:</td><td align=left class=text  colspan=2><input type=text name=city size=30 value='<%=Session("RCM71_city")%>'></td></tr>
        <tr><td align=left class=text>&nbsp;State/Province:</td><td align=left class=text  colspan=2><input type=text name=state size=30 value='<%=Session("RCM71_state")%>' ></td></tr>
        <tr><td align=left class=text>&nbsp;Postcode/ZIP:</td><td align=left class=text  colspan=2><input type=text name=postcode size=30 value='<%=Session("RCM71_postcode")%>'></td></tr>
        <tr><td align=left class=text><font color=red>*</font>&nbsp;Country of Residence:</td><td align=left class=text  colspan=2>
             <%   Set s_c=webConn.Execute("SELECT * FROM Country ORDER BY  Country " )
            Response.Write("<SELECT name=CountryID>") 
                WHILE NOT s_c.EOF  
                  if  s_c("Country")=Session("RCM71_country") then 
                              Response.Write("<option value="&s_c("ID")&" selected>"&s_c("Country")&"</option>") 
                        else
                           if s_c("Defaulted")=-1 then
                              Response.Write("<option value="&s_c("ID")&" selected>"&s_c("Country")&"</option>") 
                              else
                                 Response.Write("<option value="&s_c("ID")&" >"&s_c("Country")&"</option>") 
                              end if
                         end if
            s_c.MoveNext 
            Wend
            s_c.Close
      Set s_c=nothing
            Response.Write("</SELECT>")  
         
           
           %>
</td></tr>
   <tr><td align=left class=text><font color=red>*</font>Email Address:</td><td align=left class=text  colspan=2><input Type=text name=CustomerEmail Size=30 value='<%=Session("RCM71_CustomerEmail")%>'></td></tr>
             <tr><td align=left class=text></td><td align=left class=text  colspan=2><small><b><font color=red>(Please check your Email Address is correct)</font></td></tr>
       <tr><td align=left class=text><font color=red>*</font>Phone (incl area code):</td><td align=left class=text  colspan=2><input Type=text name=Phone Size=30 value='<%=Session("RCM71_phone")%>'></td></tr>
        </tr> <tr>
        <td CLASS=text align=left><font color=red>*</font>Mobile Phone No.:</td>
       <td CLASS=text align=left><input Type=text name=Mobile Size=30 value='<%=Session("RCM71_Mobile")%>'></td>
        <tr><td align=left class=text>&nbsp;Facsimile:</td>
        <td align=left class=text  colspan=2><input type=text name=fax size=30 value='<%=Session("RCM71_Fax")%>'></td></tr>
         <tr>
       <td CLASS=text align=left>Arrival FLT:</td>
       <td CLASS=text align=left><input Type=text name=Flight Size=30 value='<%=Session("RCM71_Flight")%>'></td>
     </tr><tr>
        <td CLASS=text align=left>Departure FLT:</td>
       <td CLASS=text align=left><input Type=text name=Flightout Size=30 value='<%=Session("RCM71_Flightout")%>'></td> 
      </tr>  <tr>
        <td align=left class=text>Additional Details:</td>
        <td align=left class=text colspan=2><textarea name=Notes cols=25 rows=3><%=Session("RCM71_Notes")%></textarea></td>
     </tr> 

   </table>
        </td></tr>
        <TR height=10><td align=left colspan=4></td></tr>
        <TR height=2><td colspan=4 bgColor=#0080C0 ></td></tr>
        <TR><td colspan=4 align=right >
         <INPUT TYPE=button NAME=Back  VALUE=Back  onClick='javascript:history.back(-1)'>&nbsp;&nbsp;
      <input onClick="document.pressed=this.value"  name=submit1 type="submit"  value="Email Me Quote" >&nbsp;&nbsp; 
      <input  onClick="document.pressed=this.value" name=submit1 type="submit"  value="Request Booking"></td></tr>
         
        
   <tr > 
   <td colspan=4  class=text  align=right><font color=red>*</font> 
      <font color="#FF6600">Required fields must be completed for booking<br></font></td>
</tr>
      
<%   
END SUB
  
   
 
'------ check, Not to let under 21years proceed with booking
 
  if Session("RCM71_RequestDropDate")="" then
       Response.Redirect "webBookingStep1.asp"
  end if
 
'------------------------------------------------------------------------------------------
if Request.QueryString("dir")="Rate"  then
      
   '---Vehicle Type----------  
   Session("RCM71_CarType")=""
         Session("RCM71_CarSizeID")=0 
       ' Session("RCM71_CarImageName")="" 
         SQL="SELECT * FROM CarSize WHERE (ID)='"&Request.Form("CarSizeID")&"'"
         Set s_cs=webConn.Execute(SQL) 
         Session("RCM71_CarType")=s_cs("WebDesc")
         Session("RCM71_CarSizeID")=Request.Form("CarSizeID")  
         Session("RCM71_FreeSale")=s_cs("FreeSale")  
       ' Session("RCM71_CarImageName")=s_cs("ImageName")
    
        s_cs.CLOSE 
        SET s_cs=nothing
        
    '---Insert the booking details to WebReservation table  
   IF Session("RCM71_OnlineBookingNo") <>"" then
      SQL="UPDATE WebReservation SET "
        'SQL=SQL&" URL ='"&Session("RCM71_URL")&"',  "          
        SQL=SQL&" Email ='"&Left(tidyup(Request.Form("CustomerEmail")),50)&"',  "
         SQL=SQL&" Name ='"&Left(tidyup(Request.Form("lastname")),40)&"',  "
        SQL=SQL&"Phone ='"&Left(tidyup(Session("RCM71_phone")),20)&"' , "
      'SQL=SQL&"NoTravelling ='"&Left(tidyup(Session("RCM71_NoTravelling")),30)&"' , "
      SQL=SQL&"CarSizeID ="&(Session("RCM71_CarSizeID"))&", "
        SQL=SQL&"Flight ='"&Left(tidyup(Session("RCM71_Flight")),50)&"', "
        SQL=SQL&"Flightout ='"&Left(tidyup(Session("RCM71_Flightout")),50)&"', "
        SQL=SQL&"PickupdateTime ='"&Session("RCM71_RequestPickDateTime")&"', "
         SQL=SQL&"DropoffDateTime ='"&Session("RCM71_RequestDropDateTime")&"', "
         SQL=SQL&"Pickupdate ='"&Session("RCM71_RequestPickDate")&"', "
         SQL=SQL&"PickupTime ='"&Session("RCM71_RequestPickTime")&"', "
         SQL=SQL&"DropoffDate ='"&Session("RCM71_RequestDropDate")&"', "
        SQL=SQL&"DropoffTime ='"&Session("RCM71_RequestDropTime")&"', "
         SQL=SQL&"PickupLocationID ="&Session("RCM71_PickupLocationID")&", "
        SQL=SQL&"DropoffLocationID ="&Session("RCM71_DropoffLocationID")&" "
        SQL=SQL&"WHERE (ReservationNo) ='"&Session("RCM71_OnlineBookingNo")&"'"
        'Response.Write(SQL)
        webConn.Execute(SQL)
           '---if reflash the screen, delete the extra and rate then insert again
          webConn.Execute("DELETE  FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' ")
          webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' ")

  else                 
      
        SQL="INSERT INTO WebReservation (BrandID,URL,Phone,Email,Name,Flightout,Flight,PickupDateTime,DropoffDateTime,RentalSource,CarSizeID,PickupTime,Pickupdate,DropoffTime,DropoffDate,PickupLocationID,DropoffLocationID,ReservationTypeID)"
        SQL=SQL&"VALUES (4,'"&Session("RCM71_URL")&"','"&Left(tidyup(Session("RCM71_phone")),20)&"','"&Left(tidyup(Request.Form("CustomerEmail")),50)&"','"&Left(tidyup(Request.Form("lastname")),40)&"', '"&Left(tidyup(Session("RCM71_Flightout")),50)&"','"&Left(tidyup(Session("RCM71_Flight")),50)&"','"&Session("RCM71_RequestPickDateTime")&"','"&Session("RCM71_RequestDropDateTime")&"' ,'Online Booking',"&(Session("RCM71_CarSizeID"))&",'"&Session("RCM71_RequestPickTime")&"','"&Session("RCM71_RequestPickDate")&"','"&Session("RCM71_RequestDropTime")&"', '"&Session("RCM71_RequestDropDate")&"', "&Session("RCM71_PickupLocationID")&", "&Session("RCM71_DropoffLocationID")&", '1')"

       'Response.Write("<p>") 
       'Response.Write(SQL)
         webConn.Execute(SQL)
 
         '---get the ReservationNo
         Set s_No=webConn.Execute("SELECT Max(ReservationNo)  as ResNo FROM WebReservation ")
         Session("RCM71_OnlineBookingNo")=s_No("ResNo")
            'Response.Write(Session("RCM71_OnlineBookingNo"))
            s_No.close
    end if

      webConn.Execute("DELETE  FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' ")
          webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' ")

    
        '----Relocation fee-------------



      Session("RCM71_RelocationFee")=0
         Session("RCM71_RelocationFeeID")=0
         Session("RCM71_RelocationFeeName")=""
         RelocationFeeGST=0
         RelocationFeeStampDuty=0
         '--1. check Relocation record (with caterory, date range)
         SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
         SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID and (CarSizeID)='"&Session("RCM71_CarSizeID")&"'  and Mandatory=0 "
         SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM71_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM71_DropoffLocationID")&"'  "
         SQL=SQL&" AND PickupDateFrom<='"&Session("RCM71_RequestPickDate")&"'  and PickupDateTo >= '"&Session("RCM71_RequestPickDate")&"' "
         '--next line of code will return the max Minbookingday if there are 2 records entered for same conditin
         SQL=SQL&"  AND MinBookingDay<="&Session("RCM71_TotalRentalDays")&" order by MinBookingDay desc "
         'Response.Write(SQL)
          Set s_o=webConn.Execute(SQL)
          if  s_o.EOF THEN
                  s_o.close
                  Set s_o=Nothing
                  '--2. if no vehicle category Relocation fee found, check Relocation record (with  date range only)
                  SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                  SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID  and Mandatory=0  "
                  SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM71_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM71_DropoffLocationID")&"'  "
                  SQL=SQL&" AND PickupDateFrom<='"&Session("RCM71_RequestPickDate")&"'  and PickupDateTo >= '"&Session("RCM71_RequestPickDate")&"' "
                  SQL=SQL&"  AND MinBookingDay<="&Session("RCM71_TotalRentalDays")&" order by MinBookingDay desc "
                  'Response.Write(SQL)
                   Set s_o=webConn.Execute(SQL)
                   if  s_o.EOF THEN
                        s_o.close
                        Set s_o=Nothing
                        '--3. if no vehicle category Relocation fee found, check Relocation record (with  catgory, no date ragne)
                        SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                        SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID  and (CarSizeID)='"&Session("RCM71_CarSizeID")&"' "
                        SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM71_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM71_DropoffLocationID")&"'  "
                        SQL=SQL&"  AND  Year(PickupDateFrom)=2100  and Mandatory=0 "
                        SQL=SQL&"  AND MinBookingDay<="&Session("RCM71_TotalRentalDays")&" order by MinBookingDay desc "
                        'Response.Write(SQL)
                        Set s_o=webConn.Execute(SQL)
                        if  s_o.EOF THEN
                              s_o.close
                              Set s_o=Nothing
                                    '--4. if no vehicle category Relocation fee found, check Relocation record (with no catgory, no date ragne)
                              SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                              SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID   and Mandatory=0 "
                              SQL=SQL&" AND CarSizeID=0 "
                              SQL=SQL&"  AND (PickuplocationID)='"&Session("RCM71_PickupLocationID")&"' AND (DropofflocationID)='"&Session("RCM71_DropoffLocationID")&"'  "
                              SQL=SQL&"  AND  Year(PickupDateFrom)=2100 and CarSizeID=0"
                              SQL=SQL&"  AND MinBookingDay<="&Session("RCM71_TotalRentalDays")&" order by MinBookingDay desc "
                              'Response.Write(SQL)
                              Set s_o=webConn.Execute(SQL)
                        end if
                  end if

         end if


         webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"'  ")

         if NOT s_o.EOF THEN
               DO WHILE NOT s_o.EOF
                  if  s_o("DaysNocharge")=0 or (s_o("DaysNocharge")>0 and Session("RCM71_TotalRentalDays")<s_o("DaysNocharge"))  then
                     Session("RCM71_RelocationFee")=Session("RCM71_RelocationFee")+s_o("Fees")
                     Session("RCM71_RelocationFeeID")=s_o("ID")
                     Session("RCM71_RelocationFeeName")=s_o("Name")
                     if s_o("GST")="True" then
                           RelocationFeeGST=s_o("Fees")
                     end if
                     if s_o("StampDuty")="True" then
                           RelocationFeeStampDuty=s_o("Fees")
                     end if

                        if s_o("Fees")<>0 then
                           SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
                           SQL=SQL&"VALUES ("&s_o("Fees")&",'"&Session("RCM71_OnlineBookingNo")&"','"&s_o("ID")&"','"&s_o("Fees")&"',1)"
                           'Response.Write("<br>")
                                  'Response.Write(SQL)
                                 webConn.Execute(SQL)
                        end if
                 end if
                s_o.MoveNext
                Loop
         end if
         s_o.CLOSE
         SET s_o=NOTHING

             
         '-----Pickup Location After hours and befores fee, check if the pickup time is between the office time-------------
        Session("RCM71_AfterHoursFee")=0
        Session("RCM71_PickupAfterHoursFee")=0
        AfterHoursFeeGST=0
        AfterHoursFeeStampDuty=0
        if Session("RCM71_PickupAfterHourFeeID")<>0  then 'check the time
               AfterHoursFee=0
               Set s_st=webConn.Execute("SELECT ID, Name, Fees,GST,StampDuty FROM ExtraFees WHERE (ID)='"&Session("RCM71_PickupAfterHourFeeID")&"' ")
               if s_st("Fees")  <>0 then 
               AfterHoursFee=s_st("Fees")
               AfterHoursGST=s_st("GST") 
               AfterHoursStampDuty=s_st("StampDuty")
               Session("RCM71_PickupAfterHourFeeID")=s_st("ID")
            end if
            s_st.close
         SET s_st=nothing
               '---Pickup Location After Hour fees   'do not convert to CDate
                PickupOpeningTime=(Session("RCM71_RequestPickDate")&" "&Session("RCM71_PickupOfficeOpeningTime"))
            PickupClosingTime=(Session("RCM71_RequestPickDate")&" "&Session("RCM71_PickupOfficeClosingTime")) 
                if (Session("RCM71_RequestPickDateTime") < PickupOpeningTime) or (Session("RCM71_RequestPickDateTime") > PickupClosingTime) THEN
                        Session("RCM71_PickupAfterHoursFee")=AfterHoursFee 
      end if  
       if AfterHoursGST="True" then
                     AfterHoursFeeGST=Session("RCM71_PickupAfterHoursFee")
                end if
                if AfterHoursStampDuty="True" then
                        AfterHoursFeeStampDuty=Session("RCM71_PickupAfterHoursFee")
                end if
                if Session("RCM71_PickupAfterHoursFee")>0 then
                  '---insert AfterHours Fee to WebPaymentExtraFees table
            SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
         SQL=SQL&"VALUES ("&Session("RCM71_PickupAfterHoursFee")&",'"&Session("RCM71_OnlineBookingNo")&"',"&Session("RCM71_PickupAfterHourFeeID")&","&Session("RCM71_PickupAfterHoursFee")&",'1')"
            'Response.Write("<p>") 
               'Response.Write(SQL)
               webConn.Execute(SQL)   
           end if
   end if
     '------------Dropoff Location After Hour Fees ------------------
    Session("RCM71_DropoffAfterHoursFee")=0
    if Session("RCM71_DropoffAfterHourFeeID")<>0  then
           Set s_st=webConn.Execute("SELECT ID, Name, Fees,GST,StampDuty FROM ExtraFees WHERE (ID)='"&Session("RCM71_DropoffAfterHourFeeID")&"' ")
           if s_st("Fees")  <>0 then
               AfterHoursFee=s_st("Fees")
               AfterHoursGST=s_st("GST")
               AfterHoursStampDuty=s_st("StampDuty")
               DropoffAfterHoursFeeID=s_st("ID")

            end if
            s_st.close
            SET s_st=nothing
            DropoffOpeningTime=(Session("RCM71_RequestDropDate")&" "&Session("RCM71_DropoffOfficeOpeningTime"))
            DropoffClosingTime=(Session("RCM71_RequestDropDate")&" "&Session("RCM71_DropoffOfficeClosingTime"))
            if (Session("RCM71_RequestDropDateTime") < DropoffOpeningTime) or (Session("RCM71_RequestDropDateTime") > DropoffClosingTime) THEN
                  Session("RCM71_DropoffAfterHoursFee")=  AfterHoursFee
                  if AfterHoursGST="True" then
                        AfterHoursFeeGST=AfterHoursFeeGST+Session("RCM71_DropoffAfterHoursFee")
                  end if
                  if AfterHoursStampDuty="True" then
                        AfterHoursFeeStampDuty=AfterHoursFeeStampDuty+Session("RCM71_DropoffAfterHoursFee")
                  end if
            end if
      end if
      ' AfterHoursFee=   Session("RCM71_PickupAfterHoursFee")+Session("RCM71_DropoffAfterHoursFee") '---, for insert to table, 9 Jun  2012 removed to below
     ' Session("RCM71_AfterHoursFee")=AfterHoursFee
      Session("RCM71_AfterHoursFee") =  Session("RCM71_PickupAfterHoursFee")+Session("RCM71_DropoffAfterHoursFee")'--for total cost
      if Session("RCM71_PickupAfterHoursFee")>0  and Session("RCM71_DropoffAfterHoursFee")=0 then
                 '---insert AfterHours Fee to WebPaymentExtraFees table
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&Session("RCM71_PickupAfterHoursFee")&",'"&Session("RCM71_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("RCM71_PickupAfterHoursFee")&",1,1)"
                  'Response.Write("<p>")
                  'Response.Write(SQL)
                  webConn.Execute(SQL)

        elseif Session("RCM71_PickupAfterHoursFee")=0 and Session("RCM71_DropoffAfterHoursFee")>0 then
                  '---insert AfterHours Fee to WebPaymentExtraFees table
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&Session("RCM71_DropoffAfterHoursFee")&",'"&Session("RCM71_OnlineBookingNo")&"',"&DropoffAfterHoursFeeID&","&Session("RCM71_DropoffAfterHoursFee")&",1,1)"
               '  Response.Write("<p>")
                ' Response.Write(SQL)
                  webConn.Execute(SQL)
        elseif Session("RCM71_PickupAfterHoursFee")>0 and Session("RCM71_DropoffAfterHoursFee")>0 then
               if PickupAfterHoursFeeID=DropoffAfterHoursFeeID then
                  AfterHoursFee=   Session("RCM71_PickupAfterHoursFee")+Session("RCM71_DropoffAfterHoursFee")
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&AfterHoursFee&",'"&Session("RCM71_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("RCM71_PickupAfterHoursFee")&",1,2)"
               '  Response.Write("<p>")
                ' Response.Write(SQL)
                  webConn.Execute(SQL)
                else
                     SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                     SQL=SQL&"VALUES ("&Session("RCM71_PickupAfterHoursFee")&",'"&Session("RCM71_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("RCM71_PickupAfterHoursFee")&",1,1)"
                      ' Response.Write("<p>")
                       'Response.Write(SQL)
                     webConn.Execute(SQL)
                    SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                    '--bug fixSession("RCM71_PickupAfterHoursFee") changed Session("RCM71_DropoffAfterHoursFee")
                     SQL=SQL&"VALUES ("&Session("RCM71_DropoffAfterHoursFee")&",'"&Session("RCM71_OnlineBookingNo")&"',"&DropoffAfterHoursFeeID&","&Session("RCM71_DropoffAfterHoursFee")&",1,1)"
                     '  Response.Write("<p>")
                     ' Response.Write(SQL)
                   webConn.Execute(SQL)
                end if
        end if
        Session("RCM71_AfterHoursFee")=   Session("RCM71_PickupAfterHoursFee")+Session("RCM71_DropoffAfterHoursFee")




   '----Get TaxName 1  ----------------------
   Session("RCM71_TaxName1") ="GST"
   Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='TAX1'  ")
   If not s_st.EOF then
            Session("RCM71_TaxName1") = s_st("syValue")
   END IF
   s_st.CLOSE
   SET s_st=NOTHING

   '----get TaxName 2 --------------
    Session("RCM71_TaxName2") ="Stamp Duty"
    Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='TAX2'  ")
    If not s_st.EOF then
               Session("RCM71_TaxName2") = s_st("syValue")
    END IF
    s_st.CLOSE
    SET s_st=NOTHING   
        
'----GST Inclusive--------------------------------
   Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='GSINC'  ")
   Session("RCM71_GSTInclusive") = "Yes"
   If not s_st.EOF then     
            Session("RCM71_GSTInclusive") = s_st("syValue")
   END IF
   s_st.CLOSE
   SET s_st=NOTHING 
      
          ' Response.Write(Session("RCM71_GSTInclusive"))
      
END IF     %>





<%  if Request.QueryString("dir")="checkAge"  then
           if Session("RCM71_OnlineBookingNo")="" then
            Response.Redirect "webBookingStep1.asp"
        end if
            DOBYear = CInt(Request.Form("DOBYear"))
            DOBMonth = (Request.Form("DOBMonth"))
      DOBDay  = CInt(Request.Form("DOBDay"))
      Session("RCM71_DOB")= DOBDay&"/"&DOBMonth&"/"&DOBYear
                  if Day(Session("RCM71_RequestPickDate"))=29 and MonthName(Month(Session("RCM71_RequestPickDate")),3)="Feb"  then
         MinDOB= MonthName(Month(Session("RCM71_RequestPickDate")),3)&"/"&(Day(Session("RCM71_RequestPickDate"))-1)&"/"&(Year(Session("RCM71_RequestPickDate"))-Session("RCM71_MinimunAge"))
                  
        else
         MinDOB= MonthName(Month(Session("RCM71_RequestPickDate")),3)&"/"&Day(Session("RCM71_RequestPickDate"))&"/"&(Year(Session("RCM71_RequestPickDate"))-Session("RCM71_MinimunAge"))
           
         end if
              
            'MinDOB= MonthName(Month(Now),3)&"/"&Day(Now)&"/"&(Year(Now)-21) 
         
            '----check the Expiry Date
            LicYear = CInt(Request.Form("licensYear"))
            LicMonth = (Request.Form("licensMonth"))
            LicDay  = CInt(Request.Form("licensDay"))
            Session("RCM71_LicExpDate") = LicDay&"/"&LicMonth&"/"&LicYear 
            CurrentExpDate= Day(Date)&"/"&MonthName(Month(Date),3)&"/"&Year(Date)      
                 
            Session("RCM71_FirstName")=tidyup(Request.Form("firstname"))
               Session("RCM71_LastName")=tidyup(Request.Form("lastname"))
            Session("RCM71_License")=tidyup(Request.Form("License")) 
                  Session("RCM71_address")=Request.Form("address")
         Session("RCM71_city")=Request.Form("city")
                  Session("RCM71_state")=Request.Form("state")
         Session("RCM71_postcode")=Request.Form("postcode")
         Session("RCM71_countryID")=Request.Form("countryID")
                 Session("RCM71_CustomerEmail")=tidyup(Request.Form("CustomerEmail")) 
         Session("RCM71_phone")=tidyup(Request.Form("phone"))
                Session("RCM71_fax")=Request.Form("fax")
         Session("RCM71_Notes")=Request.Form("Notes")
             Session("RCM71_Flight")=tidyup(Request.Form("Flight"))
      Session("RCM71_Flightout")=tidyup(Request.Form("Flightout"))
      Session("RCM71_Mobile")=tidyup(Request.Form("Mobile"))

                 if Session("RCM71_LastName")="" or Session("RCM71_CustomerEmail")="" then
                          Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* Please enter Renter Information.")
               elseif Request.Form("submit1")="Request Booking" and Request.Form("DOBYear")="1900" then
                        Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* Please enter your DOB.")
                 elseif  Request.Form("submit1")="Request Booking" and IsDate(Session("RCM71_DOB"))<>"True"  then
                  Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* The DOB date "&Session("RCM71_DOB")&" does not exit.")
            elseif Request.Form("submit1")="Request Booking" and  IsDate(Session("RCM71_LicExpDate")) <>"True"  then 
                  Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* The License Expiry Date "&Session("RCM71_LicExpDate")&" does not exit.")
         elseif Request.Form("submit1")="Request Booking" and  (DateValue(Session("RCM71_LicExpDate")) - DateValue(CurrentExpDate)< 0) then
                  Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* The License Date "&Session("RCM71_LicExpDate")&" is Expired.")
               
                  elseif Request.Form("submit1")="Request Booking" and  (Session("RCM71_MinimunAge")<>0 and (DateValue(MinDOB) - DateValue(Session("RCM71_DOB")))< 0 ) then
                     Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* Vehicles are not available for hire to drivers under "&Session("RCM71_MinimunAge")&" years of age.")
         else 
            
                  Set s_c=webConn.Execute("SELECT * FROM Country where (ID)='"&Request.Form("countryID")&"' " )
                         Session("RCM71_country")=s_c("Country")
                         s_c.close
                         Set s_c=nothing
             
             
                 
                  SQL="UPDATE WebReservation SET "
                  SQL=SQL&" KmsFree ="&Session("RCM71_KmsFree")&",  "
                   SQL=SQL&" AddKmsFee ="&Session("RCM71_AddKmsFee")&",  "          
                'SQL=SQL&" Notes ='"&Left(tidyup(Request.Form("Notes")),&"',  "
                  SQL=SQL&" Phone ='"&Left(tidyup(Request.Form("phone")),20)&"' , "
                  SQL=SQL&" Email ='"&Left(tidyup(Request.Form("CustomerEmail")),50)&"',  "
                  SQL=SQL&" Name ='"&Left(tidyup(Request.Form("lastname")),30)&"'  "
                  SQL=SQL&"WHERE (ReservationNo) ='"&Session("RCM71_OnlineBookingNo")&"'"
                  webConn.Execute(SQL) 
                  Response.Write(SQL)
                
                        if Request.Form("submit1")="Request Booking" then
                              Response.Redirect "webBookingStep5.asp" 
                     else
                           Response.Redirect "webBookingStep6.asp?dir=quote" 
                     end if
            end if
         
            
                
end if     %>
   <TABLE  width=600  align=center bgcolor=#001B6C  cellSpacing=0 cellPadding=1  border=0><tr><td>
   <TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>
   <tr height=20><td  align=center class=header bgColor=#00509F colspan=4>STEP 4 - Confirm Quote & Enter Personal Information</td></tr>
    <tr><Td colspan=4><table  cellSpacing=0 cellPadding=2  border=0>
    <%   '----------the form
    'Response.Write("<form method=post action='webBookingStep3.asp?dir=checkAge'  name='emailbooking'  onsubmit='return Validate(this)'>")   
          Response.Write("<form method=post action='webBookingStep4.asp?dir=checkAge'  name='theForm'  onSubmit='return Validate();'>")   
      
            Response.Write("<tr><td></td><td width=""120"" align=left class=text>Pickup Location:</td><td align=left class=text colspan=2> ")
                        Response.Write(Session("RCM71_PickupLocation")) 
                        Response.Write("</td></tr>")
                       
                        Response.Write("<tr><td></td><td align=left class=text>Pickup Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("RCM71_RequestPickDate")))&", ")
                        'Response.Write(Session("RCM71_RequestPickDateTime"))
                        Response.Write(Day(Session("RCM71_RequestPickDate"))&"/"&Left(MonthName(Month(Session("RCM71_RequestPickDate"))),3)&"/"&Year(Session("RCM71_RequestPickDate"))) 
                        Response.Write("&nbsp;")
                        Response.Write(Session("RCM71_RequestPickTime"))
                        Response.Write("</td></tr>")
                        
                        if Session("RCM71_Flight")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Arrival FLT: </td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM71_Flight"))  
                        Response.Write("</td></tr>")
                        end if
                        
                        Response.Write("<tr><td></td><td align=left class=text>Return Location: </td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM71_DropoffLocation"))  
                        Response.Write("</td></tr>") 
                       
                      
                        Response.Write("<tr><td></td><td align=left class=text>Return Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("RCM71_RequestDropDate")))&", ")
                         'Response.Write(Session("RCM71_RequestDropDateTime"))
                        Response.Write(Day(Session("RCM71_RequestDropDate"))&"/"&Left(MonthName(Month(Session("RCM71_RequestDropDate"))),3)&"/"&Year(Session("RCM71_RequestDropDate"))) 
                        Response.Write("&nbsp;")
                        Response.Write(Session("RCM71_RequestDropTime"))
                       
                        Response.Write("</td></tr>")
                      
                       if Session("RCM71_Flightout")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Departure FLT:</td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM71_Flightout"))  
                        Response.Write("</td></tr>")
                       end if 
                       
                        if Session("RCM71_Mobile")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Mobile Phone No.:</td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM71_Mobile"))
                        Response.Write("</td></tr>")
                       end if 
                       
   '---Vehicle Type---------- 
       Response.Write("<tr><td></td><td align=left class=text>Vehicle Type: </td><td align=left class=text>"&Session("RCM71_CarType")&"</td><td align=left class=text align=right></td></tr>")
       
      '---Vehicle Type----------
      
         
       Response.Write("<tr><td></td><td align=left class=text> </td><td class=text><img src='"&theimage&"'  WIDTH=100 ></td><td class=text align=right></td></tr>")
      
    Response.Write("</table></td></tr>")
   '-------------Rate -----------------       
    if Request.QueryString("dir")="Rate"  then  
        '---------if  from step3, do all calculation ----
            for i=1 to Request.Form("SeasonCount")
                 SeasonID=Request.Form("SeasonID"&i&"")  
                NoOfDaysEachSeason=0
            if Request.Form("NoOfDaysEachSeason"&i&"")  <>"" then
             '======== for minimum rental day = 1
                  if Request.Form("SeasonCount")=1 and Request.Form("NoOfDaysEachSeason"&i&"")<1 then
                        NoOfDaysEachSeason=1       '======== for minimum rental day = 1
                  else
                        NoOfDaysEachSeason=Request.Form("NoOfDaysEachSeason"&i&"")
                  end if

            end if
            TotalNoDays=TotalNoDays+NoOfDaysEachSeason 
                 
                 '---need  get discount Rate again
                '--- check if the rental period in the Discount Date range
                '--- then check if there is a category discount rate 
                '--- if not then use the location discount rate
                Session("RCM71_DiscountRate")=0
            Session("RCM71_DiscountID")=0 
            Session("RCM71_DiscountType")="p" 
            Session("RCM71_DiscountName")=""
                 SQL="SELECT * from Discount WHERE (LocationID)='"&Session("RCM71_PickupLocationID")&"' "
            SQL=SQL&" AND WebItems=1 "
            SQL=SQL&" AND (CarSizeID)='"&Request.Form("CarSizeID")&"' "
            SQL=SQL&" AND DateRange=1 "
            SQL=SQL&" AND DateFrom<='"&Session("RCM71_RequestPickDate")&"' and DateTo>='"&Session("RCM71_RequestDropDate")&"' "
            Set s_disDate=webConn.Execute(SQL)  
            if  NOT s_disDate.EOF then    '---rental period in the discount date range and specific category apply
               if s_disDate("DiscountRate")>0 then
                              Session("RCM71_DiscountName")=s_disDate("DiscountName")
                     Session("RCM71_DiscountType")=s_disDate("DiscountType")
                        Session("RCM71_DiscountRate")=s_disDate("DiscountRate")
                        Session("RCM71_DiscountID")=s_disDate("ID")
                  end if
             else     '--specific category apply but Date Range not apply
                     SQL="SELECT * from Discount WHERE (LocationID)='"&Session("RCM71_PickupLocationID")&"' "
               SQL=SQL&" AND WebItems=1 "
               SQL=SQL&" AND (CarSizeID)='"&Request.Form("CarSizeID")&"' "
               SQL=SQL&" AND DateRange=0 "
               Set s_disCat=webConn.Execute(SQL)  
               if NOT s_disCat.EOF then  
                  if s_disCat("DiscountRate")>0 then  
                     Session("RCM71_DiscountName")=s_disCat("DiscountName")
                     Session("RCM71_DiscountType")=s_disCat("DiscountType")
                        Session("RCM71_DiscountRate")=s_disCat("DiscountRate")
                        Session("RCM71_DiscountID")=s_disCat("ID")
                        end if
                   else  '--check if Daterange apply to all Category
                        SQL="SELECT * from Discount WHERE (LocationID)='"&Session("RCM71_PickupLocationID")&"' "
                  SQL=SQL&" AND WebItems=1 "
                  SQL=SQL&" AND CarSizeID=0 " 
                  SQL=SQL&" AND DateRange=1 "
                        SQL=SQL&" AND DateFrom<='"&Session("RCM71_RequestPickDate")&"' and DateTo>='"&Session("RCM71_RequestDropDate")&"' "
                  Set s_dis3=webConn.Execute(SQL)  
                  if NOT s_dis3.EOF then  
                           if s_dis3("DiscountRate")>0 then 
                                    Session("RCM71_DiscountName")=s_dis3("DiscountName")
                              Session("RCM71_DiscountType")=s_dis3("DiscountType")
                                    Session("RCM71_DiscountRate")=s_dis3("DiscountRate")
                              Session("RCM71_DiscountID")=s_dis3("ID")
                              end if
                        else '--location discount
                           SQL="SELECT * from Discount WHERE (LocationID)='"&Session("RCM71_PickupLocationID")&"' "
                           SQL=SQL&" AND WebItems=1 "
                     SQL=SQL&" AND CarSizeID=0 " 
                     SQL=SQL&" AND DateRange=0 "
                     Set s_dis=webConn.Execute(SQL)  
                     if NOT s_dis.EOF then  
                           if s_dis("DiscountRate")>0 then 
                              Session("RCM71_DiscountName")=s_dis("DiscountName")
                                 Session("RCM71_DiscountType")=s_dis("DiscountType")
                                       Session("RCM71_DiscountRate")=s_dis("DiscountRate")
                                 Session("RCM71_DiscountID")=s_dis("ID")
                                    end if
                                 end if
                               s_dis.close
                               set s_dis=nothing      
                             end if
                             s_dis3.close
                  set s_dis3=nothing      
               end if
               s_disCat.close
               set s_disCat=nothing  
             end if  
             s_disDate.close
             set s_disDate=nothing
          
                 '------------- need recalculate the rate--------------  
                StandardRate=0
                Rate=0
            SQL="SELECT * FROM QCarRateDetails "
                  SQL=SQL&"WHERE (CarSizeID)="&Request.Form("CarSizeID")  &" "
                  SQL=SQL&"AND CarRateStructureID="&Session("RCM71_RateStructureID"&i&"")&" "
                  SQL=SQL&"AND (SeasonID)='"&Session("RCM71_SeasonID"&i&"")&"' "
                'SQL=SQL&"AND (LocationID)='"&Session("RCM71_PickupLocationID")&"' "
                  'Response.Write(SQL)
                Set s_m=webConn.Execute(SQL)
                 if NOT s_m.EOF   then   
                          'if s_m("Rate")>0 then 
                                 if Session("RCM71_DiscountType")="p" then
                                    Rate=s_m("Rate")*(1-(Session("RCM71_DiscountRate")/100)) 
                              else
                                 Rate=s_m("Rate")-Session("RCM71_DiscountRate")
                              end if
                              StandardRate=s_m("Rate")
                              '=================
                              if Request.Form("SeasonCount")=1 and Session("RCM71_NoOfDaysEachSeason"&i&"")<1 then
                                    Session("RCM71_NoOfDaysEachSeason"&i&"")=1
                               end if
                              '===================

                              costEachSeason=Rate*Session("RCM71_NoOfDaysEachSeason"&i&"")
                           'end if
                 end if 
                 s_m.close
                 set s_m=nothing
            
            RentalCost=RentalCost+costEachSeason
                
                        
                '--insert rate to WebPaymentDetail table
                 '--get each season record from the form and insert to paymentdetailes table 
  
                '---insert to the PaymentDetail table
                  SQL="INSERT INTO WebPaymentDetail (DiscountID,DiscountName,DiscountType,DiscountPerc,StandardRate,Rate,ReservationNo,SeasonID,Days,RateName)" 
                  SQL=SQL&"VALUES ("&Session("RCM71_DiscountID")&",'"&tidyup(Session("RCM71_DiscountName"))&"','"&(Session("RCM71_DiscountType"))&"',"&Session("RCM71_DiscountRate")&",'"&StandardRate&"','"&Rate&"','"&Session("RCM71_OnlineBookingNo")&"','"&Request.Form("SeasonID"&i&"")&"','"&NoOfDaysEachSeason&"','"&Request.Form("RateName"&i&"")&"')"
               'Response.Write("<br>") 
            'Response.Write(SQL)
               webConn.Execute(SQL) 
            
   NEXT           
        
     
      
      TotalCost=RentalCost+Session("RCM71_RelocationFee")+Session("RCM71_AfterHoursFee")
    
     
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
                              if CCur(Request.Form("Maxprice"&j&""))>0 and Session("RCM71_TotalRentalDays")*Request.Form("ExtraFees"&j&"")>CCur(Request.Form("Maxprice"&j&"")) then
                                          EachExtraFees=Request.Form("Maxprice"&j&"")*Request.Form("QTY"&j&"")
                                       ExtraFeesRate=Request.Form("Maxprice"&j&"")
                                       ExtraFeesNoDays=1
                                       ExtraType="Fixed" 
                                       SetMaxPrice=1
                                 else 
                                       EachExtraFees=Session("RCM71_TotalRentalDays")*Request.Form("ExtraFees"&j&"")*Request.Form("QTY"&j&"")
                                       ExtraFeesNoDays=Session("RCM71_TotalRentalDays")
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
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,SetMaxPrice,QTY, ReservationNo,ExtraFeesID,Fees,Days)"
               SQL=SQL&"VALUES ("&EachExtraFees&","&SetMaxPrice&",'"&Request.Form("QTY"&j&"")&"','"&Session("RCM71_OnlineBookingNo")&"','"&Request.Form("ExtraFeesID"&j&"")&"','"&ExtraFeesRate&"','"&ExtraFeesNoDays&"')"
                
                     webConn.Execute(SQL) 
                        
                end if    
     NEXT
     TotalCost=TotalCost+TotalExtraFees
     
    
    
    
     '-----Insurance Fee------------    
        InsuranceFee=0
        Session("RCM71_InsuranceFee")=0
        GSTInsurance=0 
        StampInsurance=0
        if Request.Form("InsuranceID")<>"" then
            Session("RCM71_InsuranceID")=Request.Form("InsuranceID")
            SQL="SELECT * from ExtraFees WHERE (ID)='"&Request.Form("InsuranceID")&"' "
            'SQL="SELECT * from ExtraFees WHERE (ID)='"&Request.Form("InsuranceID")&"' and inUse=1 and InsuranceExtra=1 and WebItems=1 "
            Set s_insu=webConn.Execute(SQL)
            if NOT s_insu.EOF  then
                     'InsuranceFee=s_insu("Fees")
                     Session("RCM71_InsuranceFee")=s_insu("Fees")  '--for pass to step5
                   
                     if s_insu("Type")="Daily" then
                           InsuranceFee=Session("RCM71_TotalRentalDays")*s_insu("Fees")
                     elseif s_insu("Type")="Fixed" then
                           InsuranceFee=s_insu("Fees")
                     else
                        InsuranceFee=(s_insu("Fees")/100)*RentalCost
                     end if        
                     if s_insu("GST")="True" Then
                              GSTInsurance=InsuranceFee
                     end if
                     if s_insu("StampDuty")="True" Then
                              StampInsurance=InsuranceFee
                     end if
                     SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,QTY, ReservationNo,ExtraFeesID,Fees,Days)"
                     SQL=SQL&"VALUES ("&InsuranceFee&",1,'"&Session("RCM71_OnlineBookingNo")&"',"&s_insu("ID")&","&s_insu("Fees")&",'"&Session("RCM71_TotalRentalDays")&"')"
                     'Response.Write("<br>")
                     'Response.Write(SQL)
                     webConn.Execute(SQL) 
            end if
            s_insu.close
            SET s_insu=Nothing
         end if
        'Session("RCM71_InsuranceFee")=InsuranceFee
         TotalCost=TotalCost+ InsuranceFee

         '-------------KmsFree per day -----------------
         KmsMaxcharge=0
        KmsDailyRate=0  
        AddKmsFee=0 
        KmsFree=0 
        Session("RCM71_KmsFree") =0
        Session("RCM71_AddKmsFee") =0
                
           if Request.Form("KmsFreeID")="" then
                     Response.Write("<input type='hidden' name='KmsFree' size=5 value='0' >")    
                     Response.Write("<input type='hidden' name='AddKmsFee' size=5 value='0' >")
                     Response.Write("<input type='hidden' name='KmsMaxcharge' size=5 value='0'>") 
                     Response.Write("<input type='hidden' name='KmsDailyRate' size=5 value='0'>")
                     Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='0'>") 
              else
               
                  KmsReSelectedInSubs

                      
              end if


               '----------------check Holiday Charges for pickup  from table HolidayextraFees  ---------------------
         SQL="SELECT ExtraFees.* FROM ExtraFees4Holiday,ExtraFees WHERE eh_ExtraFeeID=ExtraFees.ID and (eh_HolidayDate='"&Session("RCM71_RequestPickDate")&"' and  eh_LocationID='"&Session("RCM71_PickupLocationID")&"')  "
         'Response.Write(SQL)
       Set s_ex=webConn.Execute(SQL)
       HolidayPickupExtraID=0
       HolidayChargeQty=0
       if NOT s_ex.EOF THEN
               HolidayPickupExtraID=s_ex("ID")
               HolidayChargeQty=1
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
               SQL=SQL&"VALUES ("&s_ex("Fees")&",'"&Session("RCM71_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"',1)"
                'Response.Write("<br>")
                'Response.Write(SQL)
               webConn.Execute(SQL)
               TotalCost=TotalCost+ s_ex("Fees")
      end if
      s_ex.close
      Set s_ex=Nothing

      '--check Holiday Charges for dropoff  from table HolidayextraFees
       SQL="SELECT ExtraFees.*  FROM ExtraFees4Holiday,ExtraFees WHERE   eh_ExtraFeeID=ExtraFees.ID and (eh_HolidayDate='"&Session("RCM71_RequestdropDate")&"' and  eh_LocationID='"&Session("RCM71_DropoffLocationID")&"') "
       'Response.Write(SQL)
       Set s_ex=webConn.Execute(SQL)
       HolidayDropoffExtraID=0
       if NOT s_ex.EOF THEN
              HolidayDropoffExtraID=s_ex("ID")
               HolidayChargeQty=1
               if  HolidayDropoffExtraID=HolidayPickupExtraID  then
                  HolidayChargeQty=2
                  webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' and ExtraFeesID='"&s_ex("ID")&"' ")

               end if
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
               SQL=SQL&"VALUES ("&(s_ex("Fees")*HolidayChargeQty)&",'"&Session("RCM71_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"',1,'"&HolidayChargeQty&"')"
                'Response.Write("<br>")
                'Response.Write(SQL)
                  TotalCost=TotalCost+ s_ex("Fees")
               webConn.Execute(SQL)
      end if
      s_ex.close
      Set s_ex=Nothing
          '----------------END check Holiday Charges for pickup  from table HolidayextraFees  ---------------------



 
       '-------------Web Mandatory Extra fees-----------------
     SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("RCM71_PickupLocationID")&"' or LocationID=0) and WebItems=1 and Mandatory=1 AND inUse=1 and InsuranceExtra=0 and PercentageTotalCost=0 and MerchantFee=0 order by Type,Name"
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
               'if  TotalNoDays > Fix(TotalNoDays) and Request.Form("HourRate") <>"0" then
                      ' MandatoryExtraFeesNoDays=Fix(Session("RCM71_TotalRentalDays"))+1
                  'end if    
                  '---daily fees always use   Session("RCM71_TotalRentalDays") (fixed number) 
                  MandatoryExtraFeesNoDays=Session("RCM71_TotalRentalDays")
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
                SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
               SQL=SQL&"VALUES ("&EachMandatoryExtraFees&",'"&Session("RCM71_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"','"&MandatoryExtraFeesNoDays&"')"
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
   Set s_st=webConn.Execute("SELECT * FROM QStampDuty WHERE ID="&Session("RCM71_PickupLocationID")&"  ")
   If not s_st.EOF then
      StampDutyRate=s_st("StampDuty")/100 
        GSTRate= s_st("GSTRate")/100  
  end if
  s_st.close
  set s_st=nothing  

'----Stamp Duty calculation------------------------------------
  StampDuty=0
  Session("RCM71_StampDuty")=0
  if StampDutyRate>0 then  '--if StampDutyRate=0 then no Stampduty applied
        '---stampduty is the revenues less GST times Stampduty rate
        '--- GSTInclusive means stampduty caclutations use Revenue less GST
        '--- Not GSTInclusive means, Revenues do not include GST
        if Session("RCM71_GSTInclusive") = "Yes"  then
               StampDuty=StampDutyRate*(RentalCost+ RelocationFeeStampDuty + AfterHoursFeeStampDuty + ExtraStamp + MandatoryextraStamp +StampInsurance)*(1-GSTRate) 
        else
                StampDuty=StampDutyRate*(RentalCost + RelocationFeeStampDuty + AfterHoursFeeStampDuty + ExtraStamp+ MandatoryextraStamp + StampInsurance)
        end if
        StampDuty=Round(StampDuty,2)               
        Session("RCM71_StampDuty")=StampDuty
 end if 
'----GST calculation------------------------------------
 GST=0 
 Session("RCM71_GST")=0
 if GSTRate>0 then  '--if GSTRate=0 then no GST applied
        if Session("RCM71_GSTInclusive") = "Yes"  then
                GST=(RentalCost + AfterHoursFeeGST + RelocationFeeGST + ExtraGST+ MandatoryExtraGST+ GSTInsurance)*(1-100/(100+GSTRate*100)) 
                
        else
               GST=(RentalCost + AfterHoursFeeGST + RelocationFeeGST + ExtraGST+ MandatoryExtraGST + GSTInsurance)*GSTRate 
        end if
        GST=Round(GST,2)                 
       Session("RCM71_GST")=GST
end if 

'--insert GST and StampDuty to WebReservation table 
              
        '----STAMPDUTY GST diferent layout------------------------------------  
        SubTotal=0
        if Session("RCM71_GSTInclusive") = "Yes"  then
                  TotalCost=StampDuty+ TotalCost
           
               
                              '-------------Web Mandatory MerchantFee or airport fees-----------------              
         SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("RCM71_PickupLocationID")&"' or LocationID=0) and WebItems=1 and Mandatory=1 AND inUse=1 and (PercentageTotalCost=1 or MerchantFee=1) and Type='Percentage' order by percentageTotalCost,MerchantFee,Name"
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
            ' Response.Write("<tr><td colspan=4 >"&rentalCost&"+"&TotalExtraFees&" +"&TotalMandatoryExtraFees&" + "&InsuranceFee&" + "&StampDuty&"</td></tr>")
             
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
                       SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
                     SQL=SQL&"VALUES ("&EachMerchantFee&","&Session("bwagt_OnlineBookingNo")&","&s_ex("ID")&","&s_ex("Fees")&",'1')"
                     '  Response.Write("<br>") 
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
    Session("RCM71_TotalEstimateofCharges")=TotalCost

    END IF
    
    '---------display all rates and fees here
         Set s_rate=webConn.Execute("SELECT WebPaymentDetail.*,Season FROM WebPaymentDetail,Season WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' and  SeasonID = Season.ID ")
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
           Response.Write("<tr><td colspan=4 height=1 bgcolor=#C0C0C0></td></tr>")         
               Response.Write("<tr><td></td><td align=left class=text>"&Season&"</td>")
                Response.Write("<td align=right class=text>"&s_rate("Days")&" Days @ "&FormatCurrency(s_rate("Rate"),2)&"</td><td class=text align=right>"&FormatCurrency(costEachSeason,2)&"</td></tr>")
              
        s_rate.MoveNext 
   Wend
   s_rate.Close
   Set l_s=nothing 
      
         if  Session("RCM71_KmsDesc")<>"" then
                  Response.Write("<tr><td></td><td align=left colspan=2 class=text>"&Session("RCM71_KmsDesc")&"</td><td class=text align=right>")
                  if Session("RCM71_KmsCost")<>0 then
                  Response.Write FormatCurrency(Session("RCM71_KmsCost"),2)
                  end if
                   Response.Write("</td></tr>")
         end if
          
          '--- extra fees
        Set s_extra=webConn.Execute("SELECT WebPaymentExtraFees.*, Name, Type,PayAgency FROM WebPaymentExtraFees, ExtraFees WHERE  (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' and ExtraFeesID = ExtraFees.ID ORDER BY TYPE, NAME ")
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
                        Response.Write("<tr><td></td><td class=text  align=left>"&s_extra("Name")&"<td class=text align=right> "&theQTY&"</td><td  align=right class=text>"&FormatCurrency(EachExtraFees,2)&"</td></tr>")
                  elseif s_extra("Type")="Daily" then
                        extraType =s_extra("Type")
                        if s_extra("SetMaxPrice")=True then
                              extraType="Fixed"
                        end if
                        Response.Write("<tr><td></td><td class=text  align=left>"&s_extra("Name")&"<td class=text align=right>  "&extraType&" at "&FormatCurrency(s_extra("Fees"),2)&" "&theQTY&"</td><td  align=right class=text>"&FormatCurrency(EachExtraFees,2)&"</td></tr>")
                  elseif s_extra("Type")="Fixed" then
                        Response.Write("<tr><td></td><td class=text align=left>"&s_extra("Name")&"<td class=text align=right>  "&s_extra("Type")&" at "&FormatCurrency(s_extra("Fees"),2)&" "&theQTY&"</td><td  align=right class=text>"&FormatCurrency(EachExtraFees,2)&"</td></tr>")
                  end if
                     
                  TotalExtraFees=TotalExtraFees+EachExtraFees 
                     
                
        s_extra.MoveNext
        Loop 
         s_extra.close        
         set s_extra=nothing  
        if  Session("RCM71_StampDuty") >0 then
                Response.Write("<tr><td></td><td class=text  colspan=2  align=left>"&Session("RCM71_TaxName2")&"</td>")
                Response.Write("<td  align=right class=text>"&FormatCurrency(Session("RCM71_StampDuty"),2)&"</td></tr>")
        end if 
        Response.Write("<tr><td></td><td class=text  colspan=2  align=left>GST</td>")
        Response.Write("<td  align=right class=text>"&FormatCurrency(Session("RCM71_GST"),2)&"</td></tr>")
        Response.Write("<tr><td colspan=4 height=1 bgcolor=#999999></td></tr>")
         Response.Write("<tr><td></td><td align=left class=text colspan=2><b>Total Estimate of Charges</td><td class=text align=right><b>"&FormatCurrency(Session("RCM71_TotalEstimateofCharges"),2)&"</td></tr>")
            
                
   PersonalInfoForm
                 
   Response.Write("</td></tr></table>")
   Response.Write("</td></tr></table></form>")
         
  ' Response.Write(""&RentalCost&"+"&RelocationFeeStampDuty&"+"&AfterHoursFeeStampDuty&"+"&ExtraStamp&"+"&MandatoryextraStamp&"+"&StampInsurance&""  )
   
        
  Response.Write("</td></tr></table>")
  webConn.CLOSE 
         
     
%>  </td>
     </tr>
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

