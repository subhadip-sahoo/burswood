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
   if (document.theForm.CustomerEmail.value == "")
  {      alert("Email Address required.");
      document.theForm.CustomerEmail.focus();
      return (false);
  }

   if (document.theForm.Phone.value == "")
  {      alert("Phone No required.");
      document.theForm.Phone.focus();
      return (false);
  }

   if (document.theForm.Mobile.value == "")
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
//-->
</script> 
<link href="burbook.css" rel="stylesheet" type="text/css" />
<body onload="MM_preloadImages('images/homed.gif')">
<!-- Banner starts here -->
<table width="748" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"><img src="graphics/burswood-car-rental-banner.jpg" alt="Burswood Car Rentals" width="960" height="187" border="0" usemap="#carsMap" id="cars" />
              <map name="carsMap" id="carsMap">
                <area shape="rect" coords="33,30,254,117" href="http://www.burswoodcarrentals.net.au" alt="Burswood Car Rentals Home Page" />
              <area shape="rect" coords="781,96,948,176" href="http://www.burswoodcarrentals.net.au" alt="" />
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
        <td><img src="graphics/4-purchase-current.gif" alt="Car Rental Purchase Details" width="76" height="75" /></td>
        <td><img src="graphics/5-confirm.gif" alt="Car Rental Booking Confirmation" width="62" height="75" border="0" /></td>
      </tr>
    </table></td>
    <td align="left" valign="middle"><a href="index.html"></a><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','home','',1)" onmouseover="MM_nbGroup('over','home','images/homed.gif','',1)" onmouseout="MM_nbGroup('out')"></a><img src="graphics/hd-quote-book.gif" alt="Get quote or book" width="313" height="76" border="0" /></td>
  </tr>
</table>
<!-- Order steps end here -->

<%  

  if Session("AuBurswood169_RequestPickDate")="" then

                  Response.Redirect "webbookingstep1.asp"
     end if

         RCMURL="https://secure20.rentalcarmanager.com.au"
         CompanyCode="Australiawide71"
         DatabaseFile="Australiawide71"


         theimage="https://secure20.rentalcarmanager.com.au/DB/"&CompanyCode&"/"&Session("AuBurswood169_CarImageName")

         Session("AuBurswood169_URL")="Burswood"

     
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


<!-- WEB PAGE HEAD -----------> 
<table width="748" height="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="egg">

<tr><td>    


<!-- RCM HTML CODE-----------> 

<%
SUB   KmsReSelectedInSubs  '--used in all subs
                  webConn.Execute("DELETE  FROM WebReservationFees WHERE rf_ReservationNo="&Session("AuBurswood169_OnlineBookingNo")&" ")
                  SQL="SELECT * from KmsFree  WHERE ID="&Request.Form("KmsFreeID")&" "
                  Set s_km=webConn.Execute(SQL)
                  KmsFree=s_km("KmsFree") 
                  AddKmsFee=s_km("AddKmsFee") 
                  KmsMaxcharge=s_km("MaxPrice") 
                  KmsDailyRate=s_km("DailyRate") 
                  Session("AuBurswood169_KmsFree") =s_km("KmsFree")
                 Session("AuBurswood169_AddKmsFee") =s_km("AddKmsFee")
                   sKmsMaxprice="" 
                   Session("AuBurswood169_KmsDesc")=""
                         if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                            '--unlimited without daily charge
                            KmsDesc="Unlimited Kms"  
                             '--if  pass Unlimited, save the 0 Daily rate  to the Reservationfees table
                             '--if daily rate =0 then print unlimited in the documents
                               Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='1'>")
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                        SQL=SQL&"VALUES ("&Session("AuBurswood169_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                                  'Response.Write(SQL)                                 
                     webConn.Execute(SQL) 
                        
  
                          elseif s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate") >0 then
                           '--unlimited with daily charge
                           iKmsDailyRate=s_km("DailyRate")
                          Session("AuBurswood169_KmsDesc")="Unlimited Kms, daily rate @"&FormatCurrency(s_km("DailyRate"))
                          Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='1'>")   
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                        SQL=SQL&"VALUES ("&Session("AuBurswood169_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                              'Response.Write(SQL)                                 
                     webConn.Execute(SQL) 
                          elseif  s_km("MaxPrice")>0 then  
                           sKmsMaxprice=", max charge "&FormatCurrency(s_km("MaxPrice"))&" per day" 
                           Session("AuBurswood169_KmsDesc")=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&sKmsMaxprice
                            Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='1'>")  
                           SQL="INSERT INTO WebReservationFees (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
                        SQL=SQL&"VALUES ("&Session("AuBurswood169_OnlineBookingNo")&","&s_km("MaxPrice")&","&s_km("DailyRate")&")"
                              'Response.Write(SQL)                                 
                     webConn.Execute(SQL) 
                     else  
                        Session("AuBurswood169_KmsDesc")=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))
                            Response.Write("<input type='hidden' name='KmsSaveFees' size=5 value='0'>")
                      end if   
                       '   Response.Write("<tr><td colspan=5 height=1 bgcolor=#F5FAFB ></td></tr>")         
                       Response.Write("<tr><td></td><td class=text colspan=3 >"&Session("AuBurswood169_KmsDesc")&"</td></tr>")
                     Response.Write("<input type='hidden' name='KmsFree' size=5 value='"&KmsFree&"' >")    
                  Response.Write("<input type='hidden' name='AddKmsFee' size=5 value='"&AddKmsFee&"' >")
                  Response.Write("<input type='hidden' name='KmsMaxcharge' size=5 value='"&KmsMaxcharge&"'>")
                  Response.Write("<input type='hidden' name='KmsDailyRate' size=5 value='"&KmsDailyRate&"'>")     
                      s_km.CLOSE
                        set s_km=nothing     
                        
                 
END SUB
SUB PersonalInfoForm 
%>      

