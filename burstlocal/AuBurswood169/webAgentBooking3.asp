<%
ignorehack = True
allowanything = False
%>
<!--#include file="a_server-checks.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<title></title>
<head>
<!-- Copyright 2003-2008 GMH SYSTEMS LTD  -->
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
SELECT {   font-family: Arial;font-size: 8pt;color: #666666; }
.button {   font-family: Arial;font-size: 8pt;color: #666666; }
input  {   font-family: Arial;font-size: 8pt;color: #666666; }

</STYLE>
<Script Language=Javascript>
function checkNumeric(objName)
{        var numberfield = objName;
   if (chkNumeric(objName) == false)
   {  numberfield.select();
      numberfield.focus();
      return false;
   }
   else
   {        return true;
   }      
}
function chkNumeric(objName)
{   // only allow 0-9 be entered, plus any values passed
var checkOK = "0123456789";
var checkStr = objName;
var allValid = true;
var decPoints = 0;
var allNum = "";

   if  ((checkStr.value.length) != 0)
   {        for (i = 0;  i < checkStr.value.length;  i++)
            {        ch = checkStr.value.charAt(i);
               for (j = 0;  j < checkOK.length;  j++)
         if (ch == checkOK.charAt(j))
         break;
         if (j == checkOK.length)
         {     allValid = false;
            break;
               }
               if (ch != ",")
               allNum += ch;
      }
            if (!allValid)
      {  alert("Please enter Numeric value"); 
            return (false);
      }
   }
    
}
//-->
</Script>
</head>

 
<%       if Session("RCM169a_PickupLocationID")="" then
            Response.Redirect "webAgentBooking1.asp"
    end if
     RCMURL="https://secure20.rentalcarmanager.com.au"


        CompanyCode="Australiawide71"
        DatabaseFile="Australiawide71"

        Dim webConn     'webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

         webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"





   
   

 
 SUB  GetEachSeasonRateStructureID         
          '-----check system set up if Calculate Seasonal Rates using total rental days (long hire rate)
         TotalDays= Session("RCM169a_TotalRentalDays")
         longHireRate="No"
        Set RG=webConn.Execute("SELECT * FROM SystemTable WHERE Code='LONGR'  ")
         If not RG.EOF then 
            longHireRate= RG("syValue")'--TOTAL booking days
         END IF
         RG.CLOSE
         SET RG=NOTHING 
         DaysForRate=NoOfDaysEachSeason

        if longHireRate="Yes" then
               'DaysForRate= TotalDays '--TOTAL booking days
                   '--in step2 the DaysForRate for 12 hour rate is not inculde 1 more day
               '--should use the same number of days to get RateStructureID in step3

               DaysForRate= Session("RCM169a_TotalRentalDays24Hour")
        end if 
        if  DaysForRate > Fix(DaysForRate) then
         DaysForRate=Fix(DaysForRate)+1
         end if
 'Response.Write("<br>test"&DaysForRate&"</br>")
       
          RateName="Default"
          Rate=0
          RateStructureID=1
          Session("RCM169a_RateStructureID"&i&"")=1
         '----------get rateStructureID ------------------
         '---weekend  booking   
         
         '---only bookings <=3 days and between 12:00 Friday to 12:00 Monday (AU Coutesy Cars)
   '---check systemtable if use weekend rate     
       Set RG=webConn.Execute("SELECT * FROM SystemTable WHERE Code='WKEND'  ")
       UseWeekendRate="No"
       If not RG.EOF then  
       UseWeekendRate=RG("syValue")
       end if 
       RG.CLOSE
       SET RG=NOTHING  
         
      
         WeekendRate="No"
   IF UseWeekendRate="Yes" THEN
   if  DaysForRate<=3 and VBFriday=Weekday(Session("RCM169a_RequestPickDate")) then
          WeekendStard=Session("RCM169a_RequestPickDate")&" 12:00"
          WeekendEnd=(CDate(Session("RCM169a_RequestPickDate"))+3)&" 12:00"
          if   CDate(Session("RCM169a_RequestPickDateTime"))=>CDate(WeekendStard) and CDate(Session("RCM169a_RequestDropDateTime"))<=CDate(WeekendEnd) then
                  WeekendRate="Yes"
                  'Response.Write(WeekendStard)
                   'Response.Write("---5Weekend----")
                   'Response.Write(WeekendEnd)
          end if
   end if 
   
         if  DaysForRate<=2 and VBSaturday=Weekday(Session("RCM169a_RequestPickDate")) then
          WeekendStard=(CDate(Session("RCM169a_RequestPickDate"))-1)&" 12:00"
          WeekendEnd=(CDate(Session("RCM169a_RequestPickDate"))+2)&" 12:00"
          if   CDate(Session("RCM169a_RequestDropDateTime"))<=CDate(WeekendEnd) then
                  WeekendRate="Yes"
                  'Response.Write(WeekendStard)
                   'Response.Write("---6Weekend----")
                   'Response.Write(WeekendEnd)
          end if
   end if 
   END IF   '---end UseWeekendRate="Yes" 
      
       if WeekendRate="Yes"   then
                 'Session("RCM169a_RateStructureID"&i&"")=1
                 RateStructureID=1  
                 Session("RCM169a_RateStructureID"&i&"")=1
                  RateName="Weekend" 
                  FromDay=2
                 ToDay=2
                'Response.Write("<br>1. Weekend 2 - 2") 
      else          
                 '--get RateStructure 1st--------
            Set s_rs=webConn.Execute("SELECT * FROM CarRateStructure order by FromDay  " )    
             DO WHILE NOT s_rs.EOF
                 FromDay=""
                 ToDay=""
                 if  s_rs("ID")>1 then  '---  not weekend (more then 2 days)
                        'Response.Write("<br>test")
                                if s_rs("ToDay")=0 then
                           ToDay=999999
                        else
                           ToDay=s_rs("ToDay")
                        end if 
                        FromDay=s_rs("FromDay")
                        ' if NoOfDaysEachSeason =>s_rs("FromDay") and NoOfDaysEachSeason =<ToDay then
                       ' Response.Write("<br>"&DaysForRate&" - "&s_rs("ToDay")&"&nbsp;")
                              if DaysForRate =>s_rs("FromDay") and DaysForRate =<ToDay then
                             ' Response.Write("<br>"&s_rs("ID")&". "&s_rs("RateName")&":&nbsp;"&s_rs("FromDay")&" - "&s_rs("ToDay")&"&nbsp;")
                              RateName=s_rs("RateName")
                              RateStructureID=s_rs("ID")
                              Session("RCM169a_RateStructureID"&i&"")=s_rs("ID")
                         
                        end if
                 end if 
                 
         s_rs.MoveNext
            Loop 
      s_rs.Close
      SET s_rs=nothing
       end if 
       'Response.Write(RateStructureID)         
       'keep rateStructureID here
        Response.Write("<input type='hidden' name='RateStructureID"&i&"' size=5 value='"&RateStructureID&"'>")
       Response.Write("<input type='hidden' name='RateName"&i&"' size=5 value='"&RateName&"'>")
      
      
END SUB


SUB  findTheRate2  '---Sample Web Quotation1       '---get the rate Discount----------- 
      
         DiscountRate=Session("RCM169a_DiscountRate")
            DiscountID=Session("RCM169a_DiscountID")
            DiscountType=Session("RCM169a_DiscountType")
            
   '----get all car Category  display the webAvaliable category
        SQL=" SELECT CarSize.*,UnavaliableFrom,UnavaliableTo  FROM WebLocationCategory,CarSize "
        SQL=SQL&" WHERE (LocationID)='"&Session("RCM169a_PickupLocationID")&"' "
        SQL=SQL&" AND CategoryID=CarSize.ID "  
        SQL=SQL&" AND CarSize.ID="&CInt(Request.QueryString("CarSizeID"))&" "
        ' SQL=SQL&" AND (UnavaliableFrom>'"&RequestDropDate&"' or UnavaliableTo<'"&RequestPickDate&"') " 
         SQL=SQL&" ORDER By orders "  
       'Response.Write(SQL)
         Set s_cs=webConn.Execute(SQL)  
         j=0
      if NOT s_cs.EOF   then 
            '---check if rate >0 then display on the website--------------
                '--- check if the rental period in the Discount Date range
                '--- then check if there is a category discount rate 
                '--- if not then use the location discount rate
            
          if CInt(Session("RCM169a_MinimunAge"))>s_cs("AgeYoungestDriver") THEN
            Session("RRCM29a_MinimunAge")=s_cs("AgeYoungestDriver")
            end if
            
            '--for each season, get the rate
                  j=j+1
            
               '----------Vehicle Type-------------------
                 theimage=RCMURL&"/DB/"&CompanyCode&"/"&s_cs("ImageName")
                   Session("RCM169a_CarImageName")=s_cs("ImageName")
      
         Response.Write("<tr><td></td><td align=left class=text valign=top>Vehicle Type: </td>")
         Response.Write("<td align=left class=text valign=top>")
         
            Response.Write("<table valign=top cellSpacing=0 cellPadding=2  border=0>")
            Response.Write("<tr><td class=text valign=top>"&s_cs("WebDesc")&"</td></tr>")
            Response.Write("<tr><td class=text>"&s_cs("VehicleDesc")&"</td></tr>")
             

               
          '---the rates-----------
          costEachSeason=0
                totalRate=0
                for i=1 to SeasonCount
                        StandardRate=0
                        Rate=0
                         '--for each Season Rate
                           if Session("RCM169a_AgencyRateTypeID")>0 then
                   SQL="SELECT Rate FROM AgencyRateDetails,AgencyRate  where AgencyRateTypeID="&Session("RCM169a_AgencyRateTypeID")&" "
                   SQL=SQL&" and AgencyRate.ID=CarRatesID and CarRateStructureID="&Session("RCM169a_RateStructureID"&i&"")&" "
                   SQL=SQL&" and  SeasonID="&Session("RCM169a_SeasonID"&i&"")&" "
                   SQL=SQL&" and LocationID="&Session("RCM169a_PickupLocationID")&"  "
                   SQL=SQL&" and CarSizeID="&s_cs("ID")&"  "
               'Response.Write("<p>")
                     'Response.Write(SQL)
               Set s_m=webConn.Execute(SQL)
                              IF NOT s_m.EOF THEN 
                                          StandardRate=s_m("Rate")
                                 if Session("RCM169a_DiscountType")="p" then
                                       Rate=s_m("Rate")*(1-Session("RCM169a_DiscountRate")/100)
                                    else
                                    Rate=s_m("Rate")-Session("RCM169a_DiscountRate")  '--need session discountrate here
                                 end if
                                 'Response.Write("<p>Rate=")
                        'Response.Write(agencyRate)
               END IF 
                     s_m.close
                     set s_m=nothing
               else if  Session("RCM169a_AgencyRateTypeID")=0 then
                              SQL="SELECT * FROM QCarRateDetails "
                              SQL=SQL&"WHERE CarSizeID="&s_cs("ID")&" "
                               SQL=SQL&"AND CarRateStructureID="&Session("RCM169a_RateStructureID"&i&"")&" "
                              SQL=SQL&"AND (SeasonID)='"&Session("RCM169a_SeasonID"&i&"")&"' "
                              'SQL=SQL&"AND (LocationID)='"&Session("RCM169a_PickupLocationID")&"' "
                              'Response.Write(SQL)
                              Set s_m=webConn.Execute(SQL)
                           Rate=0
                           if NOT s_m.EOF   then   
                              '----only display the rate if the rate >0   
                                 StandardRate=s_m("Rate")
                                 if Session("RCM169a_DiscountType")="p" then
                                          Rate=s_m("Rate")*(1-Session("RCM169a_DiscountRate")/100)
                                 else
                                          Rate=s_m("Rate")-Session("RCM169a_DiscountRate")
                                 end if
                                 
                                    end if 
                              s_m.close
                              set s_m=nothing
                        end if
                        end if
                        costEachSeason=Rate*Session("RCM169a_NoOfDaysEachSeason"&i&"")
                        totalRate=totalRate+costEachSeason  
                        'Response.Write("<tr><td class=text nowrap>&nbsp;"&Session("RCM169a_Season"&i&"")&" </td></tr>")
                         Response.Write("<tr><td class=text nowrap>&nbsp;"&Session("RCM169a_NoOfDaysEachSeason"&i&"")&" Days @ "&FormatCurrency(Rate,2)&" (per day)</a></td></tr>")
                       Response.Write("<input type='hidden' name='Rate"&i&"' size=5 value='"&Rate&"'>")
                      Response.Write("<input type='hidden' name='StandardRate"&i&"' size=5 value='"&StandardRate&"'>")    
     
                 next  
             Response.Write("<tr><td class=text  nowrap>Total "&Session("RCM169a_TotalRentalDays")&" days  "&FormatCurrency(totalRate,2)&"</td></tr>")
             
            Response.Write("</table></td>")
                 Response.Write("<td align=left ><img src='"&theimage&"'  WIDTH=100 ></td></tr>")
          
        end if
          s_cs.Close 
         set s_cs=nothing

         
END SUB

 
 SUB ExtraForm  '--sub
    '--if the cost of extrafees > maxprice then display maxprice---
    SQL="SELECT * from ExtraFees WHERE (LocationID='"&Session("RCM169a_PickupLocationID")&"' or  LocationID=0) and InsuranceExtra=0 AND  WebItems=1 and Mandatory=0 and inUse=1 order by QTYApply, Type"
    Set s_ex=webConn.Execute(SQL) 
    if NOT s_ex.EOF  then        %>   
            <TR height=22 bgColor=<%=Session("RCM169a_CompanyColour")%> ><td  align=center class=header>Select any extra items required with your Vehicle</td></tr>
         <tr><td>
         
        
      <TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>
      <tr><td  width=30></td><td class=formtext align=left >Description:</td><td class=formtext>Price</td><td class=formtext align=right>QTY</td></tr>
            <tr><td colspan=4 bgColor=#C0C0C0></td></tr>
    <%         j=0
                 DO WHILE NOT s_ex.EOF          
                  Response.Write("<tr><td><input type=checkbox  name=ExtraFeesID"&j&" Value="&s_ex("ID")&" ></td>")
                         if s_ex("Type")="Percentage" then
                              Response.Write("<td class=text align=left >"&s_ex("Name")&"</td><td class=text align=left nowrap>"&s_ex("Fees")&"% (of Rental)</td>")
                           
                    else
                           '--for daily extra if the cost of extrafees > maxprice then display maxprice---
                    if s_ex("Type")="Daily" and s_ex("Maxprice")>0 and TotalRentalDays*s_ex("Fees")>s_ex("Maxprice") then
                                    Response.Write("<td class=text align=left >"&s_ex("Name")&"</td><td class=text align=left nowrap>"&Formatcurrency(s_ex("Maxprice"),2)&" (Fixed)</td>")
                                 else
                              Response.Write("<td class=text align=left >"&s_ex("Name")&"</td><td class=text align=left nowrap>"&Formatcurrency(s_ex("Fees"),2)&" ("&s_ex("Type")&")</td>")
                                 end if
                    end if 
                    if s_ex("QTYApply")=True  then
                    Response.Write("<td class=text align=right><input Type=text name=QTY"&j&" Size=2 value='1' onBlur='checkNumeric(this);'></td></tr>")
                    else
                    Response.Write("<td class=text align=right><input type=hidden name=QTY"&j&" Size=2 value='1' onBlur='checkNumeric(this);'></td></tr>")
                    end if   
                    Response.Write("<input  type=hidden  name=MaxPrice"&j&"  Value='"&s_ex("MaxPrice")&"' >")
                    Response.Write("<input  type=hidden  name=ExtraFeesName"&j&"  Value='"&s_ex("Name")&"' >")
                    Response.Write("<input  type=hidden  name=ExtraFees"&j&"  Value='"&s_ex("Fees")&"' >")
                    Response.Write("<input type=hidden  name=FeeType"&j&" Value='"&s_ex("Type")&"' >")
                        Response.Write("<input type=hidden  name=GST"&j&" Value='"&s_ex("GST")&"' >") 
                    Response.Write("<input type=hidden  name=StampDuty"&j&" Value='"&s_ex("StampDuty")&"'>")
                        Response.Write("<input type=hidden  name=PercentageTotalCost"&j&" Value='"&s_ex("PercentageTotalCost")&"'>")
                        Response.Write("<input type=hidden  name=MerchantFee"&j&" Value='"&s_ex("MerchantFee")&"'></td>")
                     
                    Response.Write("<tr><td colspan=4 bgColor=#C0C0C0></td></tr>")
                 s_ex.MoveNext                                    
            j=j+1    
            Loop 
               s_ex.close
            SET s_ex=nothing 
                 Response.Write("<input type=hidden name='ExtraFeeCount' value='"&j&"'>")
                 Response.Write("</table></td></tr>")
     END IF
 END SUB
 
 SUB InsuranceExtra '--InsuranceSelectionNewBooking

         VehicleSizeID=CInt(Request.QueryString("CarSizeID"))
        InsuranceLocaitonID =Session("RCM169a_PickupLocationID")
        TotalDays=  Session("RCM169a_TotalRentalDays")
         iAge=0  
         iAge=Session("RCM169a_driverage")
      'Response.Write("<tr ><td class=text>TotalDay="&TotalDays&"</td><td  class=text>"&iAge&"</td><td  class=text>"&RequestPickDate&"<td></td></tr>")
      
    Set s_in=webConn.Execute("SELECT * from ExtraFees WHERE inUse=1 and  InsuranceExtra=1 and WebItems=1 AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) order by Name")
    if s_in.EOF then '---if no insurance set up then do not show the dropdown list for selection
          Response.Write("<input type=hidden  name=InsuranceID Value='0' >")
    else    
       
         Response.Write("<TR height=20 bgColor="&Session("RCM169a_CompanyColour")&" ><td align=center class=header>Select Reduction in Renter's Liability you require</td></tr>")
        Response.Write("<tr><td  align=left>")
        Response.Write("<TABLE  width=100% align=left  cellSpacing=0 cellPadding=2  border=0>")
     
            
   '---Insurance selection logic
      SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 and WebItems=1 "
      SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0)"
      SQL=SQL&" and VehicleSizeID="&VehicleSizeID&" "
      if iAge>0 then
         SQL=SQL&" and FromAge<="&iAge&" and (ToAge>="&iAge&" or (ToAge=0 and FromAge>0)) "  
      else 
         SQL=SQL&" and FromAge=0 "  
      end if
      SQL=SQL&" and FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0))  " 
      Set s_in = webConn.Execute(SQL) '----1
      if NOT s_in.EOF then 
             ' Response.Write(SQL)
            DO WHILE NOT s_in.EOF  
                     if  s_in("Mandatory")=True then
                     Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" CHECKED>"&s_in("Name")&" </td><td class=text align=right> "&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                     else
                     Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" >"&s_in("Name")&"</td><td class=text align=right>"&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                  end if
         s_in.MoveNext
            Loop 
   else
            SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 and WebItems=1 "
            SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) "
            SQL=SQL&" and VehicleSizeID="&VehicleSizeID&"    "
            if iAge>0 then
      SQL=SQL&" and ((FromAge<="&iAge&" and (ToAge>="&iAge&" or (ToAge=0 and FromAge>0)) and FromDay=0) or  (FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0)) and FromAge=0)) "
      else
            SQL=SQL&" and FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0))  " 
         end if
                  Set s_in = webConn.Execute(SQL) '----2    
                  
         if NOT s_in.EOF then 
                        'Response.Write(SQL)
                        DO WHILE NOT s_in.EOF  
                           if  s_in("Mandatory")=True then
                           Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" CHECKED>"&s_in("Name")&"</td><td class=text align=right>"&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                           else
                           Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" >"&s_in("Name")&"</td><td class=text align=right>"&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                     end if
            s_in.MoveNext
                     Loop 
            else
               SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 and WebItems=1 "
               SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0)  "
               SQL=SQL&" and VehicleSizeID="&VehicleSizeID&"  "
            SQL=SQL&" and FromAge=0 and FromDay=0  "
                     Set s_in = webConn.Execute(SQL) '----3   
                     if NOT s_in.EOF then 
                         ' Response.Write(SQL)
                        DO WHILE NOT s_in.EOF  
                                    if  s_in("Mandatory")=True then
                                    Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" CHECKED>"&s_in("Name")&"</td><td class=text align=right>"&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                              else
                                    Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&">"&s_in("Name")&"</td><td class=text align=right>"&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                              end if
                              s_in.MoveNext
                           Loop 
                     else
            SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 and WebItems=1 "
                        SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) "
                        SQL=SQL&" and VehicleSizeID=0 "  
                        if iAge>0 then
                        SQL=SQL&" and FromAge<="&iAge&" and (ToAge>="&iAge&" or (ToAge=0 and FromAge>0)) "  
                        else  
                        SQL=SQL&" and FromAge=0 "
                        end if
                        SQL=SQL&" and FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0))  " 
                        Set s_in = webConn.Execute(SQL)  '----4
                  if NOT s_in.EOF then 
                                 'Response.Write(SQL)
                           DO WHILE NOT s_in.EOF  
                                    if  s_in("Mandatory")=True then
                                    Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" CHECKED>"&s_in("Name")&"</td><td class=text align=right>"&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                              else
                                       Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&">"&s_in("Name")&"</td><td class=text align=right>"&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                                 end if
                                       s_in.MoveNext
                                       Loop 
                           else
                     SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 and WebItems=1 "
                           SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0)     "
                     SQL=SQL&" and VehicleSizeID=0   "
                           if iAge>0 then
                           SQL=SQL&" and ((FromAge<="&iAge&" and (ToAge>="&iAge&" or (ToAge=0 and FromAge>0))  and FromDay=0) or  (FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0)) and FromAge=0)) "
                           else
                           SQL=SQL&" and ((FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0)) )) "
                           end if   
                           Set s_in = webConn.Execute(SQL) '----5  
                                 if NOT s_in.EOF then 
                                    'Response.Write(SQL)
                              
                              DO WHILE NOT s_in.EOF  
                                                   if  s_in("Mandatory")=True then
                                          Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" CHECKED>"&s_in("Name")&" </td><td class=text align=right> "&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                                    else
                                             Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&">"&s_in("Name")&"</td><td class=text align=right> "&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                                             end if
                                          s_in.MoveNext
                                          Loop 
                                    else
                        SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 and WebItems=1  "
                        SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) "
                        SQL=SQL&"  and VehicleSizeID=0 and FromAge=0 and FromDay=0   "
                              Set s_in = webConn.Execute(SQL)   '----6   
                              
                                             if NOT s_in.EOF then 
                                       'Response.Write(SQL)
                                 DO WHILE NOT s_in.EOF  
                                                      if  s_in("Mandatory")=True then
                                                      Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" CHECKED>"&s_in("Name")&"</td><td class=text align=right> "&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                                                else
                                                         Response.Write("<tr ><td class=text><input type=radio  name=InsuranceID  Value="&s_in("ID")&" >"&s_in("Name")&"</td><td class=text align=right> "&FormatCurrency(s_in("Fees"),2)&"</td></tr>")
                                                   end if
                                       s_in.MoveNext
                                             Loop 
                                     end if
                                 end if
                           
                           end if     
                  end if
         end if                           
      end if
    
      
         Response.Write("</table></td></tr>")
    end if
    s_in.close
    set s_in=nothing     
       
                                      
