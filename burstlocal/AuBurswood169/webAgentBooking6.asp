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
<!--  distributed under license restricting its use, copying, distribution and    -->
<!--  and decompilation. No part of this product or related documentation may  -->
<!--  reproduced in any form by any means without prior written consent of -->
<!--  GMH Systems LTD  -->
<!--  For more information contact info@rentalcarmanager.com -->
<style>
.text {font-family: Arial, Helvetica, Times New Roman; font-size:8pt;color:#666666}
.greytext {font-family: Arial, Helvetica, Times New Roman; font-weight:bold; font-size:8pt;color:#999999}
.white {FONT-FAMILY: Arial, Helvetica, Sans-serif; font-weight:bold; FONT-SIZE: 8pt; COLOR:#FFFFFF; TEXT-DECORATION:none;   }
.title {FONT-FAMILY: Arial, verdana,Helvetica, Sans-serif; font-weight:bold; FONT-SIZE:  9pt; COLOR:#454545;  TEXT-DECORATION:none;   }
SELECT {font-family: Arial, Helvetica, Times New Roman; font-size:8pt;color:#666666}
</style>
</head>
<body style="margin-left: 0px; margin-top: 0px; margin-right: 0px;">
         
<%




         RCMURL="https://secure20.rentalcarmanager.com.au"


        CompanyCode="Australiawide71"
        DatabaseFile="Australiawide71"

        Dim webConn     'webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

         webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"



'---------Company address---------------------------------------
       '1. use billinglocation for the Company address
       '2. for Unallocated Reservation Use Operate location address (Session("gcRedBaclk_BranchID"))   
            SQL="SELECT * from QReservationforBuffer where ReservationNo="&CLng(Request.QueryString("ReservationNo"))&" "
                Set s_d=webConn.Execute(SQL)
               
             
         '---pickup
   PickupDayName=WeekdayName(Weekday(s_d("Pickupdate")))
   pickupYear=Right(Year(s_d("Pickupdate")),2)  
   pickupMonty=Left(MonthName(Month(s_d("Pickupdate"))),3)  
   pickDay=Day(s_d("Pickupdate"))
   pickupDate=pickDay&"/"&pickupMonty&"/"&pickupYear      
                  
   DropoffDayName=WeekdayName(Weekday(s_d("Dropoffdate")))
   DropoffYear=Right(Year(s_d("Dropoffdate")),2)  
   DropoffMonty=Left(MonthName(Month(s_d("Dropoffdate"))),3)  
   DropoffDay=Day(s_d("Dropoffdate"))
   DropoffDate=DropoffDay&"/"&DropoffMonty&"/"&DropoffYear  
   
   Collectionpoint =s_d("PickupCity")
   Returnpoint =s_d("DropoffCity")
 
%>
<table id=1 valign=top width=580 border=0 cellspacing=0 cellpadding=0 align=center>
<tr><td valign=top >  <p><br><br>
           
        <table align=center width=100% ><tr><td>
   <%     logo="logo.gif"
     
          Response.Write("<IMG  src='"&logo&"' >")
      Response.Write("</td><td align=center >") 
   
   

       
        Set s_add=webConn.Execute("SELECT * FROM QLocationState WHERE  ID= "&s_d("PickupLocationID")&" ")
        Set s_com=webConn.Execute("SELECT * from Company  where ID=6 ")
         if Not s_add.EOF and Not s_com.EOF then   
               Response.Write("<table align=center ><tr><td colspan=2 align=center class=title>"&s_com("Company")&"</td></tr>")
             Response.Write("<tr><td  colspan=2 align=center class=text>"&s_com("Address")&"&nbsp;&nbsp;"&s_com("Suburb")&"&nbsp;&nbsp;"&s_com("City")&"")
              ' if s_com("StateCode")="N/A" then
                     Response.Write("&nbsp;"&s_com("PostCode")&"&nbsp;"&s_com("Country")&"")
              ' else
                  'Response.Write("&nbsp;"&s_com("StateCode")&"&nbsp;"&s_com("PostCode")&"&nbsp;"&s_com("Country")&"")
              ' end if
               Response.Write("</td></tr>")
               Response.Write("<tr><td align=center colspan=2 class=text>Tel: "&s_com("Phone")&"&nbsp;&nbsp;&nbsp;")
               Response.Write("&nbsp;&nbsp;Fax: "&s_com("Fax")&"</td></tr>")
               Response.Write("<tr><td align=center colspan=2 class=text>Email: "&s_com("Email")&"</td></tr>")
               Response.Write("<tr><td align=center colspan=2 class=text>ABN: "&s_com("GSTNo")&"</td></tr>")
               
        Response.Write("</table>")
              Response.Write("</td></tr></table>") 
       end if  
       s_add.close
       set s_add=nothing
       s_com.close
       set s_com=nothing        
    Response.Write("</td></tr><tr><td height=1 bgcolor=#000000></td></tr>")  
    Response.Write("<tr><td align=center class=title >Renter Information</td></tr>")
    Response.Write("<tr><td width=100% >") 
    
    
   '---Date 
       sYear = Year(Now)
       sMonth =Left(MonthName(Month(Now)),3)
       sDay=Day(Now)
       sReportDate=sDay&"/"&sMonth&"/"&sYear 
           
   
   '-------the customer name
              ABN=""
              Company=""
              FirstName = ""
        LastName=""
        Address=""
        Suburb=""
        State=""
        Postcode=""
        Country=""
        
         if s_d("customerID")<>0 then
                  Set S_name=webConn.Execute("SELECT *  FROM QCustomersList WHERE (acID)="&s_d("customerID")&" ")
                  if NOT S_name.EOF then 
                  Company=S_name("acCompany") 
                  ABN=S_name("acGSTNo") 
                  FirstName = S_name("acFirstName")
        LastName=S_name("acLastName")
        Address=S_name("acPostalAddress")
        Suburb=S_name("acCity")
        State=S_name("acState")
        Postcode=S_name("acPostCode")
        Country=S_name("Country")
         end if
        S_name.close
        set S_name=nothing
         end if

   Response.Write("<table width=100% id=3 valign=top border=0 cellspacing=0 cellpadding=1  >")
      Response.Write("<tr><td class=text width=150>Date: </td><td class=text align=left>"&sReportDate&"</TD></tr>")
         Response.Write("<tr><td class=text>Renter's Name:&nbsp;&nbsp;</td><TD align=left class=text >"&FirstName&"&nbsp;"&UCase(LastName)&"</TD></tr>")

   Response.Write("<tr><td class=text>Address:</td><TD class=text align=left>"&Address&" "&Suburb&"</TD></tr>")
   Response.Write("<tr><td class=text></td><TD class=text align=left>"&State&" "&Postcode&" "&Country&"</TD></tr>")
         Response.Write("</table></td></tr>")
             
   Response.Write("<tr><td height=1 bgcolor=#000000></td></tr>")
   
   Response.Write("<tr><td align=center class=title >Booking Details </td></tr>")
        Response.Write("<tr><td align=center class=title width=100% >")
         Response.Write("<table width=100% ><tr><td>")
            Response.Write("<table align=left ><tr><td class=text align=left width=150>BOOKING NO:</td><td align=left class=text>#U-"&Request.QueryString("ReservationNo")&"</td></tr>")
         Response.Write("<tr><td  align=left class=text>Vehicle Category:</td><td  align=left class=text>"&Session("RCM61a_CarType")&"</td></tr>")
         Response.Write("<tr><td  align=left class=text>Pickup:</td><td class=text align=left>"&pickupDate&"&nbsp;"&s_d("PickupTime")&"&nbsp;&nbsp;"&Collectionpoint&" </td></tr>")
      Response.Write("<tr><td  align=left class=text>Dropoff:</td><td class=text align=left>"&DropoffDate&"&nbsp;"&s_d("DropoffTime")&"&nbsp;&nbsp;"&Returnpoint&"</td></tr>")
         Response.Write("</table>")
         Response.Write("</td><td><IMG  src='"&theimage&"' ></td></tr>")
                  Response.Write("</table></td></tr>")
        Response.Write("<tr><td height=1  bgcolor=#000000></td></tr>")
        Response.Write("<tr><td>")
   Response.Write("<table width=100% border=0 cellspacing=0 cellpadding=2>")
    Response.Write("<tr><td class=text><b>Rental Rates and Fees</td><td class=text ><b>Days </td><td class=text align=right><b></td><td class=text align=right><b>Rate</td><td  class=text align=right><b>Total</td></tr>")
                  
         
      '----the rates
         Set s_rate=webConn.Execute("SELECT * from QPaymentDetailBuffer WHERE (ReservationNo)="&CLng(Request.QueryString("ReservationNo"))&" ")
       
         CarTotalCost=0
         cost=0 
         TotalRentalDays=0
         DO WHILE NOT s_rate.EOF
            cost=s_rate("Days")*s_rate("Rate")  
         
            CarTotalCost=CartotalCost+cost
            TotalRentalDays=TotalRentalDays+s_rate("Days") 
            if s_rate("Season")="Default" then
                 Season="Standard"
            else
                Season=s_rate("Season")
            end if 
               if s_rate("DiscountPerc")<>0 then   
              Set s_dis=webConn.Execute("SELECT * from Discount WHERE ID="&s_rate("DiscountID")&" ")
            Response.Write("<tr><td colspan=5 height=1 bgcolor=#D1D1D1  ></td></tr>")
         Response.Write("<tr><td class=text>"&Season&"</td><td class=text nowrap>"&s_rate("Days")&" Days</td><td align=right  nowrap class=text colspan=2>"&FormatCurrency(s_rate("Rate"),2)&" (per day)</td><td width=50 class=text align=right>"&FormatCurrency(cost,2)&"</td></tr>")
                       s_dis.close
                       set s_dis=Nothing
               else
         if  s_rate("Rate")>0 then
         Response.Write("<tr><td colspan=5 height=1 bgcolor=#D1D1D1  ></td></tr>")
   
         Response.Write("<tr><td class=text >"&Season&"</td><td class=text>"&s_rate("Days")&"</td><td></td><td align=right class=text> "&FormatCurrency(s_rate("Rate"),2)&"</td><td class=text align=right>"&FormatCurrency(cost,2)&"</td></tr>")
                        end if
                end if
        s_rate.MoveNext
        Loop 
        s_rate.close    
        set s_rate=nothing
         CarRentalCost=CarTotalCost '--for extra % type calculation
        if  Session("RCM61a_KmsDesc")<>"" then
                 Response.Write("<tr><td colspan=5 height=1 bgcolor=#D1D1D1  ></td></tr>")
      Response.Write("<tr><td colspan=2 class=text>"&Session("RCM61a_KmsDesc")&" </td></tr>")
                        
         end if 
       
        '--- extra fees-------------
        Set s_extra=webConn.Execute("SELECT * from QPaymentExtraFeesBuffer WHERE (ReservationNo)="&CLng(Request.QueryString("ReservationNo"))&" ORDER BY type, Name")
       
        EachExtraFees=0
        TotalExtraFees=0
        DO WHILE NOT s_extra.EOF
              
                 EachExtraFees=s_extra("ExtraValue")
         ExtraFeesQTY=s_extra("QTY")
      theQTY=""
                  if ExtraFeesQTY>1 then
               theQTY="QTY "&ExtraFeesQTY
               end if
            Response.Write("<tr><td colspan=5 height=1 bgcolor=#D1D1D1 ></td></tr>")
           Response.Write("<tr><td class=text nowrap>"&s_extra("Name")&"</td>")
           Response.Write("<td class=text >"&theQTY&"</td><td></td>")  
           extraType=s_extra("Type")
            if s_extra("SetMaxPrice")  =True then
                 extraType="Fixed"
            end if
            if s_extra("Type")="Percentage" then
                     Response.Write("<td class=text align=right></td><td class=text align=right>"&FormatCurrency(EachExtraFees,2)&"</td></tr>")
                   
            else
                   Response.Write("<td class=text align=right>"&extraType&" @ "&FormatCurrency(s_extra("Fees"),2)&"</td><td class=text align=right>"&FormatCurrency(EachExtraFees,2)&"</td></tr>")
                  
            end if
            
                TotalExtraFees=TotalExtraFees+EachExtraFees
        s_extra.MoveNext
        Loop 
        s_extra.close   
        set s_extra=nothing
        '--other extra fees
        
        
        if  Session("RCM61a_KmsDesc")<>"" then
                  Response.Write("<tr><td colspan=4 class=text>"&Session("RCM61a_KmsDesc")&" </td><td class=text>")
                  if Session("RCM61a_KmsCost")<>0 then
                    Response.Write(""&FormatCurrency(Session("RCM61a_KmsCost"),2)&"")
                  end if
                  Response.Write("</td></tr>")
            end if
            if Session("RCM61a_AreaofUsed")<>"" then
                 Response.Write("<tr><td class=greytext>Area of Use:<td class=text colspan=4>"&Session("RCM61a_AreaofUsed")&" </td></tr>")
            end if

    
   '---Stamp Duty, rate based on each location(state)-----------
         StampDutyRate=0
         GSTRate= 0
         StampDuty=0
         
         Set s_st=webConn.Execute("SELECT * FROM QStampDuty WHERE ID="&s_d("PickupLocationID")&"  ")
         If not s_st.EOF then
                  StampDutyRate=s_st("StampDuty")/100 
                  GSTRate= s_st("GSTRate")/100  
         end if
         s_st.close
          set s_st=nothing
    
         if StampDutyRate>0 AND s_d("StampDuty")>0 then
                  StampDuty=Round(s_d("StampDuty"),2)
                        Response.Write("<tr><td colspan=5 height=1 bgcolor=#D1D1D1></td></tr>")
                  Response.Write("<tr><td  bgColor=#FFFFFF  class=text colspan=4>StampDuty ("&(StampDutyRate*100)&"%): </td><td bgColor=#FFFFFF class=text align=right>"&FormatCurrency(s_d("StampDuty"),2)&"</td></tr>")
          end if
          TotalCost=0
          TotalCost=(StampDuty+CarRentalCost+TotalExtraFees)+ Session("RCM61a_KmsCost")
          Response.Write("<tr><td colspan=5 height=1 bgcolor=#999999></td></tr>")

          Response.Write("<tr><td class=text colspan=3><b>Total Cost of Rental: </td><td></td>")
          Response.Write("<td align=right colspan=2 class=text>"&Session("RCM61a_CompanyCurrency")&" "&FormatCurrency(TotalCost,2)&"</td></tr>")
          Response.Write("<tr><td class=text colspan=2></td><td class=text colspan=3 align=right>")
          Response.Write("(incl "&Session("RCM61a_GSTDesc")&" of "&FormatCurrency(s_d("GST"),2)&")")
          Response.Write("</td></tr>")


   
     
       '-------the payment
       Response.Write("<tr><td colspan=5 height=1 bgcolor=#999999  ></td></tr>")
       Response.Write("<tr><td colspan=5 class=text><b>Payment Details</td></tr>")
         
                Set s_p=webConn.Execute("SELECT * from ReservationPaymentBuffer  WHERE (ReservationNo)='"&CLng(Request.QueryString("ReservationNo"))&"'  ")
        
         PaidAmount=0
            Balance=0
            While Not s_p.EOF    
               DatePaid=Day(s_p("PaymentDate"))&"/"&Left(MonthName(Month(s_p("PaymentDate"))),3)&"/"&Year(s_p("PaymentDate"))
                  
               Response.Write("<tr><td colspan=5 height=1 bgcolor=#D1D1D1  ></td></tr>")
            if s_p("Paid")<0 then
                  Response.Write("<tr ><td align=left class=text>Amount Refunded:</td><td CLASS=text colspan=2>"&s_p("PaymentType")&"</td><td CLASS=text>"&DatePaid&"</td><td CLASS=text align=right>"&FormatCurrency(s_p("Paid"),2)&"</td></tr>")
                        else
            Response.Write("<tr ><td align=left class=text>Amount Paid:</td><td CLASS=text colspan=2>"&s_p("PaymentType")&"</td><td CLASS=text>"&DatePaid&"</td><td CLASS=text align=right>"&FormatCurrency(s_p("Paid"),2)&"</td></tr>")
                        end if
                         PaidAmount=PaidAmount+s_p("Paid")
                        s_p.MoveNext 
               Wend
            s_p.close
            set s_p=nothing
        
            Balance=Round(TotalCost,2)-PaidAmount 
                ' if  Balance<0.05 and  Balance>-0.05 then
                'Balance
                ' end if
            Response.Write("<tr><td colspan=5 height=1 bgcolor=#D1D1D1  ></td></tr>")
            Response.Write("<tr ><td align=left class=text colspan=3><b>Balance Due:</td><td CLASS=text align=right  colspan=2><b>"&Session("RCM61a_CompanyCurrency")&" "&FormatCurrency(Balance,2)&" </td></tr>")
                          Response.Write("<tr><td colspan=5 height=1 bgcolor=#999999 ></td></tr>")
    
                
        Response.Write("<tr ><td class=text colspan=5 align=right >(All Prices "&Session("RCM61a_GSTDesc")&" Inclusive)</td></tr>")
                      
     %>
    <tr ><td class=text colspan=5  height=20>
   
   
 </table>      
</td></tr> </table> 
 <%   s_d.close
    set s_d=nothing
     webConn.CLOSE
   set webConn=nothing   
   %>
            