<TR HEIGHT=30 ><td colspan=4 align=center bgColor=#00509F  class=header>Renter Information</td></tr>
        <tr><td></td><td class=text colspan=3>
         <table>
            <tr><td align=left class=text>&nbsp;First Name:</td><td align=left class=text  colspan=2><input Type=text name=firstname Size=30 value='<%=Session("AuBurswood169_FirstName")%>'></td></tr>
       <tr><td align=left class=text><font color=red>*</font>Last Name:</td><td align=left class=text colspan=2><input Type=text name=lastname Size=30 value='<%=Session("AuBurswood169_LastName")%>'></td></tr>
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
        <tr><td align=left class=text><font color=red>*</font>License No:</td><td align=left class=text  colspan=2><input Type=text name=License Size=30 value='<%=Session("AuBurswood169_License")%>'></td></tr>
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
        <tr><td align=left class=text><font color=red>*</font>&nbsp;Address:</td><td align=left class=text  colspan=2><input type=text name=address size=30 value='<%=Session("AuBurswood169_address")%>'></td></tr>
        <tr><td align=left class=text><font color=red>*</font>&nbsp;City:</td><td align=left class=text  colspan=2><input type=text name=city size=30 value='<%=Session("AuBurswood169_city")%>'></td></tr>
        <tr><td align=left class=text>&nbsp;State/Province:</td><td align=left class=text  colspan=2><input type=text name=state size=30 value='<%=Session("AuBurswood169_state")%>' ></td></tr>
        <tr><td align=left class=text>&nbsp;Postcode/ZIP:</td><td align=left class=text  colspan=2><input type=text name=postcode size=30 value='<%=Session("AuBurswood169_postcode")%>'></td></tr>
        <tr><td align=left class=text><font color=red>*</font>&nbsp;Country of Residence:</td><td align=left class=text  colspan=2>
             <%   Set s_c=webConn.Execute("SELECT * FROM Country ORDER BY  Country " )
            Response.Write("<SELECT name=CountryID>") 
                WHILE NOT s_c.EOF  
                  if  s_c("Country")=Session("AuBurswood169_country") then
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
   <tr><td align=left class=text><font color=red>*</font>Email Address:</td><td align=left class=text  colspan=2><input Type=text name=CustomerEmail Size=30 value='<%=Session("AuBurswood169_CustomerEmail")%>'></td></tr>
             <tr><td align=left class=text></td><td align=left class=text  colspan=2><small><b><font color=red>(Please check your Email Address is correct)</font></td></tr>
       <tr><td align=left class=text><font color=red>*</font>Phone (incl area code):</td><td align=left class=text  colspan=2><input Type=text name=Phone Size=30 value='<%=Session("AuBurswood169_phone")%>'></td></tr>
        </tr> <tr>
        <td CLASS=text align=left><font color=red>*</font>Mobile Phone No.:</td>
       <td CLASS=text align=left><input Type=text name=Mobile Size=30 value='<%=Session("AuBurswood169_Mobile")%>'></td>
        <tr><td align=left class=text>&nbsp;Facsimile:</td>
        <td align=left class=text  colspan=2><input type=text name=fax size=30 value='<%=Session("AuBurswood169_Fax")%>'></td></tr>
         <tr>
       <td CLASS=text align=left>Arrival FLT:</td>
       <td CLASS=text align=left><input Type=text name=Flight Size=30 value='<%=Session("AuBurswood169_Flight")%>'></td>
     </tr><tr>
        <td CLASS=text align=left>Departure FLT:</td>
       <td CLASS=text align=left><input Type=text name=Flightout Size=30 value='<%=Session("AuBurswood169_Flightout")%>'></td>
      </tr>  <tr>
        <td align=left class=text>Additional Details:</td>
        <td align=left class=text colspan=2><textarea name=Notes cols=25 rows=3><%=Session("AuBurswood169_Notes")%></textarea></td>
     </tr> 

   </table>
        </td></tr>
        <TR height=10><td align=left colspan=4></td></tr>
        <TR height=2><td colspan=4 bgColor=#999999 ></td></tr>
        <TR><td colspan=4 align=right >
         <INPUT TYPE=button NAME=Back  VALUE=Back  onClick='javascript:history.back(-1)'>&nbsp;&nbsp;
      <input onClick="document.pressed=this.value"  name=submit1 type="submit"  value="Email Me Quote" >&nbsp;&nbsp; 
      <input  onClick="document.pressed=this.value" name=submit1 type="submit"  value="Request Booking"></td></tr>
         
        
   <tr > 
   <td colspan=4  class=text  align=right><font color=red>*</font> 
      <font color=red>REQUEST BOOKING: Required fields must be completed.<br />EMAIL QUOTE: Just fill out surname and email address.</font><br><br /></td>
</tr>
      
<%   
END SUB
  
   
 
'------ check, Not to let under 21years proceed with booking
 
  if Session("AuBurswood169_RequestDropDate")="" then
       Response.Redirect "webBookingStep1.asp"
  end if
 
