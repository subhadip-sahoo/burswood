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
<table width="748" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"><img src="graphics/burswood-car-rental-banner.jpg" alt="Burswood Car Rentals" width="960" height="187" border="0" usemap="#carsMap" id="cars" href="http://www.burswoodcarrentals.net.au" />
              <map name="carsMap" id="carsMap">
                <area shape="rect" coords="33,30,254,117" href="http://www.burswoodcarrentals.net.au" alt="Burswood Car Rentals Home Page" /><area shape="rect" coords="789,108,951,179" href="http://www.burswoodcarrentals.net.au" alt="" />
              </map>
            </td>
  </tr>
</table>
<!-- Banner ends here -->
<!-- Order steps start here -->
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="egg">
  <tr align="left" valign="top">
    <td width="45%" height="80" align="left" valign="top"><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="35">&nbsp;</td>
        <td><img src="graphics/1-dates-completed.gif" alt="Select Pick-up  Location and Hire Dates" width="61" height="75" vspace="20" /></td>
        <td><img src="graphics/2-vehicle-current.gif" alt="Select Vehicle" width="77" height="75" /></td>
        <td><img src="graphics/3-quote.gif" alt="Review Car Rental Estimate" width="75" height="75" /></td>
        <td><img src="graphics/4-purchase.gif" alt="Car Rental Purchase Details" width="76" height="75" /></td>
        <td><img src="graphics/5-confirm.gif" alt="Car Rental Booking Confirmation" width="62" height="75" border="0" /></td>
      </tr>
    </table></td>
    <td align="left" valign="middle"><a href="index.html"></a><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','home','',1)" onmouseover="MM_nbGroup('over','home','images/homed.gif','',1)" onmouseout="MM_nbGroup('out')"></a><img src="graphics/hd-vehicle.gif" alt="Choose your preferred vehicle" width="288" height="75" border="0" /></td>
  </tr>
</table>
<!-- Order steps end here -->
<!-- RCM Code Starts here -->
 
<%   
   Session.Timeout = 30

         Company="Australia Wide Car Rental"
         RCMURL="https://secure20.rentalcarmanager.com.au"
         CompanyCode="Australiawide71"
         DatabaseFile="Australiawide71"

         Dim webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

          webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"

       

 FUNCTION tidyup(thisString)
   tidyup=LTrim(RTrim(Replace(thisString, "'" , "''")))
