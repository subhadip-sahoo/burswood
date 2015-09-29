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
 
<Script Language=Javascript>
<!--
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
               if (ch != ",")NationwideRental275
      }
            if (!allValid)
      {  alert("Please enter Numeric value"); 
            return (false);
      }
   }
    
}
//-->

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
</Script>
<link href="burbook.css" rel="stylesheet" type="text/css" />
<body onload="MM_preloadImages('images/homed.gif')">
<!-- Banner starts here -->
<link href="burbook.css" rel="stylesheet" type="text/css" />
<table width="748" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"><img src="graphics/burswood-car-rental-banner.jpg" alt="Burswood Car Rentals" width="960" height="187" border="0" usemap="#carsMap" id="cars" />
              <map name="carsMap" id="carsMap">
                <area shape="rect" coords="33,30,254,117" href="http://www.burswoodcarrentals.net.au" alt="Burswood Car Rentals Home Page" />
              <area shape="rect" coords="783,92,948,173" href="#" alt="" /></map></td>
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
        <td><img src="graphics/3-quote-current.gif" alt="Review Car Rental Estimate" width="75" height="75" /></td>
        <td><img src="graphics/4-purchase.gif" alt="Car Rental Purchase Details" width="76" height="75" /></td>
        <td><img src="graphics/5-confirm.gif" alt="Car Rental Booking Confirmation" width="62" height="75" border="0" /></td>
      </tr>
    </table></td>
    <td align="left" valign="middle"><a href="index.html"></a><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','home','',1)" onmouseover="MM_nbGroup('over','home','images/homed.gif','',1)" onmouseout="MM_nbGroup('out')"></a><img src="graphics/hd-insurance.gif" alt="Would you like insurance or extras?" width="345" height="76" border="0" /></td>
  </tr>
</table>
<!-- Order steps end here -->
 <table width="960" class="egg" align="center">
   <tr><td>