'------------------------------------------------------------------------------------------
if Request.QueryString("dir")="Rate"  then
      
   '---Vehicle Type----------  
   Session("AuBurswood169_CarType")=""
         Session("AuBurswood169_CarSizeID")=0
       ' Session("AuBurswood169_CarImageName")=""
         SQL="SELECT * FROM CarSize WHERE (ID)='"&Request.Form("CarSizeID")&"'"
         Set s_cs=webConn.Execute(SQL) 
         Session("AuBurswood169_CarType")=s_cs("WebDesc")
         Session("AuBurswood169_CarSizeID")=Request.Form("CarSizeID")
         Session("AuBurswood169_FreeSale")=s_cs("FreeSale")
        Session("AuBurswood169_CarImageName")=s_cs("ImageName")
   ' Response.Write Session("AuBurswood169_CarImageName")
        s_cs.CLOSE 
        SET s_cs=nothing
        
    '---Insert the booking details to WebReservation table  
   IF Session("AuBurswood169_OnlineBookingNo") <>"" then
         SQL="UPDATE WebReservation SET "
         SQL=SQL&" Email ='"&Left(tidyup(Request.Form("CustomerEmail")),50)&"',  "
         SQL=SQL&" Name ='"&Left(tidyup(Request.Form("lastname")),30)&"',  "
         SQL=SQL&"Phone ='"&Left(tidyup(Session("AuBurswood169_phone")),20)&"' , "
        ' SQL=SQL&"NoTravelling ='"&Left(tidyup(Session("AuBurswood169_NoTravelling")),30)&"' , "
         SQL=SQL&"CarSizeID ="&(Session("AuBurswood169_CarSizeID"))&", "
         SQL=SQL&"PickupdateTime ='"&Session("AuBurswood169_RequestPickDateTime")&"', "
         SQL=SQL&"DropoffDateTime ='"&Session("AuBurswood169_RequestDropDateTime")&"', "
         SQL=SQL&"Pickupdate ='"&Session("AuBurswood169_RequestPickDate")&"', "
         SQL=SQL&"PickupTime ='"&Session("AuBurswood169_RequestPickTime")&"', "
         SQL=SQL&"DropoffDate ='"&Session("AuBurswood169_RequestDropDate")&"', "
         SQL=SQL&"DropoffTime ='"&Session("AuBurswood169_RequestDropTime")&"', "
         SQL=SQL&"PickupLocationID ="&Session("AuBurswood169_PickupLocationID")&", "
        SQL=SQL&"DropoffLocationID ="&Session("AuBurswood169_DropoffLocationID")&" "
        SQL=SQL&"WHERE (ReservationNo) ='"&Session("AuBurswood169_OnlineBookingNo")&"'"
       'Response.Write(SQL)
        webConn.Execute(SQL)
           '---if reflash the screen, delete the extra and rate then insert again
           webConn.Execute("DELETE FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"' ")

  else                 
      
        SQL="INSERT INTO WebReservation (BrandID,URL,Phone,Email,Name,PickupDateTime,DropoffDateTime,RentalSource,CarSizeID,PickupTime,Pickupdate,DropoffTime,DropoffDate,PickupLocationID,DropoffLocationID,ReservationTypeID)"
        SQL=SQL&"VALUES (6,'"&Left(Session("AuBurswood169_URL"),30)&"','"&Left(tidyup(Session("AuBurswood169_phone")),20)&"','"&Left(tidyup(Request.Form("CustomerEmail")),50)&"','"&Left(tidyup(Request.Form("lastname")),30)&"', '"&Session("AuBurswood169_RequestPickDateTime")&"','"&Session("AuBurswood169_RequestDropDateTime")&"' ,'Online Booking',"&(Session("AuBurswood169_CarSizeID"))&",'"&Session("AuBurswood169_RequestPickTime")&"','"&Session("AuBurswood169_RequestPickDate")&"','"&Session("AuBurswood169_RequestDropTime")&"', '"&Session("AuBurswood169_RequestDropDate")&"', "&Session("AuBurswood169_PickupLocationID")&", "&Session("AuBurswood169_DropoffLocationID")&", '1')"
       
       'Response.Write("<p>") 
       'Response.Write(SQL)
      webConn.Execute(SQL)
 
      '---get the ReservationNo
       Set s_No=webConn.Execute("SELECT Max(ReservationNo)  as ResNo FROM WebReservation ")
       Session("AuBurswood169_OnlineBookingNo")=s_No("ResNo")
      'Response.Write(Session("AuBurswood169_OnlineBookingNo"))
         s_No.close
         set s_No=nothing
  end if
      webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"' ")
      webConn.Execute("DELETE FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"' ")
        '----Relocation fee-------------


      Session("AuBurswood169_RelocationFee")=0
         Session("AuBurswood169_RelocationFeeID")=0
         Session("AuBurswood169_RelocationFeeName")=""
         RelocationFeeGST=0
         RelocationFeeStampDuty=0
         '--1. check Relocation record (with caterory, date range)
         SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
         SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID and (CarSizeID)='"&Session("AuBurswood169_CarSizeID")&"'  and Mandatory=0 "
         SQL=SQL&"  AND (PickuplocationID)='"&Session("AuBurswood169_PickupLocationID")&"' AND (DropofflocationID)='"&Session("AuBurswood169_DropoffLocationID")&"'  "
         SQL=SQL&" AND PickupDateFrom<='"&Session("AuBurswood169_RequestPickDate")&"'  and PickupDateTo >= '"&Session("AuBurswood169_RequestPickDate")&"' "
         '--next line of code will return the max Minbookingday if there are 2 records entered for same conditin
         SQL=SQL&"  AND MinBookingDay<="&Session("AuBurswood169_TotalRentalDays")&" order by MinBookingDay desc "
         'Response.Write(SQL)
          Set s_o=webConn.Execute(SQL)
          if  s_o.EOF THEN
                  s_o.close
                  Set s_o=Nothing
                  '--2. if no vehicle category Relocation fee found, check Relocation record (with  date range only)
                  SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                  SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID  and Mandatory=0  "
                  SQL=SQL&"  AND (PickuplocationID)='"&Session("AuBurswood169_PickupLocationID")&"' AND (DropofflocationID)='"&Session("AuBurswood169_DropoffLocationID")&"'  "
                  SQL=SQL&" AND PickupDateFrom<='"&Session("AuBurswood169_RequestPickDate")&"'  and PickupDateTo >= '"&Session("AuBurswood169_RequestPickDate")&"' "
                  SQL=SQL&"  AND MinBookingDay<="&Session("AuBurswood169_TotalRentalDays")&" order by MinBookingDay desc "
                  'Response.Write(SQL)
                   Set s_o=webConn.Execute(SQL)
                   if  s_o.EOF THEN
                        s_o.close
                        Set s_o=Nothing
                        '--3. if no vehicle category Relocation fee found, check Relocation record (with  catgory, no date ragne)
                        SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                        SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID  and (CarSizeID)='"&Session("AuBurswood169_CarSizeID")&"' "
                        SQL=SQL&"  AND (PickuplocationID)='"&Session("AuBurswood169_PickupLocationID")&"' AND (DropofflocationID)='"&Session("AuBurswood169_DropoffLocationID")&"'  "
                        SQL=SQL&"  AND  Year(PickupDateFrom)=2100  and Mandatory=0 "
                        SQL=SQL&"  AND MinBookingDay<="&Session("AuBurswood169_TotalRentalDays")&" order by MinBookingDay desc "
                        'Response.Write(SQL)
                        Set s_o=webConn.Execute(SQL)
                        if  s_o.EOF THEN
                              s_o.close
                              Set s_o=Nothing
                                    '--4. if no vehicle category Relocation fee found, check Relocation record (with no catgory, no date ragne)
                              SQL="SELECT MinBookingDay,DaysNocharge,ExtraFees.ID,Name, Fees, GST,StampDuty FROM WebRelocationFees,ExtraFees "
                              SQL=SQL&" WHERE OnewayFeeID=ExtraFees.ID   and Mandatory=0 "
                              SQL=SQL&" AND CarSizeID=0 "
                              SQL=SQL&"  AND (PickuplocationID)='"&Session("AuBurswood169_PickupLocationID")&"' AND (DropofflocationID)='"&Session("AuBurswood169_DropoffLocationID")&"'  "
                              SQL=SQL&"  AND  Year(PickupDateFrom)=2100 and CarSizeID=0"
                              SQL=SQL&"  AND MinBookingDay<="&Session("AuBurswood169_TotalRentalDays")&" order by MinBookingDay desc "
                              'Response.Write(SQL)
                              Set s_o=webConn.Execute(SQL)
                        end if
                  end if

         end if


         webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"'  ")

         if NOT s_o.EOF THEN
               DO WHILE NOT s_o.EOF
                  if  s_o("DaysNocharge")=0 or (s_o("DaysNocharge")>0 and Session("AuBurswood169_TotalRentalDays")<s_o("DaysNocharge"))  then
                     Session("AuBurswood169_RelocationFee")=Session("AuBurswood169_RelocationFee")+s_o("Fees")
                     Session("AuBurswood169_RelocationFeeID")=s_o("ID")
                     Session("AuBurswood169_RelocationFeeName")=s_o("Name")
                     if s_o("GST")="True" then
                           RelocationFeeGST=s_o("Fees")
                     end if
                     if s_o("StampDuty")="True" then
                           RelocationFeeStampDuty=s_o("Fees")
                     end if

                        if s_o("Fees")<>0 then
                           SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
                           SQL=SQL&"VALUES ("&s_o("Fees")&",'"&Session("AuBurswood169_OnlineBookingNo")&"','"&s_o("ID")&"','"&s_o("Fees")&"',1)"
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
      '-----Pickup Location After hours and befores fee, check if the pickup time is between the office time-------------
        Session("AuBurswood169_AfterHoursFee")=0
        Session("AuBurswood169_PickupAfterHoursFee")=0
        AfterHoursFeeGST=0
        AfterHoursFeeStampDuty=0
        if Session("AuBurswood169_PickupAfterHourFeeID")<>0  then 'check the time
               AfterHoursFee=0
               Set s_st=webConn.Execute("SELECT ID, Name, Fees,GST,StampDuty FROM ExtraFees WHERE (ID)='"&Session("AuBurswood169_PickupAfterHourFeeID")&"' ")
               if s_st("Fees")  <>0 then
                  AfterHoursFee=s_st("Fees")
                  AfterHoursGST=s_st("GST")
                  AfterHoursStampDuty=s_st("StampDuty")
                  PickupAfterHoursFeeID=s_st("ID")

               end if
               s_st.close
               SET s_st=nothing
               '---Pickup Location After Hour fees   'do not convert to CDate
                PickupOpeningTime=(Session("AuBurswood169_RequestPickDate")&" "&Session("AuBurswood169_PickupOfficeOpeningTime"))
               PickupClosingTime=(Session("AuBurswood169_RequestPickDate")&" "&Session("AuBurswood169_PickupOfficeClosingTime"))
                if (Session("AuBurswood169_RequestPickDateTime") < PickupOpeningTime) or (Session("AuBurswood169_RequestPickDateTime") > PickupClosingTime) THEN
                        Session("AuBurswood169_PickupAfterHoursFee")=AfterHoursFee

                        if AfterHoursGST="True" then
                              AfterHoursFeeGST=Session("AuBurswood169_PickupAfterHoursFee")
                        end if
                        if AfterHoursStampDuty="True" then
                              AfterHoursFeeStampDuty=Session("AuBurswood169_PickupAfterHoursFee")
                        end if
                end if
      end if

     '------------Dropoff Location After Hour Fees ------------------
    Session("AuBurswood169_DropoffAfterHoursFee")=0
    if Session("AuBurswood169_DropoffAfterHourFeeID")<>0  then
           Set s_st=webConn.Execute("SELECT ID, Name, Fees,GST,StampDuty FROM ExtraFees WHERE (ID)='"&Session("AuBurswood169_DropoffAfterHourFeeID")&"' ")
           if s_st("Fees")  <>0 then
               AfterHoursFee=s_st("Fees")
               AfterHoursGST=s_st("GST")
               AfterHoursStampDuty=s_st("StampDuty")
               DropoffAfterHoursFeeID=s_st("ID")

            end if
            s_st.close
            SET s_st=nothing
            DropoffOpeningTime=(Session("AuBurswood169_RequestDropDate")&" "&Session("AuBurswood169_DropoffOfficeOpeningTime"))
            DropoffClosingTime=(Session("AuBurswood169_RequestDropDate")&" "&Session("AuBurswood169_DropoffOfficeClosingTime"))
            if (Session("AuBurswood169_RequestDropDateTime") < DropoffOpeningTime) or (Session("AuBurswood169_RequestDropDateTime") > DropoffClosingTime) THEN
                  Session("AuBurswood169_DropoffAfterHoursFee")=  AfterHoursFee
                  if AfterHoursGST="True" then
                        AfterHoursFeeGST=AfterHoursFeeGST+Session("AuBurswood169_DropoffAfterHoursFee")
                  end if
                  if AfterHoursStampDuty="True" then
                        AfterHoursFeeStampDuty=AfterHoursFeeStampDuty+Session("AuBurswood169_DropoffAfterHoursFee")
                  end if
            end if
      end if
      ' AfterHoursFee=   Session("AuBurswood169_PickupAfterHoursFee")+Session("AuBurswood169_DropoffAfterHoursFee") '---, for insert to table, 9 Jun  2012 removed to below
     ' Session("AuBurswood169_AfterHoursFee")=AfterHoursFee
      Session("AuBurswood169_AfterHoursFee") =  Session("AuBurswood169_PickupAfterHoursFee")+Session("AuBurswood169_DropoffAfterHoursFee")'--for total cost
      if Session("AuBurswood169_PickupAfterHoursFee")>0  and Session("AuBurswood169_DropoffAfterHoursFee")=0 then
                 '---insert AfterHours Fee to WebPaymentExtraFees table
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&Session("AuBurswood169_PickupAfterHoursFee")&",'"&Session("AuBurswood169_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("AuBurswood169_PickupAfterHoursFee")&",1,1)"
                  'Response.Write("<p>")
                  'Response.Write(SQL)
                  webConn.Execute(SQL)

        elseif Session("AuBurswood169_PickupAfterHoursFee")=0 and Session("AuBurswood169_DropoffAfterHoursFee")>0 then
                  '---insert AfterHours Fee to WebPaymentExtraFees table
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&Session("AuBurswood169_DropoffAfterHoursFee")&",'"&Session("AuBurswood169_OnlineBookingNo")&"',"&DropoffAfterHoursFeeID&","&Session("AuBurswood169_DropoffAfterHoursFee")&",1,1)"
               '  Response.Write("<p>")
                ' Response.Write(SQL)
                  webConn.Execute(SQL)
        elseif Session("AuBurswood169_PickupAfterHoursFee")>0 and Session("AuBurswood169_DropoffAfterHoursFee")>0 then
               if PickupAfterHoursFeeID=DropoffAfterHoursFeeID then
                  AfterHoursFee=   Session("AuBurswood169_PickupAfterHoursFee")+Session("AuBurswood169_DropoffAfterHoursFee")
                  SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                  SQL=SQL&"VALUES ("&AfterHoursFee&",'"&Session("AuBurswood169_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("AuBurswood169_PickupAfterHoursFee")&",1,2)"
               '  Response.Write("<p>")
                ' Response.Write(SQL)
                  webConn.Execute(SQL)
                else
                     SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                     SQL=SQL&"VALUES ("&Session("AuBurswood169_PickupAfterHoursFee")&",'"&Session("AuBurswood169_OnlineBookingNo")&"',"&PickupAfterHoursFeeID&","&Session("AuBurswood169_PickupAfterHoursFee")&",1,1)"
                      ' Response.Write("<p>")
                       'Response.Write(SQL)
                     webConn.Execute(SQL)
                    SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
                    '--bug fixSession("AuBurswood169_PickupAfterHoursFee") changed Session("AuBurswood169_DropoffAfterHoursFee")
                     SQL=SQL&"VALUES ("&Session("AuBurswood169_DropoffAfterHoursFee")&",'"&Session("AuBurswood169_OnlineBookingNo")&"',"&DropoffAfterHoursFeeID&","&Session("AuBurswood169_DropoffAfterHoursFee")&",1,1)"
                     '  Response.Write("<p>")
                     ' Response.Write(SQL)
                   webConn.Execute(SQL)
                end if
        end if
        Session("AuBurswood169_AfterHoursFee")=   Session("AuBurswood169_PickupAfterHoursFee")+Session("AuBurswood169_DropoffAfterHoursFee")


   '----Get TaxName 1  ----------------------
   Session("AuBurswood169_TaxName1") ="GST"
   Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='TAX1'  ")
   If not s_st.EOF then     
            Session("AuBurswood169_TaxName1") = s_st("syValue")
   END IF
   s_st.CLOSE
   SET s_st=NOTHING    

   '----get TaxName 2 --------------
    Session("AuBurswood169_TaxName2") ="Stamp Duty"
    Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='TAX2'  ")
    If not s_st.EOF then
               Session("AuBurswood169_TaxName2") = s_st("syValue")
    END IF
    s_st.CLOSE
    SET s_st=NOTHING   
        