END SUB
          
 


SUB KmsFeesSelection        '---KmsFree selection logic
        VehicleSizeID=CInt(Request.QueryString("CarSizeID"))
        PickupLocationID =Session("RCM169a_PickupLocationID")
        'TotalDays=  Session("RCM169a_TotalRentalDays")
          '--if 4 + days is unlimited kms, 1 -3 days 100kms free 0.24 per extra kms, 
       '--if the rental is 3.6 days then should be same as 3 days rental 
    
        'TotalDays=  Session("RCM169a_TotalRentalDays")
       '--Session("RCM169a_KmsTotaldays")=Round(Totalmin/1440,2)
       KmsTotaldays=Session("RCM169a_KmsTotaldays")
       if Session("RCM169a_KmsTotaldays") >Fix(Session("RCM169a_KmsTotaldays")) then
             KmsTotaldays=Fix(Session("RCM169a_KmsTotaldays"))
        end if  
      
   SQL="SELECT * from KmsFree WHERE  WebAvaliable=1 and LocationID="&PickupLocationID&"  "
   SQL=SQL&" and VehicleSizeID="&VehicleSizeID&" "  
   SQL=SQL&" and FromDay<="&KmsTotaldays&" and (ToDay>="&KmsTotaldays&" or (ToDay=0 and FromDay>0))  " 
   SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
         Set s_km = webConn.Execute(SQL)
   if NOT s_km.EOF then    '--1
                  Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
             Response.Write("<tr><td>")
         Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
         DO WHILE NOT s_km.EOF
                  maxprice=""
                 if s_km("maxprice")>0 then
                     maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                 end if
                 
            KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                     KmsDesc="Unlimited Kms, daily rate @"&FormatCurrency(s_km("DailyRate"))
                  end if
                  if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                        KmsDesc="Unlimited Kms"
                  end if
                  if s_km("AddKmsFee")>0  and s_km("DailyRate")>0 then
                                    KmsDesc="Daily rate @"&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))&", "&s_km("KmsFree")&" Kms free per day, additional per kms "&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("AddKmsFee"))
                   end if
                  if  s_km("DefaultKM")=True then
               Response.Write("<tr><td class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                  else
                     Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                  end if
            
              s_km.MoveNext
              Loop  
              Response.Write("</table></td></tr>")
   else
            SQL="SELECT * from KmsFree WHERE WebAvaliable=1 and LocationID="&PickupLocationID&" "
            SQL=SQL&" and VehicleSizeID="&VehicleSizeID&"  "
         SQL=SQL&" and FromDay=0  "
         SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
      Set s_km = webConn.Execute(SQL)
      if NOT s_km.EOF then     '--2
                     Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
            Response.Write("<tr><td>")
            Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
            DO WHILE NOT s_km.EOF 
                        maxprice=""
                        if s_km("maxprice")>0 then
                           maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                     end if
                              KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                             if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                              KmsDesc="Unlimited Kms, daily rate @"&FormatCurrency(s_km("DailyRate"))
                              end if
                              if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                              KmsDesc="Unlimited Kms"
                              end if
                              if s_km("AddKmsFee")>0  and s_km("DailyRate")>0 then
                                    KmsDesc="Daily rate @"&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))&", "&s_km("KmsFree")&" Kms free per day, additional per kms "&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("AddKmsFee"))
                           end if
                              if  s_km("DefaultKM")=True then
                           Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                        else
                                 Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                        end if
               s_km.MoveNext
               Loop
               Response.Write("</table></td></tr>") 
      else
         SQL="SELECT * from KmsFree WHERE WebAvaliable=1 and LocationID="&PickupLocationID&" "
                     SQL=SQL&" and VehicleSizeID=0 "  
               SQL=SQL&" and FromDay<="&KmsTotaldays&" and (ToDay>="&KmsTotaldays&" or (ToDay=0 and FromDay>0))  " 
               SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
         Set s_km = webConn.Execute(SQL)
      
         if NOT s_km.EOF then      '--3
                              Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
               Response.Write("<tr><td>")
               Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
               DO WHILE NOT s_km.EOF 
                              maxprice=""
                           if s_km("maxprice")>0 then
                              maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                              end if
                        KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                                 if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                                    KmsDesc="Unlimited Kms, daily rate @"&FormatCurrency(s_km("DailyRate"))
                           end if
                           if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                                    KmsDesc="Unlimited Kms"
                           end if
                           if s_km("AddKmsFee")>0  and s_km("DailyRate")>0 then
                                    KmsDesc="Daily rate @"&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))&", "&s_km("KmsFree")&" Kms free per day, additional per kms "&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("AddKmsFee"))
                   end if
                                 if  s_km("DefaultKM")=True then
                        Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                           else
                                          Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                           end if
                  s_km.MoveNext
                  Loop 
                  Response.Write("</table></td></tr>")
            else
                  SQL="SELECT * from KmsFree WHERE WebAvaliable=1 and LocationID="&PickupLocationID&"  "
                  SQL=SQL&" AND VehicleSizeID=0 "
                  SQL=SQL&" and  FromDay=0   "
                        SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
                  Set s_km = webConn.Execute(SQL)
                        if NOT s_km.EOF then           '--4
                                       Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
                  Response.Write("<tr><td>")
                     Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
                  DO WHILE NOT s_km.EOF 
                                 maxprice=""
                              if s_km("maxprice")>0 then
                                 maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                                 end if
                           KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                                    if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                                       KmsDesc="Unlimited Kms, daily rate @"&FormatCurrency(s_km("DailyRate"))
                              end if
                              if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                                       KmsDesc="Unlimited Kms"
                              end if
                              if s_km("AddKmsFee")>0  and s_km("DailyRate")>0 then
                                    KmsDesc="Daily rate @"&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))&", "&s_km("KmsFree")&" Kms free per day, additional per kms "&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("AddKmsFee"))
                           end if
                                    if  s_km("DefaultKM")=True then
                                 Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                              else
                                    Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                              end if
                           s_km.MoveNext
                           Loop
                           Response.Write("</table></td></tr>")
                           else
                     
                SQL="SELECT * from KmsFree WHERE WebAvaliable=1 and LocationID=0  "
                SQL=SQL&" AND VehicleSizeID="&VehicleSizeID&"  "
                SQL=SQL&" and FromDay<="&KmsTotaldays&" and (ToDay>="&KmsTotaldays&" or (ToDay=0 and FromDay>0))  " 
                SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
                      Set s_km = webConn.Execute(SQL)
                   
                if NOT s_km.EOF then        '--5
                         ' Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
                  Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
                  Response.Write("<tr><td>")
                  Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
                  DO WHILE NOT s_km.EOF 
                           maxprice=""
                              if s_km("maxprice")>0 then
                                       maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                                 end if
                           KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                              if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                                       KmsDesc="Unlimited Kms, dily rate @"&FormatCurrency(s_km("DailyRate"))
                              end if
                              if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                                       KmsDesc="Unlimited Kms"
                              end if
                                             if  s_km("DefaultKM")=True then
                              Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                              else
                                 Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                              end if      
                           s_km.MoveNext
                           Loop
                           Response.Write("</table></td></tr>")
               else  
                     SQL="SELECT * from KmsFree WHERE WebAvaliable=1 and LocationID=0  "
               SQL=SQL&" and VehicleSizeID="&VehicleSizeID&"  "
                  SQL=SQL&" and FromDay=0  "
                  SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
                     Set s_km = webConn.Execute(SQL)
                    if NOT s_km.EOF then     '---6
                                       Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
                     Response.Write("<tr><td>")
                        Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
                     DO WHILE NOT s_km.EOF 
                                    maxprice=""
                                       if s_km("maxprice")>0 then
                                          maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                                          end if
                                    KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                                 if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                                          KmsDesc="Unlimited Kms, dily rate @"&FormatCurrency(s_km("DailyRate"))
                                 end if
                                 if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                                          KmsDesc="Unlimited Kms"
                                 end if
                
                                 if  s_km("DefaultKM")=True then
                                    Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                                 else
                                          Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                                 end if
                                    s_km.MoveNext
                                    Loop
                                    Response.Write("</table></td></tr>")
                                        else
                        SQL="SELECT * from KmsFree WHERE WebAvaliable=1 and LocationID=0  "
                  SQL=SQL&" AND VehicleSizeID=0 "
                  SQL=SQL&" and FromDay<="&KmsTotaldays&" and (ToDay>="&KmsTotaldays&" or (ToDay=0 and FromDay>0))  " 
                  SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
                        Set s_km = webConn.Execute(SQL)
                       if NOT s_km.EOF then        '---7
                                                   Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
                            Response.Write("<tr><td>")
                            Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
                        DO WHILE NOT s_km.EOF 
                                    maxprice=""
                                       if s_km("maxprice")>0 then
                                       maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                                          end if
                                    KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                                 if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                                          KmsDesc="Unlimited Kms, dily rate @"&FormatCurrency(s_km("DailyRate"))
                                 end if
                                 if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                                          KmsDesc="Unlimited Kms"
                                 end if
                
                           if  s_km("DefaultKM")=True then
                                 Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                                 else
                                       Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                                 end if
                                       s_km.MoveNext
                                       Loop  
                                       Response.Write("</table></td></tr>")
                                       else
                           SQL="SELECT * from KmsFree WHERE WebAvaliable=1 and LocationID=0  "
                           SQL=SQL&" AND VehicleSizeID=0 "
                           SQL=SQL&" and  FromDay=0   "
                                       SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
                                Set s_km = webConn.Execute(SQL)
                                 if NOT s_km.EOF then       '---8
                                                     Response.Write("<TR height=22 bgColor="&Session("RCM169a_CompanyColour")&" ><td  align=center class=header>Select Kms Option</td></tr>")
                           Response.Write("<tr><td>")
                           Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
                           DO WHILE NOT s_km.EOF 
                                             maxprice=""
                                          if s_km("maxprice")>0 then
                                                   maxprice=", max charge "&FormatCurrency(s_km("maxprice"))&" per day"
                                                end if
                                                KmsDesc=s_km("KmsFree")&" Kms free per day, additional per Kms "&FormatCurrency(s_km("AddKmsFee"))&" "&maxprice
                                                   if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")>0 then
                                                      KmsDesc="Unlimited Kms, daily rate @"&FormatCurrency(s_km("DailyRate"))
                                       end if
                                       if s_km("AddKmsFee")=0 and s_km("KmsFree")=0 and s_km("DailyRate")=0 then
                                                      KmsDesc="Unlimited "&Session("Mileage")
                                       end if
                                       if s_km("AddKmsFee")>0  and s_km("DailyRate")>0 then
                                    KmsDesc="Daily rate @"&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("DailyRate"))&", "&s_km("KmsFree")&" Kms free per day, additional per kms "&Session("RCM154_CompanyCurrency")&""&FormatNumber(s_km("AddKmsFee"))
                                    end if
                                       if  s_km("DefaultKM")=True then
                                    Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"' CHECKED>"&KmsDesc&"</option>")
                                       else
                                          Response.Write("<tr><td  class=text><input type=radio  name=KmsFreeID   value='"&s_km("ID")&"'>"&KmsDesc&"</option>")
                                       end if
                                    s_km.MoveNext
                                    Loop  
                                    Response.Write("</table></td></tr>")
                                                      end if 
                                               
                                    end if
                                 
                                    end if
                                  
                                       end if 
                                      
                                 end if
                               
                        end if
                        
         end if 
                                       
    end if 
      
    s_km.close
    set s_km=nothing 
 