<%   
   

      Company="Australia Wide Car Rental"
        RCMURL="https://secure20.rentalcarmanager.com.au"
         CompanyCode="Australiawide71"
         DatabaseFile="Australiawide71"

         Dim webConn     'webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

          webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"

       


 
 SUB  GetEachSeasonRateStructureID         
          '-----check system set up if Calculate Seasonal Rates using total rental days (long hire rate)
         TotalDays= Session("AuBurswood169_TotalRentalDays")
         longHireRate="No"
        Set RG=webConn.Execute("SELECT * FROM SystemTable WHERE Code='LONGR'  ")
         If not RG.EOF then
            longHireRate= RG("syValue")'--TOTAL booking days
         END IF
         RG.CLOSE
         SET RG=NOTHING 
         DaysForRate=NoOfDaysEachSeason
        if longHireRate="Yes" then
               DaysForRate= TotalDays '--TOTAL booking days
        end if 
       'Response.Write("<br>test"&TotalDays&"</br>") 
       
          RateName="Default"
          Rate=0
          RateStructureID=1
          Session("AuBurswood169_RateStructureID"&i&"")=1
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
   if  DaysForRate<=3 and VBFriday=Weekday(Session("AuBurswood169_RequestPickDate")) then
          WeekendStard=Session("AuBurswood169_RequestPickDate")&" 12:00"
          WeekendEnd=(CDate(Session("AuBurswood169_RequestPickDate"))+3)&" 12:00"
          if   CDate(Session("AuBurswood169_RequestPickDateTime"))=>CDate(WeekendStard) and CDate(Session("AuBurswood169_RequestDropDateTime"))<=CDate(WeekendEnd) then
                  WeekendRate="Yes"
                  'Response.Write(WeekendStard)
                   'Response.Write("---5Weekend----")
                   'Response.Write(WeekendEnd)
          end if
   end if 
   
         if  DaysForRate<=2 and VBSaturday=Weekday(Session("AuBurswood169_RequestPickDate")) then
          WeekendStard=(CDate(Session("AuBurswood169_RequestPickDate"))-1)&" 12:00"
          WeekendEnd=(CDate(Session("AuBurswood169_RequestPickDate"))+2)&" 12:00"
          if   CDate(Session("AuBurswood169_RequestDropDateTime"))<=CDate(WeekendEnd) then
                  WeekendRate="Yes"
                  'Response.Write(WeekendStard)
                   'Response.Write("---6Weekend----")
                   'Response.Write(WeekendEnd)
          end if
   end if 
   END IF   '---end UseWeekendRate="Yes"
      
       if WeekendRate="Yes"   then
                 'Session("AuBurswood169_RateStructureID"&i&"")=1
                 RateStructureID=1  
                 Session("AuBurswood169_RateStructureID"&i&"")=1
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
                     Session("AuBurswood169_RateStructureID"&i&"")=s_rs("ID")
                         
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
      
     
   '----get all car Category  display the webAvaliable category
        SQL=" SELECT CarSize.*,UnavaliableFrom,UnavaliableTo  FROM WebLocationCategory,CarSize "
        SQL=SQL&" WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
        SQL=SQL&" AND CategoryID=CarSize.ID "
        SQL=SQL&" AND CarSize.ID="&CInt(Request.QueryString("CarSizeID"))&" "
        ' SQL=SQL&" AND (UnavaliableFrom>'"&RequestDropDate&"' or UnavaliableTo<'"&RequestPickDate&"') "
         SQL=SQL&" ORDER By orders "  
       'Response.Write(SQL)
         Set s_cs=webConn.Execute(SQL)  
         j=0
      if NOT s_cs.EOF   then 
            '---check if rate >0 then display on the website--------------
            LocationRate=0
            for i=1 to SeasonCount
                         '--for each Season Rate
                         SQL="SELECT * FROM QCarRateDetails "
                     SQL=SQL&"WHERE CarSizeID="&s_cs("ID")&" "
                          SQL=SQL&"AND CarRateStructureID="&Session("AuBurswood169_RateStructureID"&i&"")&" "
                     SQL=SQL&"AND (SeasonID)='"&Session("AuBurswood169_SeasonID"&i&"")&"' "
                     'SQL=SQL&"AND (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
                          'Response.Write(SQL)
            Set s_m=webConn.Execute(SQL)
            Rate=0
                         if NOT s_m.EOF   then   
                            '----only display the rate if the rate >0   
                              'if s_m("Rate")
                              LocationRate=s_m("Rate") 
                       end if 
                        s_m.close
                        set s_m=nothing
                        totalRate=totalRate+costEachSeason 
                 next   '---end check if rate >0 then display on the website--------------
               'Response.Write(s_cs("Size"))
               'Response.Write(s_cs("WebDesc"))
               'Response.Write(LocationRate)
               'Response.Write("<br>")
            IF LocationRate>0 then
             '---get discount Rate
                '--- check if the rental period in the Discount Date range
                '--- then check if there is a category discount rate 
                '--- if not then use the location discount rate
               DiscountRate=0 
            DiscountID=0 
            DiscountType="p"
            SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
            SQL=SQL&" AND WebItems=1 "
            SQL=SQL&" AND CarSizeID="&s_cs("ID")&" " 
            SQL=SQL&" AND DateRange=1 "
            SQL=SQL&" AND DateFrom<='"&RequestPickDate&"' and DateTo>='"&RequestDropDate&"' "
            Set s_disDate=webConn.Execute(SQL)  
            if  NOT s_disDate.EOF then    '---rental period in the discount date range and specific category apply
               if s_disDate("DiscountRate")>0 then 
                  DiscountType=s_disDate("DiscountType")
                        DiscountRate=s_disDate("DiscountRate")
                        DiscountID=s_disDate("ID")
                  end if
             else     '--specific category apply but Date Range not apply
                     SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
               SQL=SQL&" AND WebItems=1 "
               SQL=SQL&" AND CarSizeID="&s_cs("ID")&" " 
               SQL=SQL&" AND DateRange=0 "
               Set s_disCat=webConn.Execute(SQL)  
               if NOT s_disCat.EOF then  
                  if s_disCat("DiscountRate")>0 then
                     DiscountType=s_disCat("DiscountType")
                        DiscountRate=s_disCat("DiscountRate")
                        DiscountID=s_disCat("ID")
                        end if
                   else  '--check if Daterange apply to all Category
                        SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
                  SQL=SQL&" AND WebItems=1 "
                  SQL=SQL&" AND CarSizeID=0 " 
                  SQL=SQL&" AND DateRange=1 "
                        SQL=SQL&" AND DateFrom<='"&RequestPickDate&"' and DateTo>='"&RequestDropDate&"' "
                  'Response.Write(SQL)
                  Set s_dis3=webConn.Execute(SQL)  
                  if NOT s_dis3.EOF then  
                           if s_dis3("DiscountRate")>0 then
                           DiscountType=s_dis3("DiscountType")
                                 DiscountRate=s_dis3("DiscountRate")
                                 DiscountID=s_dis3("ID")
                              end if
                        else '--location discount
                           SQL="SELECT * from Discount WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
                           SQL=SQL&" AND WebItems=1 "
                     SQL=SQL&" AND CarSizeID=0 " 
                     SQL=SQL&" AND DateRange=0 "
                     Set s_dis=webConn.Execute(SQL)  
                     if NOT s_dis.EOF then  
                           if s_dis("DiscountRate")>0 then
                           DiscountType=s_dis("DiscountType")
                              DiscountRate=s_dis("DiscountRate")
                                          DiscountID=s_dis("ID")
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
           
            
            
            '--for each season, get the rate
                  j=j+1
            
               '----------Vehicle Type-------------------
                 theimage=RCMURL&"/DB/"&CompanyCode&"/"&s_cs("ImageName")
                 Session("AuBurswood169_CarImageName")=s_cs("ImageName")
         Response.Write("<tr><td></td><td align=left class=text valign=top>Vehicle Type: </td>")
         Response.Write("<td align=left class=text valign=top>")
         
            Response.Write("<table valign=top cellSpacing=0 cellPadding=2  border=0>")
            Response.Write("<tr><td class=text valign=top>"&s_cs("WebDesc")&"</td></tr>")
            Response.Write("<tr><td class=text>"&s_cs("VehicleDesc")&"</td></tr>")
             
                 
               
          '---the rates-----------
          costEachSeason=0
                totalRate=0
                for i=1 to SeasonCount
                         '--for each Season Rate
                         SQL="SELECT * FROM QCarRateDetails "
                     SQL=SQL&"WHERE CarSizeID="&s_cs("ID")&" "
                          SQL=SQL&"AND CarRateStructureID="&Session("AuBurswood169_RateStructureID"&i&"")&" "
                     SQL=SQL&"AND (SeasonID)='"&Session("AuBurswood169_SeasonID"&i&"")&"' "
                     'SQL=SQL&"AND (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
                         'Response.Write(SQL)
            Set s_m=webConn.Execute(SQL)
            Rate=0
                         if NOT s_m.EOF   then   
                            '----only display the rate if the rate >0   
                              'if s_m("Rate")>0 then 
                                 if DiscountType="p" then
                                 Rate=s_m("Rate")*(1-DiscountRate/100)
                                 else
                                 Rate=s_m("Rate")-DiscountRate
                                 end if
                                '=================
                                 if SeasonCount = 1 then
                                    if Session("AuBurswood169_NoOfDaysEachSeason"&i&"")<1 then
                                        Session("AuBurswood169_NoOfDaysEachSeason"&i&"")=1
                                   end if
                                 end if
                                 '===================
                                 costEachSeason=Rate*Session("AuBurswood169_NoOfDaysEachSeason"&i&"")
                                          Response.Write("<tr><td class=text nowrap>&nbsp;"&Session("AuBurswood169_Season"&i&"")&" </td></tr>")
                           Response.Write("<tr><td class=text nowrap>&nbsp;"&Session("AuBurswood169_NoOfDaysEachSeason"&i&"")&" Days @ AU"&FormatCurrency(Rate,2)&" (per day)</a></td></tr>")
                       end if 
                        s_m.close
                        set s_m=nothing
                        totalRate=totalRate+costEachSeason 
                 next  
         
            Response.Write("</table></td>")
                 Response.Write("<td align=left ><img src='"&theimage&"'  WIDTH=100 ></td></tr>")
      
              
              
           
           
           end if '---end webRate=0
                
        end if
          s_cs.Close 
         set s_cs=nothing
          
                   
      
         
         
