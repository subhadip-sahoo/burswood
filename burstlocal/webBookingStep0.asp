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
<!--  distributed under license restricting its use, copying, distribution  -->
<!--  and decompilation. No part of this product or related documentation may  -->
<!--  reproduced in any form by any means without prior written consent of -->
<!--  GMH Systems LTD  -->
<!--  For more information contact info@rentalcarmanager.com -->
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

<%   
     
        Session.Timeout = 30
     
 Dim webConn
   Set webConn = Server.CreateObject("ADODB.Connection")
   DatabaseFile="Australiawide71"
   webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"


       
SUB SelectPickupLocation
      Response.Write("<SELECT name=PickupLocationID >")
       '--not include location name start with '*'
        Set l_s = webConn.Execute("SELECT WebDefault,Location,Location.ID FROM Location WHERE PickupAvailable=1  and LEFT(Location,1)<>'*' and Location.ID <>117 order by Mobile")
          Response.Write("<option value='0' selected>--PLEASE SELECT LOCATION--</option>")
         Response.Write("<option value='0' >--------------------</option>")
       While Not l_s.EOF
                if CStr(l_s("ID"))=Session("RCM71_PickupLocationID")  then
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
    '--not include location name start with '*'
         Set l_s = webConn.Execute("SELECT WebDefault,Location,Location.ID FROM Location  WHERE DropoffAvailable=1 and LEFT(Location,1)<>'*' and Location.ID <>117 order by Mobile")
           Response.Write("<SELECT name='DropoffLocationID' >")
               Response.Write("<option value='Same' >--SAME AS PICKUP LOCATION--</option>")
                  While Not l_s.EOF
                     if CStr(l_s("ID"))=Session("RCM71_DropoffLocationID")  then
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
     
        Session("RCM71_ErrorMesage")=""  

         

         if Session("RCM71_RequestPickTime")<>"" then
                 defaultPickupTime= Session("RCM71_RequestPickTime")
         else
                 defaultPickupTime="09:00"
         end if 
         if Session("RCM71_RequestDropTime")<>"" then
                defaultDrpoffTime= Session("RCM71_RequestDropTime")
         else
                defaultDrpoffTime="09:00"
         end if    
            
          
         if Session("RCM71_RequestPickDate")<>"" then
                defaultPickupDate = Session("RCM71_RequestPickDate")
          else
                defaultPickupDate=Date+3
         end if     
                                  
         if Session("RCM71_RequestDropDate")<>"" then
                defaultDropoffDate = Session("RCM71_RequestDropDate")
        else
                defaultDropoffDate=Date+6
         end if    
   'ResOnline_RefCode is same as  ResOnline_AgencyCode
       
  
       


%>                                  
            
      <link href="ausbook.css" rel="stylesheet" type="text/css" />
     <Script Language=Javascript>