'----GST Inclusive--------------------------------
   Set s_st=webConn.Execute("SELECT * FROM SystemTable WHERE Code='GSINC'  ")
   Session("AuBurswood169_GSTInclusive") = "Yes"
   If not s_st.EOF then     
            Session("AuBurswood169_GSTInclusive") = s_st("syValue")
   END IF
   s_st.CLOSE
   SET s_st=NOTHING 
      
          ' Response.Write(Session("AuBurswood169_GSTInclusive"))
      
END IF     %>





<%  if Request.QueryString("dir")="checkAge"  then
           if Session("AuBurswood169_OnlineBookingNo")="" then
            Response.Redirect "webBookingStep1.asp"
        end if
            DOBYear = CInt(Request.Form("DOBYear"))
            DOBMonth = (Request.Form("DOBMonth"))
      DOBDay  = CInt(Request.Form("DOBDay"))
      Session("AuBurswood169_DOB")= DOBDay&"/"&DOBMonth&"/"&DOBYear
                  if Day(Session("AuBurswood169_RequestPickDate"))=29 and MonthName(Month(Session("AuBurswood169_RequestPickDate")),3)="Feb"  then
         MinDOB= MonthName(Month(Session("AuBurswood169_RequestPickDate")),3)&"/"&(Day(Session("AuBurswood169_RequestPickDate"))-1)&"/"&(Year(Session("AuBurswood169_RequestPickDate"))-Session("AuBurswood169_MinimunAge"))
                  
        else
         MinDOB= MonthName(Month(Session("AuBurswood169_RequestPickDate")),3)&"/"&Day(Session("AuBurswood169_RequestPickDate"))&"/"&(Year(Session("AuBurswood169_RequestPickDate"))-Session("AuBurswood169_MinimunAge"))
           
         end if
              
            'MinDOB= MonthName(Month(Now),3)&"/"&Day(Now)&"/"&(Year(Now)-21) 
         
            '----check the Expiry Date
            LicYear = CInt(Request.Form("licensYear"))
            LicMonth = (Request.Form("licensMonth"))
            LicDay  = CInt(Request.Form("licensDay"))
            Session("AuBurswood169_LicExpDate") = LicDay&"/"&LicMonth&"/"&LicYear
            CurrentExpDate= Day(Date)&"/"&MonthName(Month(Date),3)&"/"&Year(Date)      
                 
            Session("AuBurswood169_FirstName")=tidyup(Request.Form("firstname"))
               Session("AuBurswood169_LastName")=tidyup(Request.Form("lastname"))
            Session("AuBurswood169_License")=tidyup(Request.Form("License"))
                  Session("AuBurswood169_address")=Request.Form("address")
         Session("AuBurswood169_city")=Request.Form("city")
                  Session("AuBurswood169_state")=Request.Form("state")
         Session("AuBurswood169_postcode")=Request.Form("postcode")
         Session("AuBurswood169_countryID")=Request.Form("countryID")
                 Session("AuBurswood169_CustomerEmail")=tidyup(Request.Form("CustomerEmail"))
         Session("AuBurswood169_phone")=tidyup(Request.Form("phone"))
                Session("AuBurswood169_fax")=Request.Form("fax")
         Session("AuBurswood169_Notes")=Request.Form("Notes")
             Session("AuBurswood169_Flight")=tidyup(Request.Form("Flight"))
      Session("AuBurswood169_Flightout")=tidyup(Request.Form("Flightout"))
      Session("AuBurswood169_Mobile")=tidyup(Request.Form("Mobile"))

                 if Session("AuBurswood169_LastName")="" or Session("AuBurswood169_CustomerEmail")="" then
                          Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* Please enter Renter Information.")
               elseif Request.Form("submit1")="Request Booking" and Request.Form("DOBYear")="1900" then
                        Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* Please enter your DOB.")
                 elseif  Request.Form("submit1")="Request Booking" and IsDate(Session("AuBurswood169_DOB"))<>"True"  then
                  Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* The DOB date "&Session("AuBurswood169_DOB")&" does not exit.")
            elseif Request.Form("submit1")="Request Booking" and  IsDate(Session("AuBurswood169_LicExpDate")) <>"True"  then
                  Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* The License Expiry Date "&Session("AuBurswood169_LicExpDate")&" does not exit.")
         elseif Request.Form("submit1")="Request Booking" and  (DateValue(Session("AuBurswood169_LicExpDate")) - DateValue(CurrentExpDate)< 0) then
                  Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* The License Date "&Session("AuBurswood169_LicExpDate")&" is Expired.")
               
                  elseif Request.Form("submit1")="Request Booking" and  (Session("AuBurswood169_MinimunAge")<>0 and (DateValue(MinDOB) - DateValue(Session("AuBurswood169_DOB")))< 0 ) then
                     Response.Write("<p><center><span class=red>&nbsp;&nbsp;&nbsp;* Vehicles are not available for hire to drivers under "&Session("AuBurswood169_MinimunAge")&" years of age.")
         else 
            
                  Set s_c=webConn.Execute("SELECT * FROM Country where (ID)='"&Request.Form("countryID")&"' " )
                         Session("AuBurswood169_country")=s_c("Country")
                         s_c.close
                         Set s_c=nothing
             
             
                 
                  SQL="UPDATE WebReservation SET "
                  SQL=SQL&" KmsFree ="&Session("AuBurswood169_KmsFree")&",  "
                   SQL=SQL&" AddKmsFee ="&Session("AuBurswood169_AddKmsFee")&",  "
                  SQL=SQL&" Notes ='"&Left(tidyup(Request.Form("Notes")),250)&"',  "
                  SQL=SQL&" Phone ='"&Left(tidyup(Request.Form("phone")),20)&"' , "
                  SQL=SQL&" Email ='"&Left(tidyup(Request.Form("CustomerEmail")),50)&"',  "
                  SQL=SQL&" Name ='"&Left(tidyup(Request.Form("lastname")),30)&"'  "
                  SQL=SQL&"WHERE (ReservationNo) ='"&Session("AuBurswood169_OnlineBookingNo")&"'"
                  webConn.Execute(SQL) 
                  Response.Write(SQL)
                
                        if Request.Form("submit1")="Request Booking" then
                              Response.Redirect "webBookingStep5.asp"
                     else
                           Response.Redirect "webBookingStep6.asp?dir=quote"
                     end if
            end if
         
            
                