END SUB

 
 SUB ExtraForm  '--sub
    '--if the cost of extrafees > maxprice then display maxprice---
    SQL="select * from ExtraFees WHERE (LocationID='"&Session("AuBurswood169_PickupLocationID")&"'  or LocationID=0) "
      SQL=SQL&" AND (VehicleSizeID='"&CInt(Request.QueryString("CarSizeID"))&"' or VehicleSizeID=0) "
      SQL=SQL&" and InsuranceExtra=0 AND  WebItems=1 and Mandatory=0 and inUse=1 order by QTYApply, Type,Name"
    Set s_ex=webConn.Execute(SQL)
    if NOT s_ex.EOF  then        %>   
            <link href="burbook.css" rel="stylesheet" type="text/css" />
<TR height=30 bgColor=#00509F><td  align=center class=header>Select any extra items required with your Vehicle</td></tr>
         <tr><td>
         
        
          <TABLE  width="700" align=center  cellSpacing=0 cellPadding=2  border=0>
      <tr><td  width=50></td>
      <td width="430" align=left class=formtext >Description:</td>
      <td width="196" class=formtext>Price</td>
      <td width="212" align=right class=formtext>QTY</td>
      </tr>
            <tr><td colspan=4 bgColor=#C0C0C0></td></tr>
    <%         j=0
                 DO WHILE NOT s_ex.EOF          
                  Response.Write("<tr><td><input type=checkbox  name=ExtraFeesID"&j&" Value="&s_ex("ID")&" ></td>")
                         if s_ex("Type")="Percentage" then
                              Response.Write("<td class=text align=left >"&s_ex("Name")&"</td><td class=text align=left nowrap>"&s_ex("Fees")&"% (of Rental)</td>")
                           
                    else
                           '--for daily extra if the cost of extrafees > maxprice then display maxprice---
                    if s_ex("Type")="Daily" and s_ex("Maxprice")>0 and TotalRentalDays*s_ex("Fees")>s_ex("Maxprice") then
                                    Response.Write("<td class=text align=left >"&s_ex("Name")&"</td><td class=text align=left nowrap>$"&s_ex("Maxprice")&" (Fixed)</td>")
                                 else
                              Response.Write("<td class=text align=left >"&s_ex("Name")&"</td><td class=text align=left nowrap>$"&s_ex("Fees")&" ("&s_ex("Type")&")</td>")
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
        Response.Write("<TR height=30><td align=center class=header>Select to reduce your liability</td></tr>")
        Response.Write("<tr><td>")
        Response.Write("<TABLE  width=100% align=center  cellSpacing=0 cellPadding=2  border=0>")
       
         VehicleSizeID=CInt(Request.QueryString("CarSizeID"))
        InsuranceLocaitonID =Session("AuBurswood169_PickupLocationID")
        TotalDays=  Session("AuBurswood169_TotalRentalDays")
          iAge=Session("RCM7_driverage")
      'Response.Write("<tr ><td class=text>TotalDay="&TotalDays&"</td><td  class=text>"&iAge&"</td><td  class=text>"&RequestPickDate&"<td></td></tr>")
      
    Set s_in=webConn.Execute("SELECT * from ExtraFees WHERE inUse=1 and  InsuranceExtra=1 AND (LocationID="&InsuranceLocaitonID&" or LocationID=0)order by Name")
    if s_in.EOF then '---if no insurance set up then do not show the dropdown list for selection
          Response.Write("<input type=hidden  name=InsuranceID Value='0' >")
    else    
       
      
            
   '---Insurance selection logic
      SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 "
      SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) "
      'SQL=SQL&" and VehicleSizeID="&VehicleSizeID&" "
     '' SQL=SQL&" and (VehicleSizeID="&VehicleSizeID&" or  VehicleSizeID=0 ) "
      SQL=SQL&" and (VehicleSizeID="&VehicleSizeID&" or CategoryTypeID ="&Session("AuBurswood169_CategoryTypeID")&" ) "

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
            SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 "
            SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) "
            'SQL=SQL&" and VehicleSizeID="&VehicleSizeID&"    "
              SQL=SQL&" and (VehicleSizeID="&VehicleSizeID&" or CategoryTypeID ="&Session("AuBurswood169_CategoryTypeID")&" ) "

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
               SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 "
               SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) "
                 SQL=SQL&" and (VehicleSizeID="&VehicleSizeID&" or CategoryTypeID ="&Session("AuBurswood169_CategoryTypeID")&" ) "

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
            SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 "
                        SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0) "
                        SQL=SQL&" and VehicleSizeID=0 and CategoryTypeID=0 "

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
                     SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 "
                           SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0)     "
                       SQL=SQL&" and VehicleSizeID=0 and CategoryTypeID=0 "

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
                        SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1  "
                        SQL=SQL&" AND (LocationID="&InsuranceLocaitonID&" or LocationID=0)"
                          SQL=SQL&" and VehicleSizeID=0 and CategoryTypeID=0 "
                        SQL=SQL&"  and FromAge=0 and FromDay=0   "
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
    
      
       
    end if
    s_in.close
    set s_in=nothing     
        Response.Write("</table></td></tr>")
                                      