END FUNCTION
 
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
           Response.Write("<TABLE  width=620  align=center bgcolor=#ffffff  cellSpacing=0 cellPadding=1  border=0><tr><td>")
         Response.Write("<TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>")
      Response.Write("<tr height=30><td  align=center class=header colspan=4>STEP 2 - Select Your Vehicle</td></tr><br>")
         Response.Write("<tr><td colspan=4 width=150>")
        
   '----get all car Category  display the webAvaliable category
        SQL=" SELECT CarSize.*,UnavaliableFrom,UnavaliableTo  FROM WebLocationCategory,CarSize "
        SQL=SQL&" WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' "
        SQL=SQL&" AND CategoryID=CarSize.ID " 
        ' SQL=SQL&" AND (UnavaliableFrom>'"&RequestDropDate&"' or UnavaliableTo<'"&RequestPickDate&"') "
         SQL=SQL&" ORDER By orders "  
         'Response.Write(SQL)
         Set s_cs=webConn.Execute(SQL)
         Response.Write("<table align=center border=0 bgcolor=#ffffff cellspacing=1 cellpadding=0 ><tr align=center>")
        j=0
      DO WHILE NOT s_cs.EOF    'for each car Category 
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
                '--check if image exists-------------
            Dim fs
          theimage=RCMURL&"/DB/"&CompanyCode&"/"&s_cs("ImageName")
          Response.Write("<td width=8>&nbsp;</td><td align=center >")
           
            Response.Write("<table width=200 height=150 align=center border=0 bgcolor=#4f615b cellspacing=0 cellpadding=1 ><tr align=center><td>")
       
             Response.Write("<table width=200  height=150  align=center border=0 bgcolor=#ffffff cellspacing=0 cellpadding=0>")
                 Unavaliable="False"
               'if s_cs("UnavaliableFrom")>CDate(RequestDropDate) or s_cs("UnavaliableTo")<CDate(RequestPickDate) then
                if ( DateDiff("d", RequestPickDate, CDate(s_cs("UnavaliableTo")) )>=0  AND  DateDiff("d", RequestDropDate, CDate(s_cs("UnavaliableFrom")) )<=0 ) OR ( DateDiff("d", RequestPickDate, CDate(s_cs("UnavaliableFrom")) )>=0  and DateDiff("d", RequestDropDate, CDate(s_cs("UnavaliableFrom")) )<=0 )  OR (DateDiff("d", RequestPickDate, CDate(s_cs("UnavaliableFrom")) )<=0 and DateDiff("d", RequestPickDate, CDate(s_cs("UnavaliableTo")) )>=0 ) then
                      Unavaliable="True"
                end if 
                       
                    Response.Write("<tr><td class=formtext align=center colspan=5 >"&s_cs("WebDesc")&"</a></td></tr>")

                 Response.Write("<tr><td class=formtext align=center colspan=5 nowrap>"&s_cs("VehicleDesc")&"</td></tr>")
             
              '  Response.Write("<tr width=100% align=center height=1 bgcolor=#FFFFFF><td colspan=5 ></td></tr>")
            Response.Write("<tr align=center><td colspan=5><img src="&theimage&" height=100></td></tr>")
           ' Response.Write("<tr width=100% align=center height=1 bgcolor=#FFFFFF><td colspan=5 ></td></tr>")
             Response.Write("<tr align=center height=22><td colspan=5><table><tr>")

               if s_cs("noSmallCase")<>"0" then
                     Response.Write("<td class=formtext width=25% ><IMG SRC='SmallCase.gif' title='No. of Small Case'  BORDER=0>x"&s_cs("noSmallCase")&"</td>")
                else
                     Response.Write("<td class=formtext width=25% ></td>")
               end if
                if s_cs("noLargeCase")<>"0" then
                     Response.Write("<td class=formtext width=25% ><IMG SRC='LargeCase.gif' title='No. of Large Case' BORDER=0>x"&s_cs("noLargeCase")&"</td>")
               else
                     Response.Write("<td class=formtext width=25% ></td>")
               end if 
                if s_cs("noChildren")<>"0" then
                     Response.Write("<td class=formtext width=25% ><IMG SRC='Children.gif' title='No. of Children' BORDER=0>x"&s_cs("noChildren")&"</td>")
               else
                     Response.Write("<td class=formtext width=25% ></td>")
               end if
               if s_cs("noAdults")<>"0" then
                     Response.Write("<td class=formtext width=25% ><IMG SRC='Adult.gif' title='No. of Adults' BORDER=0>x"&s_cs("noAdults")&"</td>")
               else
                     Response.Write("<td class=formtext width=25% ></td>")
               end if
                Response.Write("</tr></table></td></tr>")
                Response.Write("<tr width=100% align=center height=1 bgcolor=#FFFFFF><td colspan=5 ></td></tr>")
          
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
                                 '================= for minimum rental day = 1
                                 if SeasonCount = 1 and Session("AuBurswood169_NoOfDaysEachSeason"&i&"")<1 then
                                        Session("AuBurswood169_NoOfDaysEachSeason"&i&"")=1

                                 end if
                                 '===================
                                 costEachSeason=Rate*Session("AuBurswood169_NoOfDaysEachSeason"&i&"")
                                 Response.Write("<tr><td class=text colspan=5 nowrap>&nbsp;"&Session("AuBurswood169_Season"&i&"")&" </td></tr>")
                           'Response.Write("<tr><td class=text colspan=5 nowrap>"&DiscountType&" ("&DiscountRate&") - "&s_m("Rate")&" --"&FormatCurrency(Rate,2)&" (per day)</a></td></tr>")
                           Response.Write("<tr><td class=text colspan=5 nowrap>&nbsp;"&Session("AuBurswood169_NoOfDaysEachSeason"&i&"")&" Days @ AU"&FormatCurrency(Rate,2)&" (per day)</a></td></tr>")
                       end if 
                        s_m.close
                        set s_m=nothing
                        totalRate=totalRate+costEachSeason 
                 next
                  if Unavaliable="True"  then
                        Response.Write("<tr><td class=formtext align=center colspan=5 ><FONT COLOR=#FF6600>BOOKED OUT</td></tr>")
                 else
                        Response.Write("<tr><td align=center class=text colspan=5 ><A HREF='webBookingStep3.asp?CarSizeID="&s_cs("ID")&"' style='text-decoration: none' >")
                               Response.Write("<IMG SRC=booknowblue.gif BORDER=0>")

                              Response.Write("</a>&nbsp;&nbsp;")

                        if s_cs("VehicleDescURL") <>"" then
                              CategoryUrl=s_cs("VehicleDescURL")
                        end if


                        Response.Write("<A HREF='"&CategoryUrl&"' target=new class='MoreInfoWrap'>")
                        Response.Write("<img src='images/playButton.gif' alt=''  border='0' /></a></td></tr>")
                     '  Response.Write("<tr><td class=formtext align=center colspan=5 ><input type=radio  name=CarSizeID Value="&s_cs("ID")&" checked>"&s_cs("WebDesc")&"</a></td></tr>")
                  end if
            Response.Write("</table>")
                 Response.Write("</td></tr></table>")  
                  Response.Write("</td><td width=8>&nbsp;</td>")
                  '-----if more then 4 image then 2nd row
           if (j MOD 3)=0 then
         Response.Write ("</tr><tr><td colspan=10 hgight=3>&nbsp;</td></tr><tr>") 
      end if 
           
           
           end if '---end webRate=0
                
         s_cs.MoveNext                                    
          Loop
          s_cs.Close 
         set s_cs=nothing
          
                   
         Response.Write("</table></td></tr>")  
         
         
