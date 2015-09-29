<%
ignorehack = True
allowanything = False
%>
<!--#include file="a_server-checks.asp"-->

<HEAD><TITLE> Agent Booking </TITLE>


 <STYLE TYPE="text/css">
.white {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }  
.text  {  font-family: Arial;font-size: 8pt;color: #666666; }  
.formtext {  font-family: Arial;font-size: 8pt;color: #666666; font-weight: bold; }
.header {  font-family: Arial;font-size: 10pt;color: #FFFFFF; font-weight: bold; }
.greytext {font-family: Arial, Helvetica, Times New Roman; font-weight:bold; font-size:8pt;color:#999999}
SELECT {   font-family: Arial;font-size: 8pt;color: #666666; }
.button {   font-family: Arial;font-size: 8pt;color: #666666; }
input  {   font-family: Arial;font-size: 8pt;color: #666666; }
.red  {  font-family: Arial;font-size: 8pt;color:#FF0000; }  


.BGColour input {
 font: 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
 background-color: #FFFFCC;
 color: #102132;
 border: 1px solid #284279;
}

.BGColour select {
 font: 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
 background-color: #FFFFCC;
 color: #102132;
 border: 1px solid #284279;
</STYLE> 
<link rel="stylesheet" media="screen" href="dynCalendar.css" />
<script language="javascript" type="text/javascript" src="browserSniffer.js"></script>
<script language="javascript" type="text/javascript" src="dynCalendar.js"></script>
<script Language="JavaScript">
<!--
function Validate(theForm)
{
  if (theForm.AgencyCode.value == "" )
  {      alert("Agency Code  required.");
      theForm.AgencyCode.focus();
      return (false);
  } 
    if (theForm.AgencyName.value == "" )
  {      alert("Consultant Name required.");
    theForm.AgencyName.focus();
      return (false);
  }
      if (theForm.AgentEmail.value != "" )
    {   var emailRegEx = /^[a-zA-Z0-9._-]*\@[a-zA-Z0-9._-]*$/;
      if(!emailRegEx.test(theForm.AgentEmail.value))
      {
         alert("Invalid Email address");
         return false;
      }
       }

        if (theForm.PickupLocationID.value == "0")
  {      alert("Please select pickup location.");
      theForm.PickupLocationID.focus();
      return (false);
  }

  if (theForm.DropoffLocationID.value == "0")
  {      alert("Please select dropoff location.");
      theForm.DropoffLocationID.focus();
      return (false);
  }

   return (true);
}
//-->  
</Script>
</head>
      
               
            
<%   
      if Request.QueryString("dir")="newbooking" then
       Session.Abandon
    end if


      Session.Timeout = 30

            Session("RCM169a_CompanyColour")="#FF8000"'---the booking form color is blue, web designer can change it here



        CompanyCode="Australiawide71"
        DatabaseFile="Australiawide71"

        Dim webConn     'webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

         webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"



 SUB SelectPickupLocation
        '---May 2013, hard-code the Burswood steps to ONLY use Locations that start with an * .  Note that these will all be changed so that they say Pickup=No, Dropoff=No so they aren't included on Australia Wide steps

      Set l_s = webConn.Execute("SELECT Location,Location.ID FROM Location WHERE  PickupAvailable=1 and  left(Location, 1)='*' order by Location ")
        Response.Write("<SELECT name=PickupLocationID >")
       Response.Write("<option value='0' selected>--PLEASE SELECT LOCATION--</option>")
         Response.Write("<option value='0' >--------------------</option>")
            While Not l_s.EOF
               if CStr(l_s("ID"))=Session("RCM169a_PickupLocationID")  then
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

      Set l_s = webConn.Execute("SELECT Location,Location.ID FROM Location WHERE DropoffAvailable=1 and left(Location, 1)='*' order by Location ")
            Response.Write("<SELECT name='DropoffLocationID' style='WIDTH:205px; HEIGHT: 18px' >")
            Response.Write("<option value='0' selected>--PLEASE SELECT LOCATION--</option>")
         Response.Write("<option value='0' >--------------------</option>")
                 ' Response.Write("<option value='Same' >Same As Pickup Location</option>")
                  While Not l_s.EOF
                     if CStr(l_s("ID"))=Session("RCM169a_DropoffLocationID")  then
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
     
        Session("RCM169a_ErrorMesage")=""
            
         
        
         if Session("RCM169a_RequestPickTime")<>"" then
                 defaultPickupTime= Session("RCM169a_RequestPickTime")
         else
                 defaultPickupTime="09:00"
         end if 
         if Session("RCM169a_RequestDropTime")<>"" then
                defaultDrpoffTime= Session("RCM169a_RequestDropTime")
         else
                defaultDrpoffTime="09:00"
         end if    
            
          
         if Session("RCM169a_RequestPickDate")<>"" then
                defaultPickupDate = Session("RCM169a_RequestPickDate")
          else
                defaultPickupDate=Date+5
         end if     
                                  
         if Session("RCM169a_RequestDropDate")<>"" then
                defaultDropoffDate = Session("RCM169a_RequestDropDate")

        else
                defaultDropoffDate=Date+15
         end if    

%>                                  
            
   <form method=Post action="webAgentBooking2.asp" onsubmit="return Validate(this)">

<!-- Banner starts here -->
<table width="550" height="122" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td align="left" valign="top"><img src="graphics/burswoodBanner.jpg" alt="Burswood Car Rentals" name="cars" width="550" height="122" border="0" usemap="#carsMap" id="cars" /></td>
  </tr>
</table>
<!-- Banner ends here -->
<!-- Order steps start here -->

   <TABLE  width=550  align=center bgcolor=<%=Session("RCM169a_CompanyColour")%>   cellSpacing=0 cellPadding=1  border=0><tr><td>
   <TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>
 
   <TR height=20 bgColor=<%=Session("RCM169a_CompanyColour")%> ><td colspan=3 align=center class=header>Skippers Aviation/Return Renters/Travel Agents Booking Request (Step 1 of 4)</td></tr>
   <tr>
    <td CLASS=greytext colspan=2 align=left><li>Enter your assigned Return Renter/Travel Agent Code, Name and Email Address </td>
   </tr>
   <tr>
    <td CLASS=greytext colspan=2 align=left><li>Please select the Pickup and Dropoff Locations including Booking Dates and any available Flight information.
      <TR height=20 bgColor=<%=Session("RCM169a_CompanyColour")%> ><td colspan=3 align=center class=header>Required Information</td></tr>
    <tr>
       <td CLASS=text nowrap align=left ><font color=red>*</font>Access Code:</td>
       <td align=left CLASS=text><input Type=text name=AgencyCode maxlength=20  Size=30 value=""></td>
    <tr>
      <td CLASS=text nowrap align=left ><font color=red>**</font>If you do not have an access code please email</td>
   <tr>
      <td CLASS=text nowrap align=left ><a href="mailto:burscars@iinet.net.au?subject=Feedback" >burscars@iinet.net.au</a> for your code</td>
   <tr>
       <td CLASS=text nowrap align=left ><font color=red>*</font>Renters Name:</td>
       <td align=left CLASS=text><input Type=text name=AgencyName Size=30 maxlength=30  value="<%=Session("RCM169a_AgencyName")%>"></td>
       <tr>
       <td CLASS=text nowrap align=left >Email:</td>
       <td align=left CLASS=text><input Type=text name=AgentEmail maxlength=50  Size=30 value="<%=Session("RCM169a_AgentEmail")%>"></td>
       </tr>
       <TR height=20 bgColor=<%=Session("RCM169a_CompanyColour")%> ><td colspan=3 align=center class=header>Booking Details</td></tr>
       <tr>
       <td CLASS=text align=left><BR><font color=red>*</font>Pickup Location:</td>
        <td CLASS=text align=left><BR>
       <%    SelectPickupLocation  %>
       </td></tr>
      
       <tr>
       <td CLASS=text align=left><font color=red>*</font>Pickup Date:</td>
       <td CLASS=BGColour align=left >
         <table border=0 cellspacing=0 cellpadding=0><tr><td CLASS=formtext>
              <SELECT name=PickupDay>
           <%     for pd=1 to 9
                     zero = "0"
                     if  pd=Day(DefaultPickupDate)   then
                                  Response.Write("<option value='")
                              Response.Write(""& zero & pd &"' selected>"&pd&"</option>")
                           else
                                    Response.Write("<option value='"& zero & pd &"' >"&pd&"</option>")
                           end if
                     zero = ""
                  next
                     for pd=10 to 31
                           if  pd=Day(DefaultPickupDate) then
                                 Response.Write("<option value='")
                                 Response.Write(""& pd &"' selected>"&pd&"</option>")
                           else
                                 Response.Write("<option value='"& pd &"' >"&pd&"</option>")
                           end if
                           zero = ""
                     next
           %>  </SELECT></td>
            <td CLASS=formtext ><SELECT name=PickupMonth>
                  <% for pm = 1 to 9
               theMonth=Left(MonthName(pm),3)
               monthValue="0"&pm
                           if   pm=Month(defaultPickupDate)    then
                                 Response.Write("<option value='"&monthValue&"' selected>"&theMonth&"</option>")
                           else
                              Response.Write("<option value='"&monthValue&"' >"&theMonth&"</option>")
                                end if
                  next
                  for pm = 10 to 12
               theMonth=Left(MonthName(pm),3)
                              if   pm=Month(defaultPickupDate)    then
                                 Response.Write("<option value='"&pm&"' selected>"&theMonth&"</option>")
                           else
                              Response.Write("<option value='"&pm&"' >"&theMonth&"</option>")
                                end if

             next %>
                  </SELECT> </font></td>
           </td>
         <td CLASS=formtext><SELECT name=PickupYear>
           <%   for theYear=(Year(Date)-1) to (Year(Date)+2)
                if   theYear=Year(defaultPickupDate)  then
                               Response.Write("<option value='"&theYear&"' selected>"&theYear&"</option>")
                     else
                           Response.Write("<option value='"&theYear&"'>"&theYear&"</option>")
                     end if
                next
                   %>      </SELECT></td>
                   <td width="33"><div align="center">
         <script language="JavaScript" type="text/javascript"> <!--
         function Callback_ISO1(date, month, year)
         {  if (String(month).length == 1) {
                  month = '0' + month;
            }
               if (String(date).length == 1) {
                  date = '0' + date;
            }
         document.forms['frmTest'].PickupDay.value = date;
         document.forms['frmTest'].PickupMonth.value = month;
         document.forms['frmTest'].PickupYear.value = year;
            }
            calendar1 = new dynCalendar('calendar1', 'Callback_ISO1');
            calendar1.setMonthCombo(true);
            calendar1.setYearCombo(true);
         //--> </script>
              </div></td></tr></table>
         </td>
        </tr>
              <tr>
       <td CLASS=text align=left><font color=red>*</font>Pickup Time: 
            <td CLASS=BGColour align=left><SELECT name=PickupTime style="WIDTH:85px; HEIGHT: 18px">
                              <option value='12:00' >midnight</option>
                              <option value='12:30' >12:30 AM</option>
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
                           
                               'if   Hour(Time)= (i-1) AND  min="00" then   
                                if   theTime = defaultPickupTime then 
                                 Response.Write("<option value='"&theTime&"' selected>"&test&"</option>") 
                               else
                                 Response.Write("<option value='"&theTime&"' >"&test&"</option>") 
                               end if
                           next 
                      next
                %>
      </SELECT></td></tr> 
       
   <tr>
       <td CLASS=text align=left><font color=red>*</font>Return Location:</td>
       <td CLASS=text align=left>    
      <%   SelectDropoffLocation    '--Subs         %>
      </td></tr> 
       
       <tr>
       <td CLASS=text align=left><font color=red>*</font>Return Date:</td>
       <td CLASS=BGColour align=left >
        <table border=0 cellspacing=0 cellpadding=0><tr><td CLASS=formtext><SELECT name=DropoffDay>
           <%  for pd=1 to 9
                     zero = "0"
                     if  pd=Day(DefaultDropoffDate)   then
                           Response.Write("<option value='")
                              Response.Write(""& zero & pd &"' selected>"&pd&"</option>")
                           else
                                    Response.Write("<option value='"& zero & pd &"' >"&pd&"</option>")
                           end if
                     zero = ""
                  next
                     for pd=10 to 31
                           if  pd=Day(DefaultDropoffDate) then
                        Response.Write("<option value='")
                        Response.Write(""& pd &"' selected>"&pd&"</option>")
                     else
                              Response.Write("<option value='"& pd &"' >"&pd&"</option>")
                           end if
               zero = ""
            next
           %>     </SELECT></td>
       <td CLASS=formtext><SELECT name=DropoffMonth>
         <%

          for pm = 1 to 9
               theMonth=Left(MonthName(pm),3)
               monthValue="0"&pm
                          if  pm=Month(defaultDropoffDate)   then
                        Response.Write("<option value='"&monthValue&"' selected>"&theMonth&"</option>")
                           else
                              Response.Write("<option value='"&monthValue&"' >"&theMonth&"</option>")
                                end if
                  next
                  for pm = 10 to 12
               theMonth=Left(MonthName(pm),3)
                         if  pm=Month(defaultDropoffDate)   then
                        Response.Write("<option value='"&pm&"' selected>"&theMonth&"</option>")
                           else
                              Response.Write("<option value='"&pm&"' >"&theMonth&"</option>")
                                end if

             next
           %>  </SELECT></td>

   <td CLASS=formtext>  <SELECT name=DropoffYear>
          <%    for theYear=(Year(Date)-1) to (Year(Date)+2)
                     if   theYear=Year(defaultDropoffDate)  then
                               Response.Write("<option value='"&theYear&"' selected>"&theYear&"</option>")
                     else
                           Response.Write("<option value='"&theYear&"'>"&theYear&"</option>")
                     end if
                  next    %>
            </SELECT></td>
            <td width="33"> <div align="center">
      <script language="JavaScript" type="text/javascript">
         <!--
         function Callback_ISO2(date, month, year)
         {
             if (String(month).length == 1) {
                month = '0' + month;
             }
             if (String(date).length == 1) {
             date = '0' + date;
             }
         document.forms['frmTest'].DropoffDay.value = date;
      document.forms['frmTest'].DropoffMonth.value = month;
      document.forms['frmTest'].DropoffYear.value = year;
          }
          calendar2 = new dynCalendar('calendar2', 'Callback_ISO2');
          calendar2.setMonthCombo(true);
          calendar2.setYearCombo(true);
          //-->
            </script></td>

            </tr></table>
       </td></tr><tr>
       <td CLASS=text align=left><font color=red>*</font>Return Time:
       <td CLASS=BGColour align=left ><SELECT name=DropoffTime  style="WIDTH:85px; HEIGHT: 18px">
                                
            <option value='12:00' >midnight</option>
                      <option value='12:30' >12:30 AM</option>
     
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
                %>   </SELECT>     
      
       </td>
         </tr>
           <%   Set s_c = webConn.Execute("SELECT count(*) as SizeCount FROM CategoryType WHERE RentingType=1  ")

               if s_c("SizeCount") >1 then
                        Response.Write("<tr><td class=""text"" align=""left""><font color=red>*</font>Vehicle Type:</td>")
                        Response.Write("<td align=left valign=""bottom"" >")
                        Set l_s = webConn.Execute("SELECT * FROM CategoryType WHERE RentingType=1  order by Ordering")
                        Response.Write("<SELECT name='CategoryTypeID'>")

                        'Response.Write("<option value='0' >Choose Vehcile Type</option>")
                        While Not l_s.EOF
                              if CStr(l_s("ID"))=Session("RCM169a_CategoryTypeID")  then
                                    Response.Write("<option value='"&l_s("ID")&"' selected>"&l_s("CategoryType")&" &nbsp;</option>")
                              else
                                    Response.Write("<option value='"&l_s("ID")&"' >"&l_s("CategoryType")&" &nbsp;</option>")
                              end if
                        l_s.MoveNext
                        Wend
                        l_s.Close
                        Set l_s=nothing
                     Response.Write("</select></td></tr>")
               else
               s_c.close
               set s_c=nothing
               Set s_c = webConn.Execute("SELECT ID  FROM CategoryType ")
               Response.Write("<input name=CategoryTypeID type=hidden  Value="&s_c("ID")&"  />")
               end if
               s_c.close
               set s_c=nothing
              %>

         <tr>
           <td CLASS=text align=left><font color=red>*</font>Age of Youngest Driver:</td>
       <td CLASS=text align=left>  <input name="driverage" type="radio" value="18" /> 18 - 20  <input name="driverage" type="radio" checked value="21" /> 21+

      

        </td> </tr>         
        <tr ><td height=1 colspan=3><HR SIZE="1" COLOR=red></td></tr>
         <tr ><td height=5 colspan=3 ></td></tr>
       
        <tr><td colspan=3 align=right class=text><input name="submit" type="submit" class="button" value="Continue"  /></td></tr>
       <tr><td colspan=3 align=right class=text><font color=red><B>*</b></font> Required fields must be completed</td></tr>
       </TABLE>
      
 </td></tr></table></form>     
 <%  END SUB       %>
 


<!-- RCM HTML CODE-----------> 
<table width="600" align=center border="0" cellpadding="5" cellspacing="10">
  <%  if Session("RCM169a_ErrorMesage")<>"" then
            Response.Write("<tr><td  class=red>* "&Session("RCM169a_ErrorMesage")&"</td></tr>")
            Session("RCM169a_ErrorMesage")=""
   end if   %>
<tr><td align="center" valign="top">
<%      TheQutoationForm        
         webConn.CLOSE  
   SET webConn=nothing               %> 
   
 </td></tr>
 </table>  
         
 
</body></html>