END SUB
          



SUB KmsFeesSelection        '---KmsFree selection logic    
        VehicleSizeID=CInt(Request.QueryString("CarSizeID"))
        PickupLocationID =Session("AuBurswood169_PickupLocationID")
        TotalDays=  Session("AuBurswood169_TotalRentalDays")
      
   SQL="SELECT * from KmsFree WHERE  WebAvaliable=1 and LocationID="&PickupLocationID&"  "
   SQL=SQL&" and VehicleSizeID="&VehicleSizeID&" "  
   SQL=SQL&" and FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0))  " 
   SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
         Set s_km = webConn.Execute(SQL)
   if NOT s_km.EOF then    '--1
                  Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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
                     Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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
               SQL=SQL&" and FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0))  " 
               SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
         Set s_km = webConn.Execute(SQL)
      
         if NOT s_km.EOF then      '--3
                              Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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
                                       Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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
                SQL=SQL&" and FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0))  " 
                SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
                      Set s_km = webConn.Execute(SQL)
                   
                if NOT s_km.EOF then        '--5
                          Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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
                                       Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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
                  SQL=SQL&" and FromDay<="&TotalDays&" and (ToDay>="&TotalDays&" or (ToDay=0 and FromDay>0))  " 
                  SQL=SQL&" ORDER BY DefaultKM,KmsFree,AddKmsFee "
                        Set s_km = webConn.Execute(SQL)
                       if NOT s_km.EOF then        '---7
                                                   Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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
                                                     Response.Write("<TR height=30 bgColor=#233a32><td  align=center class=header>Select Kms Option</td></tr>")
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

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="748" height="100%" border="0" align="center" cellpadding="0" cellspacing=0 >