END SUB

 
 SUB ExtraForm  '--sub     
    '--if the cost of extrafees > maxprice then display maxprice---
    SQL="SELECT * from ExtraFees WHERE (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' and InsuranceExtra=0 AND  WebItems=T1and Mandatory=0 and inUse=1 order by QTYApply, Type"
    Set s_ex=webConn.Execute(SQL) 
    if NOT s_ex.EOF  then        %>   
            <link href="burbook.css" rel="stylesheet" type="text/css" />
<TR bgColor=#233a32><td colspan=4 align=center class=header>Select any extra items required with your Vehicle</td></tr>
         <tr><td></td><td class=formtext align=left >Description:</td><td class=formtext>Price</td><td class=formtext align=right>QTY</td></tr>
            <tr><td colspan=4 bgColor=#FFFFFF></td></tr>
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
                    Response.Write("<input type=hidden  name=StampDuty"&j&" Value='"&s_ex("StampDuty")&"'></td>")
         
                    Response.Write("<tr><td colspan=4 bgColor=#FFFFFF></td></tr>")
                 s_ex.MoveNext                                    
            j=j+1    
            Loop 
               s_ex.close
            SET s_ex=nothing 
                 Response.Write("<input type=hidden name='ExtraFeeCount' value='"&j&"'>")  
     END IF
 END SUB
 
 SUB  InsuranceExtra          
                Response.Write("<TR bgColor=#233a32><td colspan=4 align=center class=header>Select any additional Insurance you require</td></tr>")
                  SQL="SELECT * from ExtraFees WHERE inUse=1 and InsuranceExtra=1 and WebItems=1 AND Mandatory=0 and  (LocationID='"&Session("AuBurswood169_PickupLocationID")&"' or LocationID=0) order by Name"
               'Response.Write(SQL)
            Set s_e=webConn.Execute(SQL)
            j=0 
            DO WHILE NOT s_e.EOF 
               if s_e("Fees")>0 then
                       if s_e("Type")="Percentage" then
                        Response.Write("<tr><td align=left><input type=radio  name=InsuranceID  Value="&s_e("ID")&" ></td><td  align=left class=text>"&s_e("name")&" </td><td  align=left class=text></td><td class=text align=right>"&s_e("Fees")&"% of Rental</td></tr>")
                          else
                     Response.Write("<tr><td  align=left><input type=radio  name=InsuranceID  Value="&s_e("ID")&" ></td><td  align=left class=text>"&s_e("name")&" </td><td  align=left class=text></td><td class=text align=right>"&FormatCurrency(s_e("Fees"),2)&"("&s_e("Type")&")</td></tr>")
                     end if
                     Response.Write("<tr><td colspan=4 bgColor=#FFFFFF></td></tr>") 
                  end if
                 s_e.MoveNext
         j=j+1
            Loop   
                'Response.Write("</table>")
            
         s_e.close
            SET s_e=nothing 
      