function WinOpen(URL, winparameters) {
var newwin=open(URL, "newwindow", winparameters);
}
</Script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /><style type="text/css">
<!--
body {
   background-color: #E4E4E4;
}
-->
</style><form method=Post action='webbookingstep2.asp' onsubmit="openTarget(this,'resizable=1,scrollbars=1,height=700,width=830'); return true;">
       
     
   
   <TABLE   align=center bgcolor=#00509F  cellSpacing=0 cellPadding=1  border=0><tr><td>
   <TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>
 
         <TR height=20 bgColor=#00509F><td colspan=3 align=center class=header>INSTANT QUOTE STEP 1 - ENTER LOCATION/DATES</td></tr>
       <tr><td></td>
       <td CLASS=text align=left><BR><font color=red>*</font>Pickup Location:</td>
        <td CLASS=text align=left><BR>
       <%    SelectPickupLocation  %>
       </td></tr>
      
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
           %>  </SELECT>
         </td>
       
            <td CLASS=text>   <SELECT name=PickupYear>
             <%  for theYear=(Year(Date)) to (Year(Date)+2)
                if   theYear=Year(defaultPickupDate)  then
                               Response.Write("<option value='"&theYear&"' selected>"&theYear&"</option>")
                     else
                           Response.Write("<option value='"&theYear&"'>"&theYear&"</option>")
                     end if
                next
   %>  </SELECT></td>
                 <td class=text>&nbsp;&nbsp;<SELECT name=PickupTime>
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
                           
                               'if   Hour(Time)= (i-1) AND  min="00" then   
                                if   theTime = defaultPickupTime then 
                                 Response.Write("<option value='"&theTime&"' selected>"&test&"</option>") 
                               else
                                 Response.Write("<option value='"&theTime&"' >"&test&"</option>") 
                               end if
                           next 
                      next
                %>
      </SELECT></td></tr></table>
               
      </td>
        </tr>
       
   <tr><td></td>
       <td CLASS=text align=left><font color=red>*</font>Return Location:</td>
       <td CLASS=text align=left>    
      <%   SelectDropoffLocation    '--Subs         %>
      </td></tr> 
       
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
        <%   for theYear=(Year(Date)) to (Year(Date)+3)
                     if   theYear=Year(defaultDropoffDate)  then
                               Response.Write("<option value='"&theYear&"' selected>"&theYear&"</option>")
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
                %>   </SELECT>     
          </td></tr></table>
       </td>
         </tr>
         <tr><td></td> 
  
        <td CLASS=text align=left>DOB of Youngest Driver:</td>
       <td CLASS=text>
     <table border=0 cellspacing=0 cellpadding=0><tr><td CLASS=formtext><SELECT name=DOBDay>
         <%          Response.Write("<option value=1 >Day</option>")
            for d=1 to 31       
                       if CStr(d)=Request.Form("DOBDay") and  Request.Form("DOBYear")<>"1900" then
                           Response.Write("<option value='"&d&"' selected>"&d&"</option>")
                  else
                           Response.Write("<option value='"&d&"'>"&d&"</option>")
                  end if
          next                      
           %>  </SELECT></td>
       <td CLASS=formtext><SELECT name=DOBMonth>
            <%       Response.Write("<option value='Jan' >Month</option>")
         for m=1 to 12 
                  theMonth=Left(MonthName(m),3)
                     if   theMonth=Request.Form("DOBMonth") and  Request.Form("DOBYear")<>"1900" then
                           Response.Write("<option value='"&theMonth&"' selected>"&theMonth&"</option>")
                        else     
                           Response.Write("<option value='"&theMonth&"'>"&theMonth&"</option>")
                        end if
          next                      
           %>  </SELECT></td>
   <td CLASS=formtext> <SELECT name=DOBYear>
             <%      Response.Write("<option value='1900' >Year</option>")
                 
                  for theYear=(Year(Date)-90) to (Year(Date)-15)
                if  CStr(theYear)=Request.Form("DOBYear") and  Request.Form("DOBYear")<>"1900" then
                               Response.Write("<option value='"&theYear&"' selected>"&theYear&"</option>")
                     else
                           Response.Write("<option value='"&theYear&"'>"&theYear&"</option>")
                     end if
                  next     
           %>   </SELECT></td></tr></table>
        </td> </tr>         
        <tr ><td height=1 colspan=3><HR SIZE="1" COLOR="#CCCCCC"></td></tr>
         <tr ><td height=5 colspan=3 ></td></tr>
       
        <tr><td colspan=3 align=right class=text><input name="submit" type="submit" class="button" value="Continue"  /></td></tr>
       <tr><td colspan=3 align=right class=text><font color=red><B>*</b></font> Required fields must be completed</td></tr>
       </TABLE>
      
 </td></tr></table></form><script type="text/javascript">
function openTarget (form, features, windowName) {
  if (!windowName)
    windowName = 'formTarget' + (new Date().getTime());
  form.target = windowName;
  open ('', windowName, features);
}
</script>     
 <%  END SUB       %>
 


<!-- RCM HTML CODE-----------> 

<TABLE align=center width="750" cellSpacing=0 cellPadding=0  border=0>

 
<tr><td ><td width=15><td><td valign=top><br><p>
<%       if Session("RCM71_ErrorMesage")<>"" then            
         Response.Write("<span class=red>* "&Session("RCM71_ErrorMesage")&"")
   end if      
        
        TheQutoationForm        
         webConn.CLOSE                  %> 
   
   </td><td width=15>&nbsp;</td>
   
</tr></table>
<!-- END RCM HTML CODE-----------> 

<!-- HTML Footer Include //-->