END SUB 
%>

      <table width=100% height="122" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      <td align="center" valign="top"><img src="graphics/burswoodBanner.jpg" alt="Burswood Car Rentals" name="cars" width="599" height="133" border="0" usemap="#carsMap" id="cars" /></td>
      </tr>
      </table>

<TABLE  width=599 align=center bgcolor=<%=Session("RCM169a_CompanyColour")%>   cellSpacing=0 cellPadding=1  border=0><tr><td>
<TABLE width=510 align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=0  border=0>
<tr height=20><td  align=center class=header bgColor=<%=Session("RCM169a_CompanyColour")%>  >STEP 3 - Car Rental Pickup & Dropoff Dates & Times</td></tr>
<tr><td>
  <%  
       if Request.QueryString("CarSizeID")="" then
               Session("RCM2_ErrorMesage")="Please select the vehicle."
               Response.Redirect "webAgentBooking1.asp"
     end if

      '--22/Jul/2008
        SQL="SELECT Rate12Hour FROM CarSize WHERE ID="&CInt(Request.QueryString("CarSizeID"))&"   "
               'Response.Write(SQL)
        Set s_g=webConn.Execute(SQL)




         '--get Rate Type(12 or 24 hour) for each category . Pegasus case?-----------
           if (Session("RCM169a_KmsTotaldays")-Fix(Session("RCM169a_KmsTotaldays")))>0.5 then '--if less then 12 hours booking do not need add other day..
                  SQL="SELECT Rate12Hour FROM CarSize WHERE ID='"&CInt(Request.QueryString("CarSizeID"))&"'   "
               'Response.Write(SQL)
            Set s_g=webConn.Execute(SQL)
               if s_g("Rate12Hour")=True then
                     '--do not use totalRentalDays +1, every time reflash screen will add 1 more day, use Session("RCM169a_KmsTotaldays")
                     Session("RCM169a_TotalRentalDays")= Session("RCM169a_KmsTotaldays")+1
                        if  Session("RCM169a_TotalRentalDays") > Fix(Session("RCM169a_TotalRentalDays")) then
                     Session("RCM169a_TotalRentalDays")=Fix(Session("RCM169a_TotalRentalDays"))+1
                        end if
               end if
               s_g.close
            Set s_g=nothing
                      ' 'Response.Write(Session("RCM169a_TotalRentalDays"))
         end if

      RequestPickDate = Session("RCM169a_RequestPickDate")
        RequestPickTime=Session("RCM169a_RequestPickTime")
      RequestDropDate = Session("RCM169a_RequestDropDate")
        RequestDropTime=Session("RCM169a_RequestDropTime")
        RequestPickDateTime = CDate(RequestPickDate&" "& RequestPickTime)   
        RequestDropDateTime =CDate(RequestDropDate&" "& RequestDropTime)
       
          Response.Write("<table>")
    Response.Write("<tr><td></td><td width=120 align=left class=text>Pickup Location:</td><td align=left class=text colspan=2> ")
          Response.Write(Session("RCM169a_PickupLocation"))
          Response.Write("</td></tr>")
                       
           Response.Write("<tr><td></td><td align=left class=text>Pickup Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("RCM169a_RequestPickDate")))&", ")
           Response.Write(Day(Session("RCM169a_RequestPickDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestPickDate"))),3)&"/"&Year(Session("RCM169a_RequestPickDate")))
           Response.Write("&nbsp;")
           Response.Write(Session("RCM169a_RequestPickTime"))
          Response.Write("</td></tr>")
                        
          
                        
           Response.Write("<tr><td></td><td align=left class=text>Return Location: </td><td align=left class=text colspan=2>")
           Response.Write(Session("RCM169a_DropoffLocation"))
           Response.Write("</td></tr>")
                      
           Response.Write("<tr><td></td><td align=left class=text>Return Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("RCM169a_RequestDropDate")))&", ")
           Response.Write(Day(Session("RCM169a_RequestDropDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestDropDate"))),3)&"/"&Year(Session("RCM169a_RequestDropDate")))
           Response.Write("&nbsp;")
           Response.Write(Session("RCM169a_RequestDropTime"))
           Response.Write("</td></tr>")
                      
                  
        
   
        '----------the form-------------
        Response.Write("<form method=post action='webAgentBooking4.asp?dir=Rate'  name='Rate'  >")
       Response.Write("<input type='hidden' name='CarSizeID' size=5 value='"&CInt(Request.QueryString("CarSizeID"))&"'>")

        '-----Start Hourly Rate ------------
        '----1st need find the extra hours in which season, (use the extra hours as a day to find the season)
        '--- need a acture No of Days (actureTotalDays) and actureNoOfDaysEachSeason to find out the extra hours in which season 
        '---if there are hourly rate set up then use it for calculattion
       '----if the total cost for the no of hours > = one day rate, then do not calculate hourly rate
    
        theExtraHour=0
        HourRate=0
        if Session("RCM169a_RequestPickTime")<> Session("RCM169a_RequestDropTime") then
            theExtraHour=Round(((1440*(CDate(Session("RCM169a_RequestDropDate")&" "& Session("RCM169a_RequestDropTime")) - CDate(Session("RCM169a_RequestDropDate")&" "& Session("RCM169a_RequestPickTime")))-Session("RCM169a_Graceperiod")) /60),2)
                if  theExtraHour > Fix(theExtraHour)  then 
                  theExtraHour=Fix(theExtraHour)+1
            end if
                'theExtraHour=Round(theExtraHour,2)
                'Response.Write(theExtraHour)
            'Response.Write("<br>")
            SQL="SELECT * from CarRateHourly WHERE (LocationID)='"&Session("RCM169a_PickupLocationID")&"'  and HourFrom<"&theExtraHour&" and HourTo>="&theExtraHour&" "
                'Response.Write(SQL)
                SET s_hr=webConn.Execute(SQL)
               if Not s_hr.EOF then 
                  HourRate=s_hr("HourlyRate") 
                  if   theExtraHour*s_hr("HourlyRate")>=100  then
                  '----if the total cost for the no of hours > = one day rate, then do not calculate hourly rate
                        '--reset to 0
                        theExtraHour=0
                        HourRate=0
                  end if
                  
                end if 
                s_hr.close
                set s_hr=nothing
        end  if
        '-----END Hourly Rate ------------
            Response.Write("<input type=hidden name=HourRate value='"&HourRate&"'>")                  'SeasonCount  
     
               
      
     
        
    '---1. get the no of days for each season----
    '---2. For each car type, get each season rate, then calculate the total cost for each car type---
             TotalDays=  Session("RCM169a_TotalRentalDays")
     
      'Response.Write(Session("RCM169a_TotalRentalDays"))
                                                                                                    
          'SQL="SELECT QSeason.* from QSeason, Location where LocationID=Location.ID AND CityCode='"&Session("RCM169a_PickupLocationCode")&"' and notActive=0 and (Season='Default' or (EndDate>='"&RequestPickDate&"' and StartDate<='"&RequestDropDate&"')  ) order by QSeason.ID DESC "
          SQL="SELECT * from Season where LocationID="&Session("RCM169a_PickupLocationID")&" and notActive=0 and (Season='Default' or  (EndDate>='"&RequestPickDate&"' and StartDate<='"&RequestDropDate&"')  ) order by Season.ID DESC "
        'Response.Write(SQL)
          SET s_m=webConn.Execute(SQL)
                        
    HeightSeasonDays=0
    TotalCost=0   
         i=0
            
             DO WHILE NOT s_m.EOF
             '_____________ calculate the no of days for each season
               NoOfDaysEachSeason=0
               actureNoOfDaysEachSeason=0 ' to find out extra Hours in which season
                  '--for special seasons, the calculate no of days  
               if s_m("Season") <>"Default" and Session("RCM169a_TotalRentalDays")-HeightSeasonDays>0 then          ' for not default season
                 '--need use Season start and End Datetime for calculating the No of days (with PickupDateTime, dorpoffDateTime)
                  SeasonStartTime="00:00:00"  
            SeasonStartingDateTime=CDate(s_m("StartDate")&" "& SeasonStartTime)
                 SeasonEndingDateTime=s_m("EndDate")
                        '---if the time diff >12 hours then 
                       'IF  (Round((SeasonStartingDateTime-RequestPickDateTime)*1440,2)/60)=>12  and Round((RequestDropDateTime-SeasonStartingDateTime)*1440,2)/60>12 then     
                      IF  (Round((SeasonStartingDateTime-RequestPickDateTime)*1440,2)/60)=>12  and Round((RequestDropDateTime-SeasonStartingDateTime)*1440,2)/60>0 then     
                           ' _____________ calculate the no of days in each season
                               'if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60=>12 then    '4--Dropoffdate > seasonEnd
                          if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60>=0  then    
                               '--the season strat time should be same as Pickup time
                                 SStartingDateTime=CDate(s_m("StartDate")&" "& Session("RCM169a_RequestPickTime"))
                         themin= Round((RequestDropDateTime - SStartingDateTime)*1440-Session("RCM169a_Graceperiod"),2)
                  if  themin<0 then 
                           themin=0
                   end if
                   NoOfDaysEachSeason=themin/1440 
                   actureNoOfDaysEachSeason=themin/1440    
                   if  NoOfDaysEachSeason > Fix(NoOfDaysEachSeason) then
                        NoOfDaysEachSeason=Fix(NoOfDaysEachSeason)+1
                   end if
                                 'Response.Write("<p>2 "&s_m("Season")&" "&NoOfDaysEachSeason&" ") 
                          else
                              NoOfDaysEachSeason=DateDiff("d", s_m("StartDate"),s_m("EndDate"))  
                             actureNoOfDaysEachSeason=DateDiff("d", s_m("StartDate"),s_m("EndDate"))  
                              'Response.Write("<p>6 "&s_m("Season")&" "&NoOfDaysEachSeason&" ") 
                     end if
                         'ELSEIF   (Round((SeasonStartingDateTime-RequestPickDateTime)*1440,2)/60)<12  and Round((SeasonEndingDateTime - RequestPickDateTime )*1440,2)/60=>12 then     
                        ELSEIF   (Round((SeasonStartingDateTime-RequestPickDateTime)*1440,2)/60)<12  and Round((SeasonEndingDateTime - RequestPickDateTime )*1440,2)/60=>0 then     
                               'if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60>12 then    '4--Dropoffdate > seasonEnd
                            if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60>=0  then    
                                  themin= Round((RequestDropDateTime - RequestPickDateTime)*1440-Session("RCM169a_Graceperiod"),2)
                   if  themin<0 then 
                           themin=0
                   end if
                   NoOfDaysEachSeason=themin/1440 
                   actureNoOfDaysEachSeason=themin/1440
                    if  NoOfDaysEachSeason > Fix(NoOfDaysEachSeason) and (HeightSeasonDays+NoOfDaysEachSeason)<TotalDays  then
                        NoOfDaysEachSeason=Fix(NoOfDaysEachSeason)+1
                      else
                   NoOfDaysEachSeason=Fix(NoOfDaysEachSeason)
                   end if 
                                 'Response.Write("<p>4 "&s_m("Season")&" "&NoOfDaysEachSeason&" ---"&theDays&"")  
                         else      
                             '--the season end time should be same as Return Time
                                 SEndingDateTime=CDate(s_m("EndDate")&" "& Session("RCM169a_RequestPickTime"))
                         themin= Round((SEndingDateTime - RequestPickDateTime)*1440,2)
                  if  themin<0 then 
                           themin=0
                   end if
                  NoOfDaysEachSeason=0
                   NoOfDaysEachSeason=themin/1440
                   actureNoOfDaysEachSeason=themin/1440     
                   if  NoOfDaysEachSeason > Fix(NoOfDaysEachSeason) then
                        NoOfDaysEachSeason=Fix(NoOfDaysEachSeason)
                   end if 
                   SeasonLong  = (s_m("EndDate")-s_m("StartDate"))
                   if NoOfDaysEachSeason >SeasonLong then
                        NoOfDaysEachSeason  = SeasonLong
                   end if
                   if (Round((SeasonStartingDateTime-RequestPickDateTime)*1440,2)/60)<0 and TotalDays=1 then
                                          NoOfDaysEachSeason=NoOfDaysEachSeason-1
                                end if
                                 'Response.Write("<p>3 "&s_m("Season")&" "&NoOfDaysEachSeason&" ")
                          end if 
                  END IF



                      HeightSeasonDays=HeightSeasonDays+NoOfDaysEachSeason  ' add the height seasons days up
             elseif s_m("Season") ="Default" and Session("RCM169a_TotalRentalDays")-HeightSeasonDays>0 then
                        '___________the default Season, days = total days -provices seasons days 
                     NoOfDaysEachSeason=Session("RCM169a_TotalRentalDays")-HeightSeasonDays
                      actureNoOfDaysEachSeason=actureTotalDays-HeightSeasonDays
             end if
              'Response.Write(NoOfDaysEachSeason)
             'Response.Write(Round(actureNoOfDaysEachSeason,2))
             'Response.Write("<br>")
             actureNoOfDaysEachSeason=Round(actureNoOfDaysEachSeason,2)
            
             SeasonCost=0
             if NoOfDaysEachSeason>0 then
                  i=i+1
                  if s_m("Season")="Default" then
                        Season="Standard Rates" 
                        Session("RCM169a_Season"&i&"")="Standard Rates"
                        
                     else
                     Season=s_m("Season")
                     Session("RCM169a_Season"&i&"")=s_m("Season")
                  end if  
                         
                     '--pass the seasonID as array
                        Session("RCM169a_SeasonID"&i&"")=s_m("ID")
                      ' Session("RCM169a_NoOfDaysEachSeason"&i&"")=NoOfDaysEachSeason
               
                     
                        GetEachSeasonRateStructureID  
                         '---the code has to be here after get the RateStructureID-------------------
         '---need find the last season
            '----if there are extra Hours and hour rate <>0 , reset the noOfDays for each season 
              if actureNoOfDaysEachSeason<>NoOfDaysEachSeason then
                     if  theExtraHour<>0 and  HourRate<>0 then
                           NoOfDaysEachSeason=NoOfDaysEachSeason-1+ theExtraHour*HourRate/100
                               'Response.Write("<br>theExtraHour=")
                        'Response.Write(theExtraHour) 
                        'Response.Write("-----HourRate=")
                        'Response.Write(HourRate) 
                        'Response.Write("---noOfDays") 
                        'Response.Write(Round(NoOfDaysEachSeason,2)) 
            end if
            end if  
               Session("RCM169a_NoOfDaysEachSeason"&i&"")=NoOfDaysEachSeason
                        '--pass all following to Step3.asp for get the rate again
                        Response.Write("<input type='hidden' name='actureNoOfDaysEachSeason"&i&"' size=5 value='"&actureNoOfDaysEachSeason&"'>")    
                        Response.Write("<input type='hidden' name='NoOfDaysEachSeason"&i&"' size=5 value='"&NoOfDaysEachSeason&"'>")    
                        'Response.Write("<input type=hidden name='StandardRate"&i&"' size=3 value="&FormatNumber(Rate,2)&" >")      
                    Response.Write("<input type='hidden' name='Season"&i&"' size=5 value='"&Session("RCM169a_Season"&i&"")&"'>")
                       Response.Write("<input type='hidden' name='SeasonID"&i&"' size=5 value='"&s_m("ID")&"'>")    
                       Response.Write("<input type='hidden' name='RateName"&i&"' size=5 value='"&s_m("ID")&"'>")    
                        
                  
               end if     
                  s_m.MoveNext
            Loop   
            s_m.Close  
                 Response.Write("<input type=hidden name='SeasonCount' value='"&i&"'>")                  'Count
          SeasonCount=i
               
       
               
               
                '---get car type, for each car type, get each season rate, then calculate total cost for each type     
          findTheRate2 
         Response.Write("</table>")
              Response.Write("</td></tr>")
    
         InsuranceExtra 
                
          ExtraForm 
                 KmsFeesSelection 
                Response.Write("</table>")   
                Response.Write("</td></tr>") 
                Response.Write("<TR height=2><td colspan=4 bgColor="&Session("RCM169a_CompanyColour")&"  ></td></tr>")
          Response.Write("<tr height=30 ><td  colspan=4 align=right class=text><INPUT TYPE=button NAME=Back  VALUE=Back  class=button onClick='javascript:history.back(-1)'>&nbsp;&nbsp;")
          Response.Write("<input type=submit class=button value='Continue'  /></td></form></tr></table>")

          '      Response.Write("<tr bgColor=#FFFFFF><td  colspan=4 align=right class=text><a href=javascript:history.go(-1)><img src='back.gif' alt='Back to Previous Page' border=0></a>&nbsp;&nbsp;<input name=submit type=image alt=Continue src=continue.gif width=95 height=25 hspace=0 vspace=0  /></td></form></tr></table>")
          '---Response.Write(" </td></tr></table></td></tr></table>")
            Response.Write(" </td></tr></table>")
          
      webConn.CLOSE 
          set  webConn=nothing
%> </td></tr></table>  
    <br> </td></tr></table>  
    </td>
     </tr>
      <tr> <td valign="bottom"> </td></tr>
      </table>
    </td>
  </tr>
</table> 
