<%
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
SELECT {   font-family: Arial;font-size: 8pt;color: #666666; }
.button {   font-family: Arial;font-size: 8pt;color: #666666; }
input  {   font-family: Arial;font-size: 8pt;color: #666666; }
.red  {  font-family: Arial;font-size: 9pt;color: red; font-weight: bold;}
</STYLE>

</head>
   
 
<%     Session("RCM169a_CompanyColour")="#FF8000" '---the booking form color is blue, web designer can change it here

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

SUB  GetAgentInfo            '---agency , Discount information
     Session("RCM169a_DiscountRate") =0
     Session("RCM169a_DiscountType")="p"
     Session("RCM169a_DiscountID")=0
     Session("RCM169a_DiscountName")=""
      Session("RCM169a_AgentBranchID")=0
      DiscountRate=0 
      DiscountID=0 
      DiscountType="p"
      if Request.Form("AgencyName")<>"" then
         Session("RCM169a_AgencyName") =tidyup(Request.Form("AgencyName"))
      end if
      if Request.Form("AgentEmail")<>"" then
         Session("RCM169a_AgentEmail") =tidyup(Request.Form("AgentEmail"))
      end if

     AgencyCode=tidyup(Request.Form("AgencyCode"))


    '-------------validate agent code----------------------------     
     SQL="SELECT Agency ,Agency.DiscountID, Agency.Commission, Agency.CommissionType, "
     SQL=SQL&" Branch, BranchCode,  AgencyBranch.ID AS BranchID, "
     
      SQL=SQL&" AgencyBranch.Email AS BranchEmail, "
      SQL=SQL&" AgencyBranch.DiscountID AS BDiscountID, "
     SQL=SQL&" AgencyBranch.Commission AS BCommission, "
     SQL=SQL&" AgencyBranch.CommissionType AS BCommissionType "
     SQL=SQL&" FROM  AgencyBranch, Agency "
     SQL=SQL&" WHERE AgencyID=Agency.ID "
      SQL=SQL&" AND (BranchCode = '"&AgencyCode&"'  "
      SQL=SQL&" or AgencyBranch.IATACode = '"&AgencyCode&"' ) "
      'Response.Write(SQL)
     Set s_ag = webConn.Execute(SQL) 
     if Not s_ag.EOF then
         'Response.Write(SQL)
            if Session("RCM169a_AgentEmail") ="" then
               Session("RCM169a_AgentEmail") =s_ag("BranchEmail")
            end if
            Session("RCM169a_Agency")= s_ag("Agency")
            Session("RCM169a_Branch")= s_ag("Branch")
            Session("RCM169a_AgencyCode")=tidyup(s_ag("BranchCode")) '--for insert AgencyCode to Reservation Table
            Session("RCM169a_AgentBranchID")= s_ag("BranchID")
            Session("RCM169a_AgentCommission")=0
            Session("RCM169a_BCommissionType")=""
            if  s_ag("BCommission")<>0  then
                  Session("RCM169a_AgentCommission")=s_ag("BCommission")
                  Session("RCM169a_BCommissionType")=s_ag("BCommissionType")
                    
            else
                  Session("RCM169a_AgentCommission")=s_ag("Commission")
                  Session("RCM169a_BCommissionType")=s_ag("CommissionType")
            end if   
            'Response.Write(s_ag("BDiscountID"))
            'Response.Write(Session("RCM169a_AgentCommission"))
            '----If Branch Customer Pricing is 0 then use Agencies Customer Pricing 
            if s_ag("BDiscountID")<>0 then
                  SQL="SELECT ID,DiscountType,DiscountRate,DiscountName FROM Discount where ID="&s_ag("BDiscountID")&" "
            else
                  SQL="SELECT ID,DiscountType,DiscountRate,DiscountName FROM Discount where ID="&s_ag("DiscountID")&" "
            end if
            'Response.Write("<p>")
            'Response.Write(SQL)
            Set s_cp = webConn.Execute(SQL)
            if  Not s_cp.EOF then
                  Session("RCM169a_DiscountRate") =s_cp("DiscountRate")  '--need session disocunt here
                  Session("RCM169a_DiscountID")= s_cp("ID")
                  Session("RCM169a_DiscountType")=s_cp("DiscountType")
                  Session("RCM169a_DiscountName")=s_cp("DiscountName")
                  DiscountType=s_cp("DiscountType")
                  DiscountRate=s_cp("DiscountRate")  
                  DiscountID=s_cp("ID")
                  'Response.Write("<Br>DiscountType=") 
                  'Response.Write(Session("RCM169a_DiscountType"))
                  'Response.Write("<Br>DiscountRate=")
                  'Response.Write(DiscountRate)
            end if
            s_cp.close
            Set s_cp =Nothing
        else
               Session("RCM169a_ErrorMesage")="  Invalid Agency Code ."
               Session("RCM169a_AgencyCode")=""
         
               Session("RCM169a_AgencyName") =""
               Session("RCM169a_AgentEmali") =""
               Response.Redirect "webAgentBooking1.asp"
              
        end if
        s_ag.close
        Set s_ag = Nothing


END SUB         
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
          '========new code========
          if  theExtraHour<>0 and actureNoOfDaysEachSeason >=1 and HourRate<>0 then      '---if 1.4 days should use a 1 day rate  not 2 day rate., need add condition "theExtraHour=0" here for add 1 day up
                DaysForRate=Fix(actureNoOfDaysEachSeason)                                '--HourRate<>0, if hourRate has set up, otherwise charge 1.4 days as 2 day rate
         end if
         '========end new code========
      
        if longHireRate="Yes" then    
               DaysForRate= TotalDays '--TOTAL booking days 
                '========new code========
                if  theExtraHour<>0 and actureTotalDays >=1 and HourRate<>0 then  '---if 1.4 days should use a 1 day rate but not 2 day rate, need add condition "theExtraHour=0" here for add 1 day up
                  DaysForRate=Fix(actureTotalDays)
                  end if
               '========end new code======== 
        end if 
       'Response.Write("<br>test"&TotalDays&"</br>")  
       
       
        '--for a 3.5 days booking should use 3 days rate(the  higher rate) not the 4 days rate
        if  DaysForRate > Fix(DaysForRate) then
         DaysForRate=Fix(DaysForRate)
         end if   
      

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
                          if s_rs("ToDay")=0 then
                           ToDay=999999
                        else
                           ToDay=s_rs("ToDay")
                        end if
                        FromDay=s_rs("FromDay")
                        ' if NoOfDaysEachSeason =>s_rs("FromDay") and NoOfDaysEachSeason =<ToDay then
                        if DaysForRate =>s_rs("FromDay") and DaysForRate =<ToDay then
                               'Response.Write("<br>"&s_rs("ID")&". "&s_rs("RateName")&":&nbsp;"&s_rs("FromDay")&" - "&s_rs("ToDay")&"&nbsp;")
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

      Response.Write("<TABLE  width=599  align=center bgcolor="&Session("RCM169a_CompanyColour")&"   cellSpacing=0 cellPadding=1  border=0><tr><td>")
      Response.Write("<TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>")
      Response.Write("<tr height=20><td  align=center class=header bgColor="&Session("RCM169a_CompanyColour")&"  colspan=4>Agent Booking Request (Step 2 of 4) - Select your preferred vehicle & click on Continue</td></tr>")
      Response.Write("<tr><td colspan=4 >")
        
   '----get all car Category  display the webAvaliable category    

  '---allow muti-records for Unavailable booking perioed, only select distinc record 1st
       SQL=" SELECT  Distinct  CategoryID,CarSize.* "
       SQL=SQL&"   FROM WebLocationCategory,CarSize "
       SQL=SQL&" WHERE (LocationID)='"&Session("RCM169a_PickupLocationID")&"' "
       SQL=SQL&" AND CategoryID=CarSize.ID "
        SQL=SQL&"and AgentAvaliable=1 "
     SQL=SQL&" AND CategoryTypeID='"&Session("RCM169a_CategoryTypeID")&"'  "
  SQL=SQL&" ORDER By Orders,Size  "


'Response.Write SQL

   Set s_cs=webConn.Execute(SQL)
         Response.Write("<table align=center border=0 cellspacing=1 cellpadding=0 ><tr align=center>")

       
        j=0
      DO WHILE NOT s_cs.EOF    'for each car Category

                categoryAvaliable="Yes"
             ' ++++++++++++
          LocationRate=0
            '--for each location catgory check all muti unavailabe record  ....
                  SQL=" SELECT UnavaliableFrom,UnavaliableTo,MinBookingDay  FROM WebLocationCategory "
                  SQL=SQL&" WHERE CategoryID="&s_cs("CategoryID")&" and (LocationID)='"&Session("RCM169a_PickupLocationID")&"' "
                Set s_min=webConn.Execute(SQL)
                Unavailable="False"
                MinBookingDay=0
                DO WHILE NOT s_min.EOF    'for each record
                      if s_min("MinBookingDay")>MinBookingDay and Year(s_min("UnavaliableFrom"))=2100 then
                            MinBookingDay=s_min("MinBookingDay")
                           'categoryAvaliable="No"
                     'Response.Write(s_min("MinBookingDay"))
                      end if
                      if ( DateDiff("d", RequestPickDate, (s_min("UnavaliableTo")) )>=0  AND  DateDiff("d", RequestDropDate, (s_min("UnavaliableFrom")) )<=0 ) OR ( DateDiff("d", RequestPickDate, (s_min("UnavaliableFrom")) )>=0  and DateDiff("d", RequestDropDate, (s_min("UnavaliableFrom")) )<=0 )  OR (DateDiff("d", RequestPickDate, (s_min("UnavaliableFrom")) )<=0 and DateDiff("d", RequestPickDate, (s_min("UnavaliableTo")) )>=0 ) then
                           Unavailable="True"
                     end if
                s_min.MoveNext
            Loop
            s_min.Close
            set s_min=nothing





               '--10/Mar/09, nwe code, check MinBookingDay for each category  ---
                 SQL = "SELECT  top 1 MinBookingDay,WebAvaliable FROM WebRelocationFees where CarSizeID="&s_cs("ID")&" "
                SQL=SQL&" and (PickupLocationID) ='"&Session("RCM169a_PickupLocationID")&"' and (DropoffLocationID)='"&Session("RCM169a_DropoffLocationID")&"' "
                SQL=SQL&" AND ((PickupDateFrom<='"&Session("RCM169a_RequestPickDate")&"'  and PickupDateTo >= '"&Session("RCM169a_RequestPickDate")&"') "
                 SQL=SQL&" or  PickupDateFrom='2100-01-01') "
                SQL=SQL&" order by PickupDateFrom "
                Set s_re=webConn.Execute(SQL)
                if Not s_re.EOF then
                     if  s_re("WebAvaliable") =False then
                          categoryAvaliable="No"
                          LocationRate=0
                          'Response.Write(categoryAvaliable)
                     else
                           if s_re("MinBookingDay") > TotalRentalDays then
                              MinBookingDay=s_re("MinBookingDay")
                                 categoryAvaliable="No"
                              end if
                     end if


               else
                        s_re.close
                       set s_re=nothing
                       SQL = "SELECT  top 1 MinBookingDay,WebAvaliable FROM WebRelocationFees where CarSizeID=0 "
                        SQL=SQL&" and (PickupLocationID) ='"&Session("RCM169a_PickupLocationID")&"' and (DropoffLocationID)='"&Session("RCM169a_DropoffLocationID")&"' "
                        SQL=SQL&" AND ((PickupDateFrom<='"&Session("RCM169a_RequestPickDate")&"'  and PickupDateTo >= '"&Session("RCM169a_RequestPickDate")&"') "
                        SQL=SQL&" or  PickupDateFrom='2100-01-01') "
                        SQL=SQL&" order by PickupDateFrom "
                         Set s_re=webConn.Execute(SQL)
                          if Not s_re.EOF then
                              if  s_re("WebAvaliable") =False then
                                    categoryAvaliable="No"
                                    LocationRate=0
                                    'Response.Write(categoryAvaliable)
                              else
                                    if s_re("MinBookingDay") > TotalRentalDays then
                                      MinBookingDay=s_re("MinBookingDay")
                                       categoryAvaliable="No"
                                    end if
                              end if

                         end if


               end if
               'Response.Write(SQL)
               s_re.close
                       set s_re=nothing




          if  categoryAvaliable="Yes"  then
               LocationRate=0
               for i=1 to SeasonCount
                         
                  if Session("RCM169a_AgencyRateTypeID")>0 then
                     SQL="SELECT Rate FROM AgencyRateDetails,AgencyRate  "
                     SQL=SQL&" where AgencyRateTypeID="&Session("RCM169a_AgencyRateTypeID")&" "
                     SQL=SQL&" and AgencyRate.ID=CarRatesID "
                     SQL=SQL&" and CarSizeID="&s_cs("ID")&"  "
                     SQL=SQL&" and CarRateStructureID="&Session("RCM169a_RateStructureID"&i&"")&" "
                     SQL=SQL&" and SeasonID="&Session("RCM169a_SeasonID"&i&"")&" "
                     SQL=SQL&" and LocationID="&Session("RCM169a_PickupLocationID")&"  "
                     'Response.Write("<p>")
                     'Response.Write(SQL)
                     Set s_m=webConn.Execute(SQL)
                     Rate=0
                     if NOT s_m.EOF   then
                           '----only display the rate if the rate >0
                           LocationRate=s_m("Rate")
                     end if
                     s_m.close
                     set s_m=nothing
                  else
                     '--for each Season Rate
                     SQL="SELECT * FROM QCarRateDetails "
                     SQL=SQL&"WHERE CarSizeID="&s_cs("ID")&" "
                     SQL=SQL&"AND CarRateStructureID="&Session("RCM169a_RateStructureID"&i&"")&" "
                     SQL=SQL&"AND (SeasonID)='"&Session("RCM169a_SeasonID"&i&"")&"' "
                     'Response.Write(SQL)
                     Set s_m=webConn.Execute(SQL)
                     Rate=0
                     if NOT s_m.EOF   then
                            '----only display the rate if the rate >0
                            LocationRate=s_m("Rate")
                     end if
                     s_m.close
                     set s_m=nothing
                  end if
                        
                 next   '---end check if rate >0 then display on the website--------------
               'Response.Write(s_cs("Size"))
               'Response.Write(s_cs("WebDesc"))
               'Response.Write(LocationRate)
               'Response.Write("<br>")
            END IF
            
            'IF LocationRate>0 then
               
            
            '--for each season, get the rate
                  j=j+1
                '--check if image exists-------------
            Dim fs
            theimage=RCMURL&"/DB/"&CompanyCode&"/"&s_cs("ImageName")
        
            Response.Write("<td width=8>&nbsp;</td><td align=center >")
           
            Response.Write("<table width=175 height=150 align=center border=0 bgcolor=#999999 cellspacing=0 cellpadding=1 ><tr align=center><td>")
       
             Response.Write("<table width=100%  height=150  align=center border=0 bgcolor=#ffffff cellspacing=0 cellpadding=0>")

                       

               Response.Write("<tr><td class=formtext align=center colspan=5 ><FONT COLOR=red>"&s_cs("WebDesc")&"</a></td></tr>")
               Response.Write("<tr><td class=formtext align=center colspan=5 >"&s_cs("VehicleDesc")&"</td></tr>")
               Response.Write("<tr><td class=formtext align=center colspan=5 nowrap>"&s_cs("Categoryspecial")&"</td></tr>")
             
               Response.Write("<tr width=100% align=center height=1 bgcolor=#C0C0C0><td colspan=5 ></td></tr>")
               Response.Write("<tr align=center><td colspan=5><img src="&theimage&" WIDTH=100 ></td></tr>")
               Response.Write("<tr width=100% align=center height=1 bgcolor=#C0C0C0><td colspan=5 ></td></tr>")
               Response.Write("<tr height=22>")

               if s_cs("noSmallCase")<>"0" then
                     Response.Write("<td class=formtext><IMG SRC='SmallCase.gif' title='No. of Small Case'  BORDER=0>x"&s_cs("noSmallCase")&"</td>")
                else
                     Response.Write("<td class=formtext></td>")
               end if 
                if s_cs("noLargeCase")<>"0" then
                     Response.Write("<td class=formtext><IMG SRC='LargeCase.gif' title='No. of Large Case' BORDER=0>x"&s_cs("noLargeCase")&"</td>")
               else
                     Response.Write("<td class=formtext></td>")
               end if 
                if s_cs("noChildren")<>"0" then
                     Response.Write("<td class=formtext><IMG SRC='Children.gif' title='No. of Children' BORDER=0>x"&s_cs("noChildren")&"</td>")
               else
                     Response.Write("<td class=formtext></td>")
               end if
               if s_cs("noAdults")<>"0" then
                     Response.Write("<td class=formtext><IMG SRC='Adult.gif' title='No. of Adults' BORDER=0>x"&s_cs("noAdults")&"</td>")
               else
                     Response.Write("<td class=formtext></td>")
               end if
                Response.Write("<td width=30></td></tr>")  
                Response.Write("<tr width=100% align=center height=1 bgcolor=#C0C0C0><td colspan=5 ></td></tr>")
                Response.Write("<tr><td class=text nowrap  colspan=5>&nbsp;Pickup:&nbsp;")
                Response.Write(Day(Session("RCM169a_RequestPickDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestPickDate"))),3)&"/"&Year(Session("RCM169a_RequestPickDate")))
               Response.Write("&nbsp;")
               Response.Write(Session("RCM169a_RequestPickTime"))
                Response.Write("</td></tr>")  
                Response.Write("<tr><td class=text  colspan=5>&nbsp;Dropoff:&nbsp;")
                Response.Write(Day(Session("RCM169a_RequestDropDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestDropDate"))),3)&"/"&Year(Session("RCM169a_RequestDropDate")))
               Response.Write("&nbsp;")
                 Response.Write(Session("RCM169a_RequestDropTime"))
                 Response.Write("</td></tr>")  
               Response.Write("<tr width=100% align=center height=1 bgcolor=#C0C0C0><td colspan=5 ></td></tr>")
          
            '---the rates-----------
            costEachSeason=0
            totalRate=0
            'Response.Write("<Br>DiscountRate=")
         '============= hard code, no discount between 15 Dec - 10 Jan
            DateStart="15/Dec/"&Year(Now)
            DateEnd="10/Jan/"&(Year(Now)+1)

            if (CDate(Session("RCM169a_RequestPickDate"))>=Cdate(DateStart) and CDate(Session("RCM169a_RequestPickDate"))<=Cdate(DateEnd)) then
                  Session("RCM169a_DiscountRate")= 0
            end if
         '==================

              ' Response.Write(Session("RCM169a_DiscountRate"))

            for i=1 to SeasonCount
                    Rate=0
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
                else if Session("RCM169a_AgencyRateTypeID")=0 then
        
                     '--for each Season Rate
                     SQL="SELECT * FROM QCarRateDetails "
                     SQL=SQL&"WHERE CarSizeID="&s_cs("ID")&" "
                     SQL=SQL&"AND CarRateStructureID="&Session("RCM169a_RateStructureID"&i&"")&" "
                     SQL=SQL&"AND (SeasonID)='"&Session("RCM169a_SeasonID"&i&"")&"' "
                     'SQL=SQL&"AND (LocationID)='"&Session("RCM169a_PickupLocationID")&"' "
                     'Response.Write(SQL)
                     Set s_m=webConn.Execute(SQL)
                      if NOT s_m.EOF   then   
                                 '----only display the rate if the rate >0   
                                 'if s_m("Rate")>0 then
                                 if Session("RCM169a_DiscountType")="p" then
                                       Rate=s_m("Rate")*(1-Session("RCM169a_DiscountRate")/100)
                                 else
                                       Rate=s_m("Rate")-Session("RCM169a_DiscountRate")  '--need session discountrate here
                                 end if
                              
                      end if
                      s_m.close
                      set s_m=nothing
                end if
            end if
            costEachSeason=Rate*Session("RCM169a_NoOfDaysEachSeason"&i&"")
            Response.Write("<tr><td class=text colspan=5 nowrap>&nbsp;"&Session("RCM169a_Season"&i&"")&" </td></tr>")
            'Response.Write("<tr><td class=text colspan=5 nowrap>"&Session("RCM169a_DiscountType")&" ("&Session("RCM169a_DiscountRate")&") - "&s_m("Rate")&" --"&FormatCurrency(Rate,2)&" (per day)</a></td></tr>")
            Response.Write("<tr><td class=text colspan=5 nowrap>&nbsp;"&Session("RCM169a_NoOfDaysEachSeason"&i&"")&" Days @ "&FormatCurrency(Rate,2)&" (per day)</a></td></tr>")
                        
            totalRate=totalRate+costEachSeason
            next
               Response.Write("<tr align=center height=1 bgcolor=#C0C0C0><td colspan=5 ></td></tr>")
               Response.Write("<tr><td class=formtext align=center colspan=5 nowrap>Total "&Session("RCM169a_TotalRentalDays")&" days  "&FormatCurrency(totalRate,2)&"</td></tr>")

                if j=1 and Unavailable="False"  then
                        if (Session("RCM169a_driverage"))- s_cs("AgeYoungestDriver")>=0 then
                              IF LocationRate>0 then
                                 Response.Write("<tr><td  colspan=5 align=center class=text><A HREF='webAgentBooking3.asp?CarSizeID="&s_cs("ID")&"' style='text-decoration: none' >")
                                 Response.Write("<IMG SRC=booknowred.gif   BORDER=0>")
                                 Response.Write("</a></td></tr>")
                              else
                                 Response.Write("<tr><td  colspan=5 align=center class=red><b>No Rate Available</td></tr>")

                              end if
                        else
                           Response.Write("<tr><td class=formtext align=center colspan=5 >"&CategoryDesc&"<br><FONT COLOR=#FF6600>Not available for hire to drivers under "&s_cs("AgeYoungestDriver")&" years of age</td></tr>")
                        end if
                        '  Response.Write("<tr><td class=formtext align=center colspan=5 ><input type=radio  name=CarSizeID Value="&s_cs("ID")&" checked>"&CategoryDesc&"</a></td></tr>")
                else
                        if Unavailable="True"  then
                        Response.Write("<tr><td class=formtext align=center colspan=5 >BOOKED OUT<Br>"&CategoryDesc&"</td></tr>")
                        else
                           if (Session("RCM169a_driverage"))- s_cs("AgeYoungestDriver")>=0 then
                                    IF LocationRate>0 then
                                          Response.Write("<tr><td  colspan=5 align=center class=text><A HREF='webAgentBooking3.asp?CarSizeID="&s_cs("ID")&"' style='text-decoration: none' >")
                                          Response.Write("<IMG SRC=booknowred.gif   BORDER=0>")
                                          Response.Write("</a></td></tr>")
                                    else
                                          Response.Write("<tr><td  colspan=5 align=center class=red><b>No Rate Available</td></tr>")
                                    end if
                           else
                                    Response.Write("<tr><td  colspan=5 align=center class=text>"&CategoryDesc&"<br><FONT COLOR=#FF6600>NOT available for hire to drivers under "&s_cs("AgeYoungestDriver")&" years of age</td></tr>")
                           end if

                        end if
                end if




            Response.Write("</table>")
                 Response.Write("</td></tr></table>")  
                  Response.Write("</td><td width=8>&nbsp;</td>")
                  '-----if more then 4 image then 2nd row
           if (j MOD 3)=0 then
         Response.Write ("</tr><tr><td colspan=10 hgight=3>&nbsp;</td></tr><tr>") 
      end if 
           
           
          ' end if '---end webRate=0
                
         s_cs.MoveNext                                    
          Loop
          s_cs.Close 
         set s_cs=nothing
          
                   
         Response.Write("</table>")  
         
         