end if     %>
   <TABLE  width=960 bgcolor=#FFFFFF align=center  cellSpacing=0 cellPadding=1  border=0><tr><td>
   <TABLE width=500 align=center  cellSpacing=0 cellPadding=2  border=0>
   <tr height=30><td  align=center class=header bgColor=#00509F colspan=4>STEP 4 - Confirm Quote & Enter Personal Information</td></tr>
    
    <%   '----------the form
    'Response.Write("<form method=post action='webBookingStep3.asp?dir=checkAge'  name='emailbooking'  onsubmit='return Validate(this)'>")   
          Response.Write("<form method=post action='webBookingStep4.asp?dir=checkAge'  name='theForm'  onSubmit='return Validate();'>")
      
            Response.Write("<tr><td></td><td width=""120"" align=left class=text>Pickup Location:</td><td align=left class=text colspan=2> ")
                        Response.Write(Session("AuBurswood169_PickupLocation"))
                        Response.Write("</td></tr>")
                       
                        Response.Write("<tr><td></td><td align=left class=text>Pickup Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("AuBurswood169_RequestPickDate")))&", ")
                        'Response.Write(Session("AuBurswood169_RequestPickDateTime"))
                        Response.Write(Day(Session("AuBurswood169_RequestPickDate"))&"/"&Left(MonthName(Month(Session("AuBurswood169_RequestPickDate"))),3)&"/"&Year(Session("AuBurswood169_RequestPickDate")))
                        Response.Write("&nbsp;")
                        Response.Write(Session("AuBurswood169_RequestPickTime"))
                        Response.Write("</td></tr>")
                        
                        if Session("AuBurswood169_Flight")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Arrival FLT: </td><td align=left class=text colspan=2>")
                        Response.Write(Session("AuBurswood169_Flight"))
                        Response.Write("</td></tr>")
                        end if
                        
                        Response.Write("<tr><td></td><td align=left class=text>Return Location: </td><td align=left class=text colspan=2>")
                        Response.Write(Session("AuBurswood169_DropoffLocation"))
                        Response.Write("</td></tr>") 
                       
                      
                        Response.Write("<tr><td></td><td align=left class=text>Return Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("AuBurswood169_RequestDropDate")))&", ")
                         'Response.Write(Session("AuBurswood169_RequestDropDateTime"))
                        Response.Write(Day(Session("AuBurswood169_RequestDropDate"))&"/"&Left(MonthName(Month(Session("AuBurswood169_RequestDropDate"))),3)&"/"&Year(Session("AuBurswood169_RequestDropDate")))
                        Response.Write("&nbsp;")
                        Response.Write(Session("AuBurswood169_RequestDropTime"))
                       
                        Response.Write("</td></tr>")
                      
                       if Session("AuBurswood169_Flightout")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Departure FLT:</td><td align=left class=text colspan=2>")
                        Response.Write(Session("AuBurswood169_Flightout"))
                        Response.Write("</td></tr>")
                       end if 
                       
                        if Session("AuBurswood169_Mobile")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Mobile Phone No.:</td><td align=left class=text colspan=2>")
                        Response.Write(Session("AuBurswood169_Mobile"))
                        Response.Write("</td></tr>")
                       end if 
                       
   '---Vehicle Type---------- 
       Response.Write("<tr><td></td><td align=left class=text>Vehicle Type: </td><td align=left class=text>"&Session("AuBurswood169_CarType")&"</td><td align=left class=text align=right></td></tr>")
       
      '---Vehicle Type----------
      
         
       Response.Write("<tr><td></td><td align=left class=text> </td><td class=text><img src='"&theimage&"'  WIDTH=100 ></td><td class=text align=right></td></tr>")
      
    
   '-------------Rate -----------------       
    if Request.QueryString("dir")="Rate"  then
        '---------if  from step3, do all calculation ----
          'Response.Write("<br>")
          'Response.Write(SQL)
          webConn.Execute("DELETE  FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"' ")
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
                Session("AuBurswood169_DiscountRate")=0
            Session("AuBurswood169_DiscountID")=0
            Session("AuBurswood169_DiscountType")="p"
            Session("AuBurswood169_DiscountName")=""
                 SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
            SQL=SQL&" AND WebItems=1 "
            SQL=SQL&" AND (CarSizeID)='"&Request.Form("CarSizeID")&"' "
            SQL=SQL&" AND DateRange=1 "
            SQL=SQL&" AND DateFrom<='"&Session("AuBurswood169_RequestPickDate")&"' and DateTo>='"&Session("AuBurswood169_RequestDropDate")&"' "
            Set s_disDate=webConn.Execute(SQL)  
            if  NOT s_disDate.EOF then    '---rental period in the discount date range and specific category apply
               if s_disDate("DiscountRate")>0 then
                              Session("AuBurswood169_DiscountName")=s_disDate("DiscountName")
                     Session("AuBurswood169_DiscountType")=s_disDate("DiscountType")
                        Session("AuBurswood169_DiscountRate")=s_disDate("DiscountRate")
                        Session("AuBurswood169_DiscountID")=s_disDate("ID")
                  end if
             else     '--specific category apply but Date Range not apply
                     SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
               SQL=SQL&" AND WebItems=1 "
               SQL=SQL&" AND (CarSizeID)='"&Request.Form("CarSizeID")&"' "
               SQL=SQL&" AND DateRange=0 "
               Set s_disCat=webConn.Execute(SQL)  
               if NOT s_disCat.EOF then  
                  if s_disCat("DiscountRate")>0 then  
                     Session("AuBurswood169_DiscountName")=s_disCat("DiscountName")
                     Session("AuBurswood169_DiscountType")=s_disCat("DiscountType")
                        Session("AuBurswood169_DiscountRate")=s_disCat("DiscountRate")
                        Session("AuBurswood169_DiscountID")=s_disCat("ID")
                        end if
                   else  '--check if Daterange apply to all Category
                        SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
                  SQL=SQL&" AND WebItems=1 "
                  SQL=SQL&" AND CarSizeID=0 " 
                  SQL=SQL&" AND DateRange=1 "
                        SQL=SQL&" AND DateFrom<='"&Session("AuBurswood169_RequestPickDate")&"' and DateTo>='"&Session("AuBurswood169_RequestDropDate")&"' "
                  Set s_dis3=webConn.Execute(SQL)  
                  if NOT s_dis3.EOF then  
                           if s_dis3("DiscountRate")>0 then 
                                    Session("AuBurswood169_DiscountName")=s_dis3("DiscountName")
                              Session("AuBurswood169_DiscountType")=s_dis3("DiscountType")
                                    Session("AuBurswood169_DiscountRate")=s_dis3("DiscountRate")
                              Session("AuBurswood169_DiscountID")=s_dis3("ID")
                              end if
                        else '--location discount
                           SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
                           SQL=SQL&" AND WebItems=1 "
                     SQL=SQL&" AND CarSizeID=0 " 
                     SQL=SQL&" AND DateRange=0 "
                     Set s_dis=webConn.Execute(SQL)  
                     if NOT s_dis.EOF then  
                           if s_dis("DiscountRate")>0 then 
                              Session("AuBurswood169_DiscountName")=s_dis("DiscountName")
                                 Session("AuBurswood169_DiscountType")=s_dis("DiscountType")
                                       Session("AuBurswood169_DiscountRate")=s_dis("DiscountRate")
                                 Session("AuBurswood169_DiscountID")=s_dis("ID")
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
                  SQL=SQL&"AND CarRateStructureID="&Session("AuBurswood169_RateStructureID"&i&"")&" "
                  SQL=SQL&"AND (SeasonID)='"&Session("AuBurswood169_SeasonID"&i&"")&"' "
                'SQL=SQL&"AND (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
                  'Response.Write(SQL)
                Set s_m=webConn.Execute(SQL)
                 if NOT s_m.EOF   then   
                          'if s_m("Rate")>0 then 
                                 if Session("AuBurswood169_DiscountType")="p" then
                                    Rate=s_m("Rate")*(1-(Session("AuBurswood169_DiscountRate")/100))
                              else
                                 Rate=s_m("Rate")-Session("AuBurswood169_DiscountRate")
                              end if
                              StandardRate=s_m("Rate")
                              '=================
                              if Request.Form("SeasonCount")=1 then
                                 if Session("AuBurswood169_NoOfDaysEachSeason"&i&"")<1 then
                                       Session("AuBurswood169_NoOfDaysEachSeason"&i&"")=1
                                 end if
                              end if
                              '===================
                              costEachSeason=Rate*Session("AuBurswood169_NoOfDaysEachSeason"&i&"")
                           'end if
                 end if 
                 s_m.close
                 set s_m=nothing
            
            RentalCost=RentalCost+costEachSeason
                
                        
                '--insert rate to WebPaymentDetail table
                 '--get each season record from the form and insert to paymentdetailes table 
  
                '---insert to the PaymentDetail table
                  SQL="INSERT INTO WebPaymentDetail (DiscountID,DiscountName,DiscountType,DiscountPerc,StandardRate,Rate,ReservationNo,SeasonID,Days,RateName)" 
                  SQL=SQL&"VALUES ("&Session("AuBurswood169_DiscountID")&",'"&tidyup(Session("AuBurswood169_DiscountName"))&"','"&(Session("AuBurswood169_DiscountType"))&"',"&Session("AuBurswood169_DiscountRate")&",'"&StandardRate&"','"&Rate&"','"&Session("AuBurswood169_OnlineBookingNo")&"','"&Request.Form("SeasonID"&i&"")&"','"&NoOfDaysEachSeason&"','"&Request.Form("RateName"&i&"")&"')"
               'Response.Write("<br>") 
            'Response.Write(SQL)
               webConn.Execute(SQL) 
            
   NEXT           
        
     
      
      TotalCost=RentalCost+Session("AuBurswood169_RelocationFee")+Session("AuBurswood169_AfterHoursFee")
    
     
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
                              if CCur(Request.Form("Maxprice"&j&""))>0 and Session("AuBurswood169_TotalRentalDays")*Request.Form("ExtraFees"&j&"")>CCur(Request.Form("Maxprice"&j&"")) then
                                          EachExtraFees=Request.Form("Maxprice"&j&"")*Request.Form("QTY"&j&"")
                                       ExtraFeesRate=Request.Form("Maxprice"&j&"")
                                       ExtraFeesNoDays=1
                                       ExtraType="Fixed" 
                                       SetMaxPrice=1
                                 else 
                                       EachExtraFees=Session("AuBurswood169_TotalRentalDays")*Request.Form("ExtraFees"&j&"")*Request.Form("QTY"&j&"")
                                       ExtraFeesNoDays=Session("AuBurswood169_TotalRentalDays")
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
               SQL=SQL&"VALUES ("&EachExtraFees&","&SetMaxPrice&",'"&Request.Form("QTY"&j&"")&"','"&Session("AuBurswood169_OnlineBookingNo")&"','"&Request.Form("ExtraFeesID"&j&"")&"','"&ExtraFeesRate&"','"&ExtraFeesNoDays&"')"

                     webConn.Execute(SQL) 
                        
                end if    
     NEXT
     TotalCost=TotalCost+TotalExtraFees
     
    
    
    
     '-----Insurance Fee------------    
        InsuranceFee=0
        Session("AuBurswood169_InsuranceFee")=0
        GSTInsurance=0 
        StampInsurance=0
         if Request.Form("InsuranceID")<>"" then
                 Session("AuBurswood169_InsuranceID")=Request.Form("InsuranceID")
                SQL="SELECT * from ExtraFees WHERE (ID)='"&Request.Form("InsuranceID")&"' "
                 Set s_insu=webConn.Execute(SQL)
            if NOT s_insu.EOF  then
                     'InsuranceFee=s_insu("Fees") 
                     Session("AuBurswood169_InsuranceFee")=s_insu("Fees")  '--for pass to step5
                   
                     if s_insu("Type")="Daily" then
                           InsuranceFee=Session("AuBurswood169_TotalRentalDays")*s_insu("Fees")
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
               SQL=SQL&"VALUES ("&InsuranceFee&",1,'"&Session("AuBurswood169_OnlineBookingNo")&"',"&s_insu("ID")&","&s_insu("Fees")&",'"&Session("AuBurswood169_TotalRentalDays")&"')"
                   'Response.Write("<br>") 
                         'Response.Write(SQL)
                     webConn.Execute(SQL) 
                 end if
                s_insu.close
            SET s_insu=Nothing
         end if
        'Session("AuBurswood169_InsuranceFee")=InsuranceFee
      TotalCost=TotalCost+ InsuranceFee
   
        
   
         '-------------KmsFree per day -----------------
             KmsMaxcharge=0
        KmsDailyRate=0  
        AddKmsFee=0 
        KmsFree=0 
        Session("AuBurswood169_KmsFree") =0
        Session("AuBurswood169_AddKmsFee") =0
                
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
         SQL="SELECT ExtraFees.* FROM ExtraFees4Holiday,ExtraFees WHERE eh_ExtraFeeID=ExtraFees.ID and (eh_HolidayDate='"&Session("AuBurswood169_RequestPickDate")&"' and  eh_LocationID='"&Session("AuBurswood169_PickupLocationID")&"')  "
         'Response.Write(SQL)
       Set s_ex=webConn.Execute(SQL)
       HolidayPickupExtraID=0
       HolidayChargeQty=0
       if NOT s_ex.EOF THEN
               HolidayPickupExtraID=s_ex("ID")
               HolidayChargeQty=1
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days)"
               SQL=SQL&"VALUES ("&s_ex("Fees")&",'"&Session("AuBurswood169_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"',1)"
                'Response.Write("<br>")
                'Response.Write(SQL)
               webConn.Execute(SQL)
               TotalCost=TotalCost+ s_ex("Fees")
      end if
      s_ex.close
      Set s_ex=Nothing

      '--check Holiday Charges for dropoff  from table HolidayextraFees
       SQL="SELECT ExtraFees.*  FROM ExtraFees4Holiday,ExtraFees WHERE   eh_ExtraFeeID=ExtraFees.ID and (eh_HolidayDate='"&Session("AuBurswood169_RequestdropDate")&"' and  eh_LocationID='"&Session("AuBurswood169_DropoffLocationID")&"') "
       'Response.Write(SQL)
       Set s_ex=webConn.Execute(SQL)
       HolidayDropoffExtraID=0
       if NOT s_ex.EOF THEN
              HolidayDropoffExtraID=s_ex("ID")
               HolidayChargeQty=1
               if  HolidayDropoffExtraID=HolidayPickupExtraID  then
                  HolidayChargeQty=2
                  webConn.Execute("DELETE  FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"' and ExtraFeesID='"&s_ex("ID")&"' ")

               end if
               SQL="INSERT INTO WebPaymentExtraFees(ExtraValue,ReservationNo,ExtraFeesID,Fees,Days,QTY)"
               SQL=SQL&"VALUES ("&(s_ex("Fees")*HolidayChargeQty)&",'"&Session("AuBurswood169_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"',1,'"&HolidayChargeQty&"')"
                'Response.Write("<br>")
                'Response.Write(SQL)
                  TotalCost=TotalCost+ s_ex("Fees")
               webConn.Execute(SQL)
      end if
      s_ex.close
      Set s_ex=Nothing
          '----------------END check Holiday Charges for pickup  from table HolidayextraFees  ---------------------


 
       '-------------Web Mandatory Extra fees-----------------
     'SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("AuBurswood169_PickupLocationID")&"' or LocationID=0) and WebItems=1 and Mandatory=1 AND inUse=1 and PercentageTotalCost=0 and MerchantFee=0 order by Type,Name"
     SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("AuBurswood169_PickupLocationID")&"'  or LocationID=0) "
         SQL=SQL&" AND (VehicleSizeID='"&Session("AuBurswood169_CarSizeID")&"' or VehicleSizeID=0) "
       SQL=SQL&" and WebItems=1 and InsuranceExtra=0  and Mandatory=1 AND inUse=1 and PercentageTotalCost=0 and MerchantFee=0 order by Type,Name"
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
                      ' MandatoryExtraFeesNoDays=Fix(Session("AuBurswood169_TotalRentalDays"))+1
                  'end if    
                  '---daily fees always use   Session("AuBurswood169_TotalRentalDays") (fixed number)
                  MandatoryExtraFeesNoDays=Session("AuBurswood169_TotalRentalDays")
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
            SQL=SQL&"VALUES ("&EachMandatoryExtraFees&",'"&Session("AuBurswood169_OnlineBookingNo")&"','"&s_ex("ID")&"','"&s_ex("Fees")&"','"&MandatoryExtraFeesNoDays&"')"
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
   Set s_st=webConn.Execute("SELECT * FROM QStampDuty WHERE ID="&Session("AuBurswood169_PickupLocationID")&"  ")
   If not s_st.EOF then
      StampDutyRate=s_st("StampDuty")/100 
        GSTRate= s_st("GSTRate")/100  
  end if
  s_st.close
  set s_st=nothing  

'----Stamp Duty calculation------------------------------------
  StampDuty=0
  Session("AuBurswood169_StampDuty")=0
  if StampDutyRate>0 then  '--if StampDutyRate=0 then no Stampduty applied
        '---stampduty is the revenues less GST times Stampduty rate
        '--- GSTInclusive means stampduty caclutations use Revenue less GST
        '--- Not GSTInclusive means, Revenues do not include GST
        if Session("AuBurswood169_GSTInclusive") = "Yes"  then
               StampDuty=StampDutyRate*(RentalCost+ RelocationFeeStampDuty + AfterHoursFeeStampDuty + ExtraStamp + MandatoryextraStamp +StampInsurance)*(1-GSTRate) 
        else
                StampDuty=StampDutyRate*(RentalCost + RelocationFeeStampDuty + AfterHoursFeeStampDuty + ExtraStamp+ MandatoryextraStamp + StampInsurance)
        end if
        StampDuty=Round(StampDuty,2)               
        Session("AuBurswood169_StampDuty")=StampDuty
 end if 
'----GST calculation------------------------------------
 GST=0 
 Session("AuBurswood169_GST")=0
 if GSTRate>0 then  '--if GSTRate=0 then no GST applied
        if Session("AuBurswood169_GSTInclusive") = "Yes"  then
                GST=(RentalCost + AfterHoursFeeGST + RelocationFeeGST + ExtraGST+ MandatoryExtraGST+ GSTInsurance)*(1-100/(100+GSTRate*100)) 
                
        else
               GST=(RentalCost + AfterHoursFeeGST + RelocationFeeGST + ExtraGST+ MandatoryExtraGST + GSTInsurance)*GSTRate 
        end if
        GST=Round(GST,2)                 
       Session("AuBurswood169_GST")=GST
end if 

'--insert GST and StampDuty to WebReservation table 
              
        '----STAMPDUTY GST diferent layout------------------------------------  
        SubTotal=0
        if Session("AuBurswood169_GSTInclusive") = "Yes"  then
                  TotalCost=StampDuty+ TotalCost
           
               
                              '-------------Web Mandatory MerchantFee or airport fees-----------------              
         SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("AuBurswood169_PickupLocationID")&"' or LocationID=0) and WebItems=1 and Mandatory=1 AND inUse=1 and (PercentageTotalCost=1 or MerchantFee=1) and Type='Percentage' order by percentageTotalCost,MerchantFee,Name"
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
    Session("AuBurswood169_TotalEstimateofCharges")=TotalCost
   
    END IF
    
    '---------display all rates and fees here
         Set s_rate=webConn.Execute("SELECT WebPaymentDetail.*,Season FROM WebPaymentDetail,Season WHERE (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"' and  SeasonID = Season.ID ")
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
                Response.Write("<td align=right class=text>"&s_rate("Days")&" Days @ AU"&FormatCurrency(s_rate("Rate"),2)&"</td><td class=text align=right>"&FormatCurrency(costEachSeason,2)&"</td></tr>")
              
        s_rate.MoveNext 
   Wend
   s_rate.Close
   Set l_s=nothing 
      
         if  Session("AuBurswood169_KmsDesc")<>"" then
                  Response.Write("<tr><td></td><td align=left colspan=3 class=text>"&Session("AuBurswood169_KmsDesc")&" ")
                   if Session("AuBurswood169_KmsCost")<>0 then
                  Response.Write FormatCurrency(Session("AuBurswood169_KmsCost"),2)
                  end if
                   Response.Write("</td></tr>")
         end if
          
          '--- extra fees
        Set s_extra=webConn.Execute("SELECT WebPaymentExtraFees.*, Name, Type,PayAgency FROM WebPaymentExtraFees, ExtraFees WHERE  (ReservationNo)='"&Session("AuBurswood169_OnlineBookingNo")&"' and ExtraFeesID = ExtraFees.ID ORDER BY TYPE, NAME ")
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
                        if s_extra("SetMaxPrice")  =True then
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
        if  Session("AuBurswood169_StampDuty") >0 then
                Response.Write("<tr><td></td><td class=text  colspan=2  align=left>"&Session("AuBurswood169_TaxName2")&"</td>")
                Response.Write("<td  align=right class=text>"&FormatCurrency(Session("AuBurswood169_StampDuty"),2)&"</td></tr>")
        end if 
        Response.Write("<tr><td></td><td class=text  colspan=2  align=left>GST</td>")
        Response.Write("<td  align=right class=text>"&FormatCurrency(Session("AuBurswood169_GST"),2)&"</td></tr>")
        Response.Write("<tr><td colspan=4 height=1 bgcolor=#999999></td></tr>")
         Response.Write("<tr><td></td><td align=left class=text colspan=2><b>Total Estimate of Charges</td><td class=text align=right><b>AU"&FormatCurrency(Session("AuBurswood169_TotalEstimateofCharges"),2)&"</td></tr>")
            
                
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
 <table width="960" border="0" align="center" cellpadding="10" cellspacing="0">
   <tr>
     <td align="left" valign="top"><p>&copy; 2009 Burswood Car Rentals</p></td>
     <td align="left" valign="top"><p>Head Office and Depot:<br />
       Burswood Car Rentals<br />
       54B Shepperton Road, Victoria Park, <br />
       Perth, Western Australia 6100</p>
     <p><a href="http://www.burswoodcarrentals.net.au/terms-conditions/">Terms &amp; Conditions</a></p></td>
     <td align="left" valign="top"><p><strong>Telephone: (08) 9362 4777</strong><br />
       Facsimile: (08) 9362 4877<br />
       International Dial: 0011 61 8 9362 4777<br />
       Freecall Australia Wide: 1800 624 810 </p></td>
   </tr>
 </table>
 <!-- Footer ends here -->
</body></html>  