<tr><td>
<TABLE  width=700  align=center bgcolor=#FFFFFF  cellSpacing=0 cellPadding=1  border=0><tr><td>
<TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=0  border=0>
<tr height=30><td  align=center class=header >STEP 3 - Car Rental Pickup & Dropoff Dates & Times</td></tr>
<tr><td>
  <%   
         if Request.QueryString("CarSizeID")="" or Session("AuBurswood169_RequestPickDate")="" then
          'Session("AuBurswood169_ErrorMesage")="No rates available."
                  Response.Redirect "webbookingstep1.asp"
     end if
      RequestPickDate = Session("AuBurswood169_RequestPickDate")
        RequestPickTime=Session("AuBurswood169_RequestPickTime")
      RequestDropDate = Session("AuBurswood169_RequestDropDate")
        RequestDropTime=Session("AuBurswood169_RequestDropTime")
        RequestPickDateTime = CDate(RequestPickDate&" "& RequestPickTime)
        RequestDropDateTime =CDate(RequestDropDate&" "& RequestDropTime)




      SQL=" SELECT CategoryTypeID  FROM CarSize  WHERE ID="&CInt(Request.QueryString("CarSizeID"))&" "
      Set s_r=webConn.Execute(SQL)
      if NOT s_r.EOF then
                Session("AuBurswood169_CategoryTypeID")= s_r("CategoryTypeID")
      end if
      s_r.close
      set s_r=nothing
       
          Response.Write("<table>") 
    Response.Write("<tr><td></td><td width=""120"" align=left class=text>Pickup Location:</td><td align=left class=text colspan=2> ")
          Response.Write(Session("AuBurswood169_PickupLocation"))
          Response.Write("</td></tr>")
                       
           Response.Write("<tr><td></td><td align=left class=text>Pickup Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("AuBurswood169_RequestPickDate")))&", ")
           Response.Write(Day(Session("AuBurswood169_RequestPickDate"))&"/"&Left(MonthName(Month(Session("AuBurswood169_RequestPickDate"))),3)&"/"&Year(Session("AuBurswood169_RequestPickDate")))
           Response.Write("&nbsp;")
           Response.Write(Session("AuBurswood169_RequestPickTime"))
          Response.Write("</td></tr>")
                        
          
                        
           Response.Write("<tr><td></td><td align=left class=text>Return Location: </td><td align=left class=text colspan=2>")
           Response.Write(Session("AuBurswood169_DropoffLocation"))
           Response.Write("</td></tr>") 
                      
           Response.Write("<tr><td></td><td align=left class=text>Return Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("AuBurswood169_RequestDropDate")))&", ")
           Response.Write(Day(Session("AuBurswood169_RequestDropDate"))&"/"&Left(MonthName(Month(Session("AuBurswood169_RequestDropDate"))),3)&"/"&Year(Session("AuBurswood169_RequestDropDate")))
           Response.Write("&nbsp;")
           Response.Write(Session("AuBurswood169_RequestDropTime"))
           Response.Write("</td></tr>")
                      
                  
        
   
        '----------the form-------------
        Response.Write("<form method=post action='webBookingStep4.asp?dir=Rate'  name='Rate'  >")
       Response.Write("<input type='hidden' name='CarSizeID' size=5 value='"&CInt(Request.QueryString("CarSizeID"))&"'>")

      
        '-----Start Hourly Rate ------------
        '----1st need find the extra hours in which season, (use the extra hours as a day to find the season)           
        '--- need a acture No of Days (actureTotalDays) and actureNoOfDaysEachSeason to find out the extra hours in which season 
        '---if there are hourly rate set up then use it for calculattion
       '----if the total cost for the no of hours > = one day rate, then do not calculate hourly rate
    
        theExtraHour=0
        HourRate=0
        if Session("AuBurswood169_RequestPickTime")<> Session("AuBurswood169_RequestDropTime") then
            theExtraHour=Round(((1440*(CDate(Session("AuBurswood169_RequestDropDate")&" "& Session("AuBurswood169_RequestDropTime")) - CDate(Session("AuBurswood169_RequestDropDate")&" "& Session("AuBurswood169_RequestPickTime")))-Session("AuBurswood169_Graceperiod")) /60),2)
                if  theExtraHour > Fix(theExtraHour)  then 
                  theExtraHour=Fix(theExtraHour)+1
            end if
                'theExtraHour=Round(theExtraHour,2)
                'Response.Write(theExtraHour)
            'Response.Write("<br>")
            SQL="SELECT * from CarRateHourly WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"'  and HourFrom<"&theExtraHour&" and HourTo>="&theExtraHour&" "
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
      
      
                                                                                                    
          SQL="SELECT QSeason.* from QSeason, Location where LocationID=Location.ID AND CityCode='"&Session("AuBurswood169_PickupLocationCode")&"' and notActive=0 order by QSeason.ID DESC "
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
               if s_m("Season") <>"Default" then          ' for not default season
                 '--need use Season start and End Datetime for calculating the No of days (with PickupDateTime, dorpoffDateTime)
                  SeasonStartTime="00:00:00"  
            SeasonStartingDateTime=CDate(s_m("StartDate")&" "& SeasonStartTime)
                 SeasonEndingDateTime=s_m("EndDate")
                        '---if the time diff >12 hours then 
                       IF  (Round((SeasonStartingDateTime-RequestPickDateTime)*1440,2)/60)=>12  and Round((RequestDropDateTime-SeasonStartingDateTime)*1440,2)/60>12 then     
                              ' _____________ calculate the no of days in each season
                               'if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60=>12 then    '4--Dropoffdate > seasonEnd
                          if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60>=0  then    
                               '--the season strat time should be same as Pickup time
                                 SStartingDateTime=CDate(s_m("StartDate")&" "& Session("AuBurswood169_RequestPickTime"))
                         themin= Round((RequestDropDateTime - SStartingDateTime)*1440-Session("AuBurswood169_Graceperiod"),2)
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
                         ELSEIF   (Round((SeasonStartingDateTime-RequestPickDateTime)*1440,2)/60)<12  and Round((SeasonEndingDateTime - RequestPickDateTime )*1440,2)/60=>12 then     
                               'if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60>12 then    '4--Dropoffdate > seasonEnd
                            if Round((SeasonEndingDateTime - RequestDropDateTime )*1440,2)/60>=0  then    
                                  themin= Round((RequestDropDateTime - RequestPickDateTime)*1440-Session("AuBurswood169_Graceperiod"),2)
                   if  themin<0 then 
                           themin=0
                   end if
                   NoOfDaysEachSeason=themin/1440 
                   actureNoOfDaysEachSeason=themin/1440
                   if  NoOfDaysEachSeason > Fix(NoOfDaysEachSeason) then
                        NoOfDaysEachSeason=Fix(NoOfDaysEachSeason)+1
                   end if
                                 'Response.Write("<p>4 "&s_m("Season")&" "&NoOfDaysEachSeason&" ---"&theDays&"")  
                         else      
                             '--the season end time should be same as Dropoff time
                                 SEndingDateTime=CDate(s_m("EndDate")&" "& Session("AuBurswood169_RequestPickTime"))
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
             elseif s_m("Season") ="Default" then
                        '___________the default Season, days = total days -provices seasons days 
                     NoOfDaysEachSeason=Session("AuBurswood169_TotalRentalDays")-HeightSeasonDays
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
                        Session("AuBurswood169_Season"&i&"")="Standard Rates"
                        
                     else
                     Season=s_m("Season")
                     Session("AuBurswood169_Season"&i&"")=s_m("Season")
                  end if  
                         
                     '--pass the seasonID as array
                        Session("AuBurswood169_SeasonID"&i&"")=s_m("ID")
                      ' Session("AuBurswood169_NoOfDaysEachSeason"&i&"")=NoOfDaysEachSeason
               

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
               Session("AuBurswood169_NoOfDaysEachSeason"&i&"")=NoOfDaysEachSeason
                        '--pass all following to Step3.asp for get the rate again
                        Response.Write("<input type='hidden' name='actureNoOfDaysEachSeason"&i&"' size=5 value='"&actureNoOfDaysEachSeason&"'>")
                        Response.Write("<input type='hidden' name='NoOfDaysEachSeason"&i&"' size=5 value='"&NoOfDaysEachSeason&"'>")
                        'Response.Write("<input type=hidden name='StandardRate"&i&"' size=3 value="&FormatNumber(Rate,2)&" >")      
                    Response.Write("<input type='hidden' name='Season"&i&"' size=5 value='"&Session("AuBurswood169_Season"&i&"")&"'>")
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
    
          
          ExtraForm 
                InsuranceExtra 
                KmsFeesSelection 
                Response.Write("</table>")   
                Response.Write("</td></tr>") 
                Response.Write("<TR height=2><td colspan=4 bgcolor=233a32></td></tr>")

                Response.Write("<tr><td  colspan=4 align=right class=text><INPUT TYPE=button NAME=Back  VALUE=Back  class=button onClick='javascript:history.back(-1)'>&nbsp;&nbsp;<input type=submit class=button value=Continue /></td></form></tr></table>")
               Response.Write(" </td></tr></table></td></tr></table>")
          
      webConn.CLOSE 
   
%>  </td></tr></table>  
    </td></tr></table>  
    </td>
    </tr>
      <tr> <td valign="bottom"> </td></tr>
      </table>
    </td>
  </tr>
</table>
</td></tr></table>
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
</body>
</html>