END SUB

%>

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<TABLE align=center  cellSpacing=0 cellPadding=0  border=0>
<tr><td colspan=5>


  <%    GetAgentInfo
      
     Session("RCM169a_CategoryTypeID")=Request.Form("CategoryTypeID")
      '-------------the Pickup and Dropoff date time, No. of booking days---------------- 
      RequestPickYear = CInt(Request.Form("PickupYear"))
      RequestPickMonth =  Left(MonthName(Request.Form("PickupMonth")),3)
      RequestPickDay  = CInt(Request.Form("PickupDay"))
      RequestPickDate = RequestPickDay&"/"&RequestPickMonth&"/"&RequestPickYear

      RequestDropYear = CInt(Request.Form("DropoffYear"))
      RequestDropMonth =  Left(MonthName(Request.Form("DropoffMonth")),3)
      RequestDropDay  = CInt(Request.Form("DropoffDay"))
      RequestDropDate = RequestDropDay&"/"&RequestDropMonth&"/"&RequestDropYear

        RequestPickTime=Request.Form("PickupTime")
        RequestDropTime=Request.Form("DropoffTime")
        
        Session("RCM169a_RequestPickTime")=Request.Form("PickupTime")
        Session("RCM169a_RequestDropTime")=Request.Form("DropoffTime")
        Session("RCM169a_PickupLocationID") = Request.Form("PickupLocationID")
        Session("RCM169a_DropoffLocationID")= Request.Form("DropoffLocationID")
        if Request.Form("DropoffLocationID")="Same" then
         Session("RCM169a_DropoffLocationID") =Request.Form("PickupLocationID")

         end if
         if IsDate(RequestPickDate)="True" then
            Session("RCM169a_RequestPickDate")=RequestPickDate

        end if

        if IsDate(RequestDropDate)="True" then
            Session("RCM169a_RequestDropDate")=RequestDropDate
        end if       
    
       Session("RCM169a_driverage")=Request.Form("driverage")
        '  RequestPickDate="1/Sep/2006"
        ' RequestDropDate ="11/Sep/2006"
        ' RequestPickTime="09:00" 
        ' RequestDropTime="09:00"
           '   Session("RCM169a_PickupLocationID") = 1
          ' Session("RCM169a_DropoffLocationID")= 1
             
        '----check the pickup and Return date--------------------------   
        if IsDate(RequestPickDate)<>"True" then
           Session("RCM169a_ErrorMesage")="The Pickup date does not exist."
           Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" "
        end if
         
        if IsDate(RequestDropDate)<>"True" then
              Session("RCM169a_ErrorMesage")="The Return Date does not exist."
              Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
              
   end if   

         if  DateDiff("d", RequestDropDate, RequestPickDate)> 0 then
            Session("RCM169a_ErrorMesage")="Return Date is earlier then Pick up date."
              Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
            
   end if   
   
        RequestPickDateTime = CDate(RequestPickDate&" "& RequestPickTime)
        Session("RCM169a_RequestPickDateTime")=RequestPickDate&" "& RequestPickTime
        RequestDropDateTime =CDate(RequestDropDate&" "& RequestDropTime)
        Session("RCM169a_RequestDropDateTime")=RequestDropDate&" "& RequestDropTime
        
        
        
        
       
       '---get the pickup location informations----------------------------------------------
        MinBookingDay=1
        Session("RCM169a_OfficeOpeningTime")="8:00"
         Session("RCM169a_OfficeClosingTime")="17:30"
        PickupOfficeOpeningDateTime =(RequestPickDate&" "&Session("RCM169a_OfficeOpeningTime"))
        PickupOfficeClosingDateTime=(RequestPickDate&" "&Session("RCM169a_OfficeClosingTime"))
        DropoffOfficeClosingDateTime=(RequestDropDate&" "&Session("RCM169a_OfficeClosingTime"))
        DropoffOfficeOpeningDateTime=(RequestDropDate&" "&Session("RCM169a_OfficeOpeningTime"))
       
         
        Session("RCM169a_PickupLocation")=""
        Session("RCM169a_PickupLocationCode")=""
        Session("RCM169a_LocationEmail")=""
        Session("RCM169a_DocPrFix")=""
        Session("RCM169a_PickupAfterHourFeeID")=0
        Session("RCM169a_MinimunAge")=0
        NoticeRequired=0
         Set s_pl = webConn.Execute("SELECT * FROM QLocationState where (ID) = '"&Session("RCM169a_PickupLocationID")&"' ")
        if Not s_pl.EOF then
                Session("RCM169a_PickupAfterHourFeeID")=s_pl("AfterHourFeeID")
              Session("RCM169a_PickupLocation")=s_pl("Location")
                Session("RCM169a_PickupLocationCode")=s_pl("CityCode")
                Session("RCM169a_LocationEmail")=s_pl("Email")
                Session("RCM169a_DocPrFix")=s_pl("DocPrFix")
                
                MinBookingDay=s_pl("MinBookingDay")
                PickupAfterHourBooking= s_pl("AfterHourBooking")  
               NoticeRequired=s_pl("NoticeRequired")
            Session("RCM169a_MinimunAge")=s_pl("MinimunAge")
         Session("RCM169a_PickupOfficeOpeningTime")=s_pl("OfficeOpeningTime")
         Session("RCM169a_PickupOfficeClosingTime")=s_pl("OfficeClosingTime")
         '--pickup Location Office openingDateTime
           PickupOfficeOpeningDateTime=(RequestPickDate&" "&s_pl("OfficeOpeningTime"))
         '--pickup Location Office CloseDateTime
                PickupOfficeClosingDateTime=(RequestPickDate&" "&s_pl("OfficeClosingTime"))  
         
     
        end if
        s_pl.close
        set s_pl=nothing
   
        if  CStr(Session("RCM169a_MinimunAge"))<>"0" and  CInt(Session("RCM169a_driverage"))< CInt(Session("RCM169a_MinimunAge"))  then
                 Session("RCM169a_ErrorMesage")="Vehicles are not available for hire to drivers under "&Session("RCM169a_MinimunAge")&" years of age"
               Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" "  
           
       end if 
     '---get the dropoff location informations-------------------------
        Session("RCM169a_DropoffAfterHourFeeID")=0
         Session("RCM169a_DropoffLocation")=""
        Session("RCM169a_DropoffLocationCode")=""
        Set l_s = webConn.Execute("SELECT * FROM QLocationState where (ID) = '"&Session("RCM169a_DropoffLocationID")&"' ")
        if Not l_s.EOF then
               '  if l_s("UnattendedDropoffs")=0 then
               Session("RCM169a_DropoffAfterHourFeeID")=l_s("AfterHourFeeID")
                '  end if
               Session("RCM169a_DropoffLocation")=l_s("Location")
                Session("RCM169a_DropoffLocationCode")=l_s("CityCode")
                DropoffAfterHourBooking= l_s("AfterHourBooking")
                 '--dropoff location Office openingDateTime,ClosingDateTime
                Session("RCM169a_DropoffOfficeOpeningTime") =l_s("OfficeOpeningTime")
                Session("RCM169a_DropoffOfficeClosingTime")=l_s("OfficeClosingTime")
                DropoffOfficeOpeningDateTime=(RequestDropDate&" "&l_s("OfficeOpeningTime")) 
                DropoffOfficeClosingDateTime=(RequestDropDate&" "&l_s("OfficeClosingTime"))  
                UnattendedDropoffs=  l_s("UnattendedDropoffs") 
        end if
        l_s.close
        set l_s=nothing
      TotalRentalDays=0
      TotalRentalDays=DateDiff("d", RequestPickDate, RequestDropDate)
        NoticeRequiredDate=(Now+NoticeRequired) 
        
         '------- check No. of Notice Required for online booking --------------------   
        if RequestPickDateTime =< (NoticeRequiredDate) then
            Session("RCM169a_ErrorMesage")="  Reservation requests made for "&Session("RCM169a_PickupLocation")&" must be made "&NoticeRequired&" days or<br>  more prior to vehicle pick up."
            Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" "
             
   
         end if
        
        if MinBookingDay > TotalRentalDays and Session("RCM169a_PickupLocationID")=Session("RCM169a_DropoffLocationID") then
            Session("RCM169a_ErrorMesage")="The minimum Rental period for "&Session("RCM169a_PickupLocation")&" Internet booking is "&MinBookingDay&" days."
            Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" "
            
   
        end if
         '------- need check the MinBookingDay in relocation records --------------------
      SQL = "SELECT  top 1 MinBookingDay,WebAvaliable,PickupDateTo,PickupDateFrom FROM WebRelocationFees where "
                SQL=SQL&" (PickupLocationID) ='"&Session("RCM169a_PickupLocationID")&"' and (DropoffLocationID)='"&Session("RCM169a_DropoffLocationID")&"' "
                SQL=SQL&" AND ((PickupDateFrom<='"&Session("RCM169a_RequestPickDate")&"'  and PickupDateTo >= '"&Session("RCM169a_RequestPickDate")&"') "
                 SQL=SQL&" or  PickupDateFrom='2100-01-01') "
                SQL=SQL&" AND CarSizeID=0 "
                SQL=SQL&" order by PickupDateFrom "
                'Response.Write(SQL)
                  Set s_re = webConn.Execute(SQL)
                if Not s_re.EOF then
                    if s_re("WebAvaliable")=True then
                      if s_re("MinBookingDay") >1 and s_re("MinBookingDay") > TotalRentalDays then
                        if Year(s_re("PickupDateFrom"))<>2100 then
                           Session("RCM169a_ErrorMesage")="The minimum Rental period between "&Session("RCM169a_PickupLocation")&" and "&Session("RCM169a_DropoffLocation")&" <br>for an Internet booking is "&s_re("MinBookingDay")&" days from "&Day(s_re("PickupDateFrom"))&"/"&Left(MonthName(Month(s_re("PickupDateFrom"))),3)&"/"&Year(s_re("PickupDateFrom"))&" to "&Day(s_re("PickupDateTo"))&"/"&Left(MonthName(Month(s_re("PickupDateTo"))),3)&"/"&Year(s_re("PickupDateTo"))&". "
                        else
                           Session("RCM169a_ErrorMesage")="The minimum Rental period between "&Session("RCM169a_PickupLocation")&" and "&Session("RCM169a_DropoffLocation")&" <br>for an Internet booking is "&s_re("MinBookingDay")&" days. "
                        end if
                        Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" "
                      end if
                    else
                       Session("RCM169a_ErrorMesage")="The one way booking between "&Session("RCM169a_PickupLocation")&" and "&Session("RCM169a_DropoffLocation")&" is not available "
                       Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" "
                    end if
                 end if
            s_re.close
            set s_re=nothing


        '---check Holidays with no pickup and Dropoff -----------
        SQL="SELECT * from syHolidays where (LocationID)='"&Session("RCM169a_PickupLocationID")&"' AND Type='P' and StartDate<= '"&RequestPickDate&"' and EndDate>='"&RequestPickDate&"' "
        SET s_hod=webConn.Execute(SQL)
         DO WHILE NOT  s_hod.EOF    '--need the loop
      
               if s_hod("WeekDays")=0 then
                     Session("RCM169a_ErrorMesage")="The request Pickup date "&RequestPickDate&" is Unavailable. "
                       Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
             
     
                elseif WeekDay(RequestPickDate)=s_hod("WeekDays") then
                     TheDay=WeekDayName(s_hod("WeekDays"))  
                  Session("RCM169a_ErrorMesage")="The request Pickup date "&TheDay&" "&RequestPickDate&" is Unavailable"
                        Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
            
   
            end if  
         s_hod.MoveNext
   Loop
        s_hod.close
        set s_hod=nothing
        
        SQL="SELECT * from syHolidays where (LocationID)='"&Session("RCM169a_DropoffLocationID")&"' AND Type='D' and StartDate<= '"&RequestDropDate&"' and EndDate>='"&RequestDropDate&"' "
        SET s_hod=webConn.Execute(SQL)
        DO WHILE NOT  s_hod.EOF    '--need the loop
               if s_hod("WeekDays")=0 then
                     Session("RCM169a_ErrorMesage")="The request Dropoff date "&RequestDropDate&" is Unavailable. "
                             Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
            
    
                   elseif WeekDay(RequestDropDate)=s_hod("WeekDays") then
                     TheDay=WeekDayName(s_hod("WeekDays"))  
                  Session("RCM169a_ErrorMesage")="The request Dropoff date "&TheDay&" "&RequestDropDate&" is Unavailable. "
                 Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
            
            end if 
         s_hod.MoveNext
   Loop
        s_hod.close
        set s_hod=nothing 
  
   '--Check if location will take bookings outside office hours, Unattended Dropoffs 
   if PickupAfterHourBooking = "False" then
                    if  RequestPickDateTime < CDate(PickupOfficeOpeningDateTime)  or RequestPickDateTime > CDate(PickupOfficeClosingDateTime)  then 
                        Session("RCM169a_ErrorMesage")="Pickup Locatlion "&Session("RCM169a_PickupLocation")&"   will not take bookings outside office hours ("&Session("RCM169a_PickupOfficeOpeningTime")&" - "&Session("RCM169a_PickupOfficeClosingTime")&").<Br>Please contact the bookings office directly."
                Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
            
            end if 
       end if
       if DropoffAfterHourBooking = "False" then        
                 if  UnattendedDropoffs = "False" and ( RequestDropDateTime > CDate(DropoffOfficeClosingDateTime) or RequestDropDateTime <CDate(DropoffOfficeOpeningDateTime) ) then 
                        Session("RCM169a_ErrorMesage")="Dropoff Location "&Session("RCM169a_DropoffLocation")&"  will not take bookings outside office hours ("&Session("RCM169a_DropoffOfficeOpeningTime")&" - "&Session("RCM169a_DropoffOfficeClosingTime")&").<Br>Please contact the bookings office directly."
                     Response.Redirect "webAgentBooking1.asp?URL="&Request.Form("strURL")&" " 
            
                 end if
       end if
        
       
     
   '---use Session to pass between subs for insert to Table
       
        Session("RCM169a_NoOfDays")=1
     
   '---calculat the total min - Grace period  (mins)
          Totalmin=0 
             Session("RCM169a_Graceperiod")=0
      Graceperiod=0
          Set RG=webConn.Execute("SELECT * FROM SystemTable WHERE Code='GP'  ")
    If not RG.EOF then
            Session("RCM169a_Graceperiod")=RG("syValue") '-720 for 12 Hour rate
            Graceperiod=RG("syValue")
   END IF
         RG.CLOSE
   SET RG=NOTHING

     ' SQL=" SELECT  top 1 Rate12Hour  FROM CarSize  "
      SQL=" SELECT   Rate12Hour  FROM CategoryType  WHERE CategoryType.ID='"&Session("RCM169a_CategoryTypeID")&"' "

      Set s_r=webConn.Execute(SQL)
      if NOT s_r.EOF then
              if s_r("Rate12Hour")=True then
                Session("RCM169a_Graceperiod")= Graceperiod -720
               end if

      end if
      s_r.close
      set s_r=nothing


   Session("RCM169a_TotalRentalDays")=0
   Totalmin= Round((RequestDropDateTime - RequestPickDateTime)*1440-Session("RCM169a_Graceperiod"),2)
        Session("RCM169a_TotalRentalDays")=Totalmin/1440
          Session("RCM169a_TotalRentalDays24Hour")=Totalmin/1440
      actureTotalDays=Round(Totalmin/1440,2) '---for find out the extra hours in which season
          Session("RCM169a_KmsTotaldays")=Round(Totalmin/1440,2)  '--used in step3 calculate Kms
          
        if  Session("RCM169a_TotalRentalDays") > Fix(Session("RCM169a_TotalRentalDays")) then
            Session("RCM169a_TotalRentalDays")=Fix(Session("RCM169a_TotalRentalDays"))+1
         end if   
         
         if Session("RCM169a_TotalRentalDays")<1 then
             Session("RCM169a_TotalRentalDays") = 1
      end if
      '---daily Extrafees always use   Session("RCM169a_TotalRentalDays") (fixed number) ----
       TotalRentalDays=Session("RCM169a_TotalRentalDays")
         TotalDays= Session("RCM169a_TotalRentalDays")
             
       '------the form-----------------------------------------------
       



       
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
     
               
         '---6/sep/06, for agent booking check if agencyRate has been set up, AgencyRateTypeID<>0-------
         Session("RCM169a_AgencyRateTypeID")=0
         agencyRate=0
         Set s_ar=webConn.Execute(" select AgencyRateTypeID from Agency,AgencyBranch where (AgencyBranch.ID)="&Session("RCM169a_AgentBranchID")&" and  Agency.ID=AgencyID ")
         if NOT s_ar.EOF then
                     Session("RCM169a_AgencyRateTypeID")=s_ar("AgencyRateTypeID")
                     'Response.Write("<p>")
                     'Response.Write(s_ar("AgencyRateTypeID"))
                  end if
                  s_ar.close
            set s_ar=nothing
     
        
    '---1. get the no of days for each season----
    '---2. For each car type, get each season rate, then calculate the total cost for each car type---
      
      
                                                                                                    
          SQL="SELECT QSeason.* from QSeason, Location where LocationID=Location.ID AND Location.ID="&Session("RCM169a_PickupLocationID")&" and notActive=0 and (Season='Default' or  (EndDate>='"&RequestPickDate&"' and StartDate<='"&RequestDropDate&"') ) order by QSeason.ID DESC "
          'Response.Write(SQL) 
          SET s_m=webConn.Execute(SQL)
                        
    HeightSeasonDays=0
    TotalCost=0   
         i=0
            
             DO WHILE NOT s_m.EOF   
             
                'Response.Write("<br>")  
                 'Response.Write(s_m("Season"))  
                   
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
%>

      <table width=100% height="122" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      <td align="left" valign="top"><img src="graphics/burswoodBanner.jpg" alt="Burswood Car Rentals" name="cars" width="599" height="133" border="0" usemap="#carsMap" id="cars" /></td>
      </tr>
      </table>

<%
               
                '---get car type, for each car type, get each season rate, then calculate total cost for each type
               findTheRate2
           '  Response.Write(" </td></tr></table></td></tr>")
    
               Response.Write("<TR height=1><td colspan=5 bgColor="&Session("RCM169a_CompanyColour")&" ></td></tr>")
              Response.Write("<tr bgColor=#FFFFFF ><td  colspan=5 align=right class=text>")
               Response.Write(" <INPUT TYPE=button NAME=Back  VALUE=Back  class=button onClick='javascript:history.back(-1)'></td></form></tr></table>")

               'Response.Write(" <a href=webAgentbooking1.asp><img src='back.gif' alt='Back to Previous Page'  hspace=0 vspace=0 border=0></a></td></form></tr></table>")
               Response.Write(" </td></tr></table></td></tr></table></td></tr></table>")
          
      webConn.CLOSE 
      set   webConn=nothing
   
%> </td></tr></table>
    <br> </td></tr></table>  
    </td>
     </tr>
      <tr> <td valign="bottom"> </td></tr>
      </table>
    </td>
  </tr>
</table>  
<!-- END RCM HTML CODE-----------> 

      
