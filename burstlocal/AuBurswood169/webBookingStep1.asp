<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<!-- Copyright 2003-2006 GMH SYSTEMS LTD  -->
<!-- Product Development - Rental Car Manager  ( www.rentalcarmanager.com )  -->
<!--  All Rights Reserved  -->
<!--  This product and related documentation is protected by copyright and   -->
<!--  distributed under license restricting its use, copying, distribution  -->
<!--  and decompilation. No part of this product or related documentation may  -->
<!--  reproduced in any form by any means without prior written consent of -->
<!--  GMH Systems LTD  -->
<!--  For more information contact support@rentalcarmanager.com -->
<STYLE TYPE="text/css">
.white {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }
.text  {  font-family: Arial;font-size: 9pt;color: #666666; font-weight: bold;}
.red  {  font-family: Arial;font-size: 9pt;color: red; }
.formtext {  font-family: Arial;font-size: 9pt;color: #666666; font-weight: bold; }
.header {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }
SELECT {   font-family: Arial;font-size: 9pt;color: #666666; font-weight: bold;}
.button {   font-family: Arial;font-size: 9pt;color: #666666; }
input  {   font-family: Arial;font-size: 9pt;color: #666666; }

</STYLE>
 <script Language="JavaScript">
<!--
function Validate()
{

  if (document.theForm.PickupLocationID.value == "0")
  {      alert("Please select pickup location.");
      document.theForm.PickupLocationID.focus();
      return (false);
  }

  if (document.theForm.DropoffLocationID.value == "0")
  {      alert("Please select dropoff location.");
      document.theForm.DropoffLocationID.focus();
      return (false);
  }


return (true);

}
//-->
</script>
 <link href="burbook.css" rel="stylesheet" type="text/css" />
      <body>
<%   
     
        Session.Timeout = 30

      'https://secure20.rentalcarmanager.com.au/ssl/Australiawide71/AuBurswood169/webBookingStep1.asp
       '----------connect RCM Database---------------------  
         CompanyCode="Australiawide71"
        DatabaseFile="Australiawide71"

        Dim webConn     'webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

         webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"

     
    FUNCTION tidyup(thisString)
   tidyup=LTrim(RTrim(Replace(thisString, "'" , "''")))
END FUNCTION    
       
SUB SelectPickupLocation
      Response.Write("<SELECT name=PickupLocationID >")
         'Set l_s = webConn.Execute("SELECT WebDefault,Location,Location.ID FROM Location,State WHERE PickupAvailable=1 and StateID=State.ID and Location.ID <>117 order by Mobile")
      '---May 2013, hard-code the Burswood steps to ONLY use Locations that start with an * .  Note that these will all be changed so that they say Pickup=No, Dropoff=No so they aren't included on Australia Wide steps

      Set l_s = webConn.Execute("SELECT Location,Location.ID FROM Location WHERE  left(Location, 1)='*' ")
         Response.Write("<option value='0' selected>--PLEASE SELECT LOCATION--</option>")
         Response.Write("<option value='0' >--------------------</option>")
            While Not l_s.EOF
               if CStr(l_s("ID"))=Session("AuBurswood169_PickupLocationID")  then
                           Response.Write("<option value='"&l_s("ID")&"' selected>"&l_s("Location")&" &nbsp;</option>")
               else
                  Response.Write("<option value='"&l_s("ID")&"' >"&l_s("Location")&" &nbsp;</option>")
               end if
        l_s.MoveNext 
         Wend
         l_s.Close
         Set l_s=nothing
        Response.Write("</td></select>") 
END SUB 

SUB SelectDropoffLocation
   Set l_s = webConn.Execute("SELECT  Location,Location.ID FROM Location WHERE  left(Location, 1)='*'")
       Response.Write("<SELECT name='DropoffLocationID' >")
              Response.Write("<option value='0' selected>--PLEASE SELECT LOCATION--</option>")
         Response.Write("<option value='0' >--------------------</option>")
              ' Response.Write("<option value='Same' >--SAME AS PICKUP LOCATION--</option>")
               While Not l_s.EOF

                        if CStr(l_s("ID"))=Session("AuBurswood169_DropoffLocationID")  then
                              Response.Write("<option value='"&l_s("ID")&"' selected>"&l_s("Location")&" &nbsp;</option>")
                     else
                              Response.Write("<option value='"&l_s("ID")&"' >"&l_s("Location")&" &nbsp;</option>")
                     end if
           l_s.MoveNext
            Wend
            l_s.Close
      Set l_s=nothing
         Response.Write("</select>") 
END SUB 

SUB TheQutoationForm
     
            
         
          if Session("AuBurswood169_RequestPickTime")<>"" then
                 defaultPickupTime= Session("AuBurswood169_RequestPickTime")
         else
                 defaultPickupTime="9:00"
         end if
         
         if Session("AuBurswood169_RequestDropTime")<>"" then
                defaultDrpoffTime= Session("AuBurswood169_RequestDropTime")
         else
                defaultDrpoffTime="09:00"
         end if    
            
          
         if Session("AuBurswood169_RequestPickDate")<>"" then
                defaultPickupDate = Session("AuBurswood169_RequestPickDate")
          else
                defaultPickupDate=Date+3
         end if     
                                  
         if Session("AuBurswood169_RequestDropDate")<>"" then
                defaultDropoffDate = Session("AuBurswood169_RequestDropDate")
        else
                defaultDropoffDate=Date+6
         end if    

       


%>                                  
            


<!-- Banner starts here -->
<table width="748" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"><img src="graphics/burswood-car-rental-banner.jpg" alt="Burswood Car Rentals" name="cars" width="960" height="187" border="0" usemap="#carsMap" id="cars" /></td>
  </tr>
</table>
<!-- Banner ends here -->
<!-- Order steps start here -->
<table class="egg" width="960" border="0" align="center" cellpadding="0" cellspacing="0">
<tr align="left" valign="top">
          <td width="45%" height="80" align="left" valign="top">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="35">&nbsp;</td>
              <td><img src="graphics/1-dates.gif" alt="Select Pick-up  Location and Hire Dates" width="61" height="75" vspace="20" /></td>
              <td><img src="graphics/2-vehicle.gif" alt="Select Vehicle" width="77" height="75" /></td>
              <td><img src="graphics/3-quote.gif" alt="Review Car Rental Estimate" width="75" height="75" /></td>
              <td><img src="graphics/4-purchase.gif" alt="Car Rental Purchase Details" width="76" height="75" /></td>
              <td><img src="graphics/5-confirm.gif" alt="Car Rental Booking Confirmation" width="62" height="75" border="0" /></td>
            </tr>
          </table></td>
    <td align="left" valign="middle"><a href="index.html"></a><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','home','',1)" onmouseover="MM_nbGroup('over','home','images/homed.gif','',1)" onmouseout="MM_nbGroup('out')"></a><img src="graphics/hd-choose-dates.gif" alt="Choose your dates &amp; location" width="278" height="75" border="0" /></td>
  </tr>
</table>
<!-- Order steps end here -->
 

 


<!-- RCM HTML CODE-----------> 

<TABLE align=center width="960" cellSpacing=0 cellPadding=0  border=0>


<tr><td >  <table width="960" align="center" cellpadding="0" cellspacing="0" class="egg">
    <tr><td width="50">

      <p>&nbsp;</p></td><td width="50%" align="left" valign="top">

   <TABLE  width=400   bgcolor=#233A32  cellSpacing=0 cellPadding=1  border=0>
     <tr><td>
   <TABLE width=100%  bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>
 <form method=Post action='webbookingstep2.asp' name='theForm'  onSubmit='return Validate();'>

         <TR height=20 bgColor=#00509F><td colspan=3 align=center bgcolor="#00509F" class=header>STEP 1 - Enter Your Booking Details</td>
         </tr>
      <%     if Session("AuBurswood169_ErrorMesage")<>"" then
         Response.Write("<tr><td></td><td></td><td class=red><b>* "&Session("AuBurswood169_ErrorMesage")&"</td></tr>")
             
      end if     
      Session("AuBurswood169_ErrorMesage")=""
      %>  <tr><td></td>
       <td CLASS=text align=left><font color=red>*</font>Pickup Location:</td>
        <td CLASS=text align=left>
       <%    SelectPickupLocation  %>       </td></tr>
      
      <tr><td></td>
       <td CLASS=text align=left><font color=red>*</font>Pickup Date:</td>
       <td CLASS=text align=left><table border=0 cellspacing=0 cellpadding=0><tr><td CLASS=text align=left>
               <SELECT name=PickupDay>
           <%  for pd=1 to 31       
                  if pd=Day(defaultPickupDate ) then
                        Response.Write("<option value='"&pd&"' selected>"&pd&"</option>")
                  else
                  Response.Write("<option value='"&pd&"'>"&pd&"</option>")
                  end if
          next                         
           %>     </SELECT></td>
            <td CLASS=text ><SELECT name=PickupMonth>
            <%    for pm=1 to 12 
                                 theMonth=Left(MonthName(pm),3)
                     if pm=Month(defaultPickupDate ) then 
                  
                       Response.Write("<option value='"&theMonth&"' selected>"&theMonth&"</option>")
                  else     
                  Response.Write("<option value='"&theMonth&"'>"&theMonth&"</option>")
                  end if
          next                      
           %>  </SELECT>         </td>
       
            <td CLASS=text>   <SELECT name=PickupYear>
             <%   for theYear=(Year(Date)) to (Year(Date)+2)
                if   theYear=Year(defaultPickupDate)  then
                               Response.Write("<option value='"&theYear&"' selected>"&theYear&"</option>")
                     else
                           Response.Write("<option value='"&theYear&"'>"&theYear&"</option>")
                     end if
                next
 %>  </SELECT></td>
                 <td class=text>&nbsp;&nbsp;<SELECT name=PickupTime>
                         <option value='00:00' >midnight</option>
                        <option value='00:30' >12:30 AM</option>
                        <%
                        for i=1 to 23
                           for j=1 to 2
                              if j=1  then
                                 min="00"
                               else
                                 min="30"
                               end if
                               if  i<12 then
                                 test=i&":"&min&" AM"
                                 if i<10 then
                                     theTime="0"&i&":"&min
                                 else
                                       theTime=i&":"&min
                                 end if
                               else
                                 test=i&":"&min&" PM"
                                 theTime=i&":"&min
                               end if

                               'if   Hour(Time)= (i-1) AND  min="00"  then
                               if   theTime = defaultDrpoffTime then
                                 Response.Write("<option value='"&theTime&"' selected>"&test&"</option>")
                               else
                                 Response.Write("<option value='"&theTime&"' >"&test&"</option>")
                               end if
                           next
                        next
                %>
      </SELECT></td></tr></table>      </td>
        </tr>
       
   <tr><td></td>
       <td CLASS=text align=left><font color=red>*</font>Return Location:</td>
       <td CLASS=text align=left>    
      <%   SelectDropoffLocation    '--Subs         %>      </td></tr>
       
       <tr><td></td> 
       <td CLASS=text align=left><font color=red>*</font>Return Date:</td>
       <td CLASS=text align=left>
       <table border=0 cellspacing=0 cellpadding=0><tr><td CLASS=text align=left><SELECT name=DropoffDay>
       <%  for d=1 to 31       
                  if d=Day(defaultDropoffDate) then
                        Response.Write("<option value='"&d&"' selected>"&d&"</option>")
                  else
                  Response.Write("<option value='"&d&"'>"&d&"</option>")
                  end if
          next                      
           %>  </SELECT></td>
       <td CLASS=text><SELECT name=DropoffMonth>
       <%   for pm=1 to 12 
                                 theMonth=Left(MonthName(pm),3)
                     if pm=Month(defaultDropoffDate) then 
                  
                       Response.Write("<option value='"&theMonth&"' selected>"&theMonth&"</option>")
                  else     
                  Response.Write("<option value='"&theMonth&"'>"&theMonth&"</option>")
                  end if
            next  
           %>  </SELECT></td>
       
   <td CLASS=text>   <SELECT name=DropoffYear>
        <%  for theYear=(Year(Date)) to (Year(Date)+1)

                             if theYear=Year(defaultDropoffDate) then
                                 Response.Write("<option value='"&theYear&"' Selected>"&theYear&"</option>")
                           else
                              Response.Write("<option value='"&theYear&"'>"&theYear&"</option>")
                           end if
                        next  %>
            </SELECT></td>
                           <td class=text>&nbsp;&nbsp;<SELECT name=DropoffTime>
                                
            <option value='12:00 AM' >midnight</option>
                      <option value='12:30 AM' >12:30 AM</option>
                     <%  
                     for i=1 to 23
                           for j=1 to 2
                              if j=1  then
                                 min="00"
                               else
                                 min="30"
                               end if  
                               if  i<12 then 
                                 test=i&":"&min&" AM"
                                 if i<10 then
                                      theTime="0"&i&":"&min
                                 else
                                          theTime=i&":"&min
                                 end if 
                               else
                                 test=i&":"&min&" PM" 
                                 theTime=i&":"&min
                               end if 
                           
                               'if   Hour(Time)= (i-1) AND  min="00"  then   
                               if   theTime = defaultDrpoffTime then    
                                 Response.Write("<option value='"&theTime&"' selected>"&test&"</option>") 
                               else
                                 Response.Write("<option value='"&theTime&"' >"&test&"</option>") 
                               end if
                           next 
                      next
                %>   </SELECT>          </td></tr></table>       </td>
         </tr>
         <tr><td></td>

           <td CLASS=text align=left><font color=red>*</font>Age of Youngest Driver:</td>
           <td CLASS=text align=left >  <input name="driverage" type="radio" value="22" /> 21 - 24  <input name="driverage" type="radio" checked value="25" /> 25+</td>
        </tr>
        <tr ><td height=1 colspan=3><HR SIZE="1" COLOR="#CCCCCC"></td></tr>
         <tr ><td height=5 colspan=3 ></td></tr>
       
        <tr><td colspan=3 align=right class=text><input name="submit" type="submit" class="button" value="Continue"  /></td></tr>
       <tr><td colspan=3 align=right class=text><font color=red><B>*</b></font> Required fields must be completed</td></tr>
       </TABLE>
      
 </td></tr></table></form> </td>
 <%  END SUB       %><%     
        
        TheQutoationForm
         webConn.CLOSE  
         set webConn=nothing                %> 
      <td width=15 align="left" valign="top">
      <td align="left" valign="top"><h1>Burswood Car Rentals</h1>
        <div>
          <p>Burswood  Car Rentals Perth is a car hire company, that has been operating for over 26  years. We pride ourselves on our customer service, building a customer  satisfaction record second to none. </p>
          <p>Burswood Car Rentals is conveniently located  on the fringe of the Perth central business district which enables us to give you  free delivery to all Perth Hotels and businesses. Our airport service is the  best in Perth. You can pick up your new rental car directly at the Domestic and  International terminals. This service is fast convenient and a real alternative  to the major car rental companies. </p>
          <p>With our new booking system the price you are  quoted is the price you pay. We hope you enjoy hiring with Perth&rsquo;s best  independant car rental company.</p>
        </div>
        <p>&nbsp;</p></td>
      </tr>
</table> </td></tr></table>

<!-- END RCM HTML CODE-----------> 

<!-- HTML Footer Include //-->
 <!-- Footer starts here -->
<table class="egg" width="960" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="left" valign="top">
          <td height="80" align="center" valign="middle" bgcolor="#FF9C25"><table width="100%" border="0" cellspacing="0" cellpadding="10">
            <tr>
              <td width="30%" align="left" valign="top"><p>&copy; 2009 Burswood Car Rentals</p></td>
              <td align="left" valign="top"><p>Head Office and Depot:<br />
                Burswood Car Rentals<br />
                54B Shepperton Road, Victoria Park, <br />
              Perth, Western Australia 6100</p>

              <a href="http://www.burswoodcarrentals.net.au/terms-conditions/">Terms &amp; Conditions</a></td>
              <td align="left" valign="top"><p><strong>Telephone: (08) 9362 4777</strong><br />
                Facsimile: (08) 9362 4877<br />
                International Dial: 0011 61 8 9362 4777<br />
              Freecall Australia Wide: 1800 624 810 </p></td>
            </tr>
          </table></td>
        </tr>
</table>

<!-- Footer ends here -->

</body></html>