END SUB

%>

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table class="egg" width="960" height="100%" border="0" align="center" cellpadding="0" cellspacing=0 >

<tr><td>


           <%   
      
     '--from webbookingstep1.asp
     Session("AuBurswood169_driverage")=Request.Form("driverage")
      Session("AuBurswood169_Flight")=tidyup(Request.Form("Flight"))
      Session("AuBurswood169_Flightout")=tidyup(Request.Form("Flightout"))
      Session("AuBurswood169_NoTravelling")=tidyup(Request.Form("NoTravelling"))
      '-------------the Pickup and Dropoff date time, No. of booking days---------------- 
        RequestPickYear = CInt(Request.Form("PickupYear"))
   RequestPickMonth = (Request.Form("PickupMonth"))
   RequestPickDay  = CInt(Request.Form("PickupDay"))
   RequestPickDate = RequestPickDay&"/"&RequestPickMonth&"/"&RequestPickYear 
        'RequestPickTime=Request.Form("PickupTimehh")&":"&Request.Form("PickupTimemm")  
        RequestPickTime=Request.Form("PickupTime")  
        RequestDropYear = CInt(Request.Form("DropoffYear"))
   RequestDropMonth = (Request.Form("DropoffMonth"))
   RequestDropDay  = CInt(Request.Form("DropoffDay"))
   RequestDropDate = RequestDropDay&"/"&RequestDropMonth&"/"&RequestDropYear 
        RequestDropTime=Request.Form("DropoffTime")  
        Session("AuBurswood169_RequestPickTime")=Request.Form("PickupTime")
        Session("AuBurswood169_RequestDropTime")=Request.Form("DropoffTime")
        Session("AuBurswood169_PickupLocationID") = Request.Form("PickupLocationID")
        Session("AuBurswood169_DropoffLocationID")= Request.Form("DropoffLocationID")
         if Request.Form("DropoffLocationID")="Same" then 
         Session("AuBurswood169_DropoffLocationID") =Request.Form("PickupLocationID")
         end if
        if IsDate(RequestPickDate)="True" then
        Session("AuBurswood169_RequestPickDate")=RequestPickDate
        end if
        if IsDate(RequestDropDate)="True" then
        Session("AuBurswood169_RequestDropDate")=RequestDropDate
        end if       
    
       
        '  RequestPickDate="1/Sep/2006"
        ' RequestDropDate ="11/Sep/2006"
        ' RequestPickTime="09:00" 
        ' RequestDropTime="09:00"
           '   Session("AuBurswood169_PickupLocationID") = 1
          ' Session("AuBurswood169_DropoffLocationID")= 1
             
        '----check the pickup and Return date-------------------------- 
          if Request.Form("PickupLocationID") ="0" then
              Session("AuBurswood169_ErrorMesage")="Please select pickup location."
                  Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" "
        end if
          
        if IsDate(RequestPickDate)<>"True" then
           Session("AuBurswood169_ErrorMesage")="The Pickup date does not exist."
                  Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
        end if
         
        if IsDate(RequestDropDate)<>"True" then
              Session("AuBurswood169_ErrorMesage")="The Return Date does not exist."
              Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
              
   end if   

         if  DateDiff("d", RequestDropDate, RequestPickDate)> 0 then
            Session("AuBurswood169_ErrorMesage")="Return Date is earlier then Pick up date."
              Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
            
   end if   
   
        RequestPickDateTime = CDate(RequestPickDate&" "& RequestPickTime)   
        Session("AuBurswood169_RequestPickDateTime")=RequestPickDate&" "& RequestPickTime
        RequestDropDateTime =CDate(RequestDropDate&" "& RequestDropTime)
        Session("AuBurswood169_RequestDropDateTime")=RequestDropDate&" "& RequestDropTime
        
        
        
        
       
       '---get the pickup location informations----------------------------------------------
        MinBookingDay=1
        Session("AuBurswood169_OfficeOpeningTime")="8:00"
         Session("AuBurswood169_OfficeClosingTime")="17:30"
        PickupOfficeOpeningDateTime =(RequestPickDate&" "&Session("AuBurswood169_OfficeOpeningTime"))
        PickupOfficeClosingDateTime=(RequestPickDate&" "&Session("AuBurswood169_OfficeClosingTime"))
        DropoffOfficeClosingDateTime=(RequestDropDate&" "&Session("AuBurswood169_OfficeClosingTime"))
        DropoffOfficeOpeningDateTime=(RequestDropDate&" "&Session("AuBurswood169_OfficeOpeningTime"))
       
         
        Session("AuBurswood169_PickupLocation")=""
        Session("AuBurswood169_PickupLocationCode")=""
        Session("AuBurswood169_LocationEmail")=""
        Session("AuBurswood169_DocPrFix")=""
        Session("AuBurswood169_PickupAfterHourFeeID")=0
        Session("AuBurswood169_MinimunAge")=0
        NoticeRequired=0
         Set s_pl = webConn.Execute("SELECT * FROM QLocationState where (ID) = '"&Session("AuBurswood169_PickupLocationID")&"' ")
        if Not s_pl.EOF then 
         if s_pl("TimeDifferenceGMT")=1 then
                Response.Redirect "webform.asp" 
         end if
                Session("AuBurswood169_PickupAfterHourFeeID")=s_pl("AfterHourFeeID")
              Session("AuBurswood169_PickupLocation")=s_pl("Location")
                Session("AuBurswood169_PickupLocationCode")=s_pl("CityCode")
                Session("AuBurswood169_LocationEmail")=s_pl("Email")
                Session("AuBurswood169_DocPrFix")=s_pl("DocPrFix")
                
                MinBookingDay=s_pl("MinBookingDay")
                PickupAfterHourBooking= s_pl("AfterHourBooking")  
               NoticeRequired=s_pl("NoticeRequired")
            Session("AuBurswood169_MinimunAge")=s_pl("MinimunAge")
         Session("AuBurswood169_PickupOfficeOpeningTime")=s_pl("OfficeOpeningTime")
         Session("AuBurswood169_PickupOfficeClosingTime")=s_pl("OfficeClosingTime")
         '--pickup Location Office openingDateTime
           PickupOfficeOpeningDateTime=(RequestPickDate&" "&s_pl("OfficeOpeningTime"))
         '--pickup Location Office CloseDateTime
                PickupOfficeClosingDateTime=(RequestPickDate&" "&s_pl("OfficeClosingTime"))  
         
     
        end if
        s_pl.close
        set s_pl=nothing
   
        
     '---get the dropoff location informations-------------------------
        Session("AuBurswood169_DropoffAfterHourFeeID")=0
         Session("AuBurswood169_DropoffLocation")=""
        Session("AuBurswood169_DropoffLocationCode")=""
        Set l_s = webConn.Execute("SELECT * FROM QLocationState where (ID) = '"&Session("AuBurswood169_DropoffLocationID")&"' ")
        if Not l_s.EOF then
                  if l_s("TimeDifferenceGMT")=1 then
                Response.Redirect "webform.asp" 
         end if
          Session("AuBurswood169_DropoffAfterHourFeeID")=l_s("AfterHourFeeID")
               Session("AuBurswood169_DropoffLocation")=l_s("Location")
                Session("AuBurswood169_DropoffLocationCode")=l_s("CityCode")
                DropoffAfterHourBooking= l_s("AfterHourBooking")
                 '--dropoff location Office openingDateTime,ClosingDateTime
                Session("AuBurswood169_DropoffOfficeOpeningTime") =l_s("OfficeOpeningTime")
                Session("AuBurswood169_DropoffOfficeClosingTime")=l_s("OfficeClosingTime")
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
            Session("AuBurswood169_ErrorMesage")="  Reservation requests made for "&Session("AuBurswood169_PickupLocation")&" must be made "&NoticeRequired&" days or<br>  more prior to vehicle pick up."
                  Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
             
   
   end if 
        
        if MinBookingDay > TotalRentalDays and Session("AuBurswood169_PickupLocationID")=Session("AuBurswood169_DropoffLocationID") then
            Session("AuBurswood169_ErrorMesage")="The minimum Rental period for "&Session("AuBurswood169_PickupLocation")&" Internet booking is "&MinBookingDay&" days."
                 Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
            
   
   end if 
   
   '---if relocating check if avaliable 1st, then the MinBookingDay --------------------   
       if Session("AuBurswood169_PickupLocationID")<>Session("AuBurswood169_DropoffLocationID")  then
                Set s_re = webConn.Execute("SELECT WebAvaliable,MinBookingDay FROM WebRelocationFees where CarSizeID=0 and (PickupLocationID) ='"&Session("AuBurswood169_PickupLocationID")&"' and (DropoffLocationID)='"&Session("AuBurswood169_DropoffLocationID")&"' ")
                if Not s_re.EOF then         
                   if s_re("WebAvaliable")=True then
                  if s_re("MinBookingDay") > TotalRentalDays then
                     Session("AuBurswood169_ErrorMesage")="The minimum Rental period between "&Session("AuBurswood169_PickupLocation")&" and "&Session("AuBurswood169_DropoffLocation")&" <br>for an Internet booking is "&s_re("MinBookingDay")&" days. "
                           Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
               end if
              else
                           Session("AuBurswood169_ErrorMesage")="The one way booking between "&Session("AuBurswood169_PickupLocation")&" and "&Session("AuBurswood169_DropoffLocation")&" is not avalable "
                           Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
              end if    
            end if
            s_re.close
            set s_re=nothing
       end if

        '---check Holidays with no pickup and Dropoff -----------
        SQL="SELECT * from syHolidays where (LocationID)='"&Session("AuBurswood169_PickupLocationID")&"' AND Type='P' and StartDate<= '"&RequestPickDate&"' and EndDate>='"&RequestPickDate&"' "
        SET s_hod=webConn.Execute(SQL)
         DO WHILE NOT  s_hod.EOF    '--need the loop
      
               if s_hod("WeekDays")=0 then
                     Session("AuBurswood169_ErrorMesage")="The request Pickup date "&RequestPickDate&" is unavaliable. "
                       Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
             
     
                elseif WeekDay(RequestPickDate)=s_hod("WeekDays") then
                     TheDay=WeekDayName(s_hod("WeekDays"))  
                  Session("AuBurswood169_ErrorMesage")="The request Pickup date "&TheDay&" "&RequestPickDate&" is unavaliable"
                        Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
            
   
            end if  
         s_hod.MoveNext
   Loop
        s_hod.close
        set s_hod=nothing
        
        SQL="SELECT * from syHolidays where (LocationID)='"&Session("AuBurswood169_DropoffLocationID")&"' AND Type='D' and StartDate<= '"&RequestDropDate&"' and EndDate>='"&RequestDropDate&"' "
        SET s_hod=webConn.Execute(SQL)
        DO WHILE NOT  s_hod.EOF    '--need the loop
               if s_hod("WeekDays")=0 then
                     Session("AuBurswood169_ErrorMesage")="The request Dropoff date "&RequestDropDate&" is unavaliable. "
                             Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
            
    
                   elseif WeekDay(RequestDropDate)=s_hod("WeekDays") then
                     TheDay=WeekDayName(s_hod("WeekDays"))  
                  Session("AuBurswood169_ErrorMesage")="The request Dropoff date "&TheDay&" "&RequestDropDate&" is unavaliable. "
                 Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
            
            end if 
         s_hod.MoveNext
   Loop
        s_hod.close
        set s_hod=nothing 
  
   '--Check if location will take bookings outside office hours, Unattended Dropoffs 
   if PickupAfterHourBooking = "False" then
                    if  RequestPickDateTime < CDate(PickupOfficeOpeningDateTime)  or RequestPickDateTime > CDate(PickupOfficeClosingDateTime)  then 
                        Session("AuBurswood169_ErrorMesage")="Pickup Locatlion "&Session("AuBurswood169_PickupLocation")&"   will not take bookings outside office hours ("&Session("AuBurswood169_PickupOfficeOpeningTime")&" - "&Session("AuBurswood169_PickupOfficeClosingTime")&").<Br>Please contact the bookings office directly."
                Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
            
            end if 
       end if
       if DropoffAfterHourBooking = "False" then        
                 if  UnattendedDropoffs = "False" and ( RequestDropDateTime > CDate(DropoffOfficeClosingDateTime) or RequestDropDateTime <CDate(DropoffOfficeOpeningDateTime) ) then 
                        Session("AuBurswood169_ErrorMesage")="Dropoff Location "&Session("AuBurswood169_DropoffLocation")&"  will not take bookings outside office hours ("&Session("AuBurswood169_DropoffOfficeOpeningTime")&" - "&Session("AuBurswood169_DropoffOfficeClosingTime")&").<Br>Please contact the bookings office directly."
                     Response.Redirect "webbookingstep1.asp?URL="&Request.Form("strURL")&" " 
            
                 end if
       end if
        

   '---use Session to pass between subs for insert to Table
       
        Session("AuBurswood169_NoOfDays")=1
     
   '---calculat the total min - Grace period  (mins)
          Totalmin=0 
         Session("AuBurswood169_Graceperiod")=0
          Set RG=webConn.Execute("SELECT * FROM SystemTable WHERE Code='GP'  ")
    If not RG.EOF then     
            Session("AuBurswood169_Graceperiod")=RG("syValue")
   END IF
         RG.CLOSE
   SET RG=NOTHING  
   Session("AuBurswood169_TotalRentalDays")=0
   Totalmin= Round((RequestDropDateTime - RequestPickDateTime)*1440-Session("AuBurswood169_Graceperiod"),2)
        Session("AuBurswood169_TotalRentalDays")=Totalmin/1440
        actureTotalDays=Round(Totalmin/1440,2) '---for find out the extra hours in which season
            
        if  Session("AuBurswood169_TotalRentalDays") > Fix(Session("AuBurswood169_TotalRentalDays")) then
            Session("AuBurswood169_TotalRentalDays")=Fix(Session("AuBurswood169_TotalRentalDays"))+1
         end if   
      '---daily Extrafees always use   Session("AuBurswood169_TotalRentalDays") (fixed number) ----
      
             
       '------the form-----------------------------------------------
       
   
        'Response.Write("<form method=post action='webBookingStep3.asp?dir=Rate'  name='Rate'  >")
    %>  
   <!---pass Booking Information --> 
     
       <input type="hidden" name=LocationEmail value='<%=LocationEmail%>' > 
       <input type="hidden" name=MinimunAge value='<%=MinimunAge%>' > 
       <input type=hidden name=TotalRentalDays value='<%=TotalRentalDays%>'>
       <input type=hidden name=actureTotalDays value='<%=actureTotalDays%>'> 
        
         <input type=hidden name=RequestPickDateTime value='<%=RequestPickDateTime%>'>
         <input type=hidden name=RequestPickDate value='<%=RequestPickDate%>'>
         <input type=hidden name=RequestPickTime value='<%=RequestPickTime%>'>  
        <input type=hidden name=PickupLocationID value='<%=Session("AuBurswood169_PickupLocationID")%>'>
        <input type=hidden name=PickupLocation value='<%=PickupLocation%>'>
      
        <input type=hidden name=RequestDropDateTime value='<%=RequestDropDateTime%>'>
         <input type=hidden name=RequestDropDate value='<%=RequestDropDate%>'>
        <input type=hidden name=RequestDropTime value='<%=RequestDropTime%>'>  
        <input type=hidden name=DropoffLocationID value='<%=Session("AuBurswood169_DropoffLocationID")%>'>
        <input type=hidden name=DropoffLocation value='<%=DropoffLocation%>'> 
      
         <input type=hidden name=Flight value='<%=Request.Form("Flight")%>' >
         <input type=hidden name=Flightout value='<%=Request.Form("Flightout")%>' >
          <input type=hidden name=NoTravelling value='<%=Request.Form("NoTravelling")%>'>
            
          <input type=hidden name=Flight value='<%=Request.Form("Flight")%>' >
         <input type=hidden name=Flightout value='<%=Request.Form("Flightout")%>' >
          <input type=hidden name=NoTravelling value='<%=Request.Form("NoTravelling")%>'>
         
         <input type=hidden name=DOBDay value='<%=Request.Form("DOBDay")%>' >
   <input type=hidden name=DOBMonth value='<%=Request.Form("DOBMonth")%>' >
   <input type=hidden name=DOBYear value='<%=Request.Form("DOBYear")%>' >
       
          
<%
       
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

          'ExtraForm 
                'InsuranceExtra   
                Response.Write("<TR height=2><td colspan=5 bgColor=#233a32 ></td></tr>")
                Response.Write("<tr><td  colspan=5 align=right class=text><INPUT TYPE=button NAME=Back  VALUE=Back  class=button onClick='javascript:history.back(-1)'></td></form></tr></table>")
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
  <!-- END RCM HTML CODE -->
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
