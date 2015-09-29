<%
ignorehack = True
allowanything = False
%>
<!--#include file="a_server-checks.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
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
SELECT {   font-family: Arial;font-size: 8pt;color: #666666; }
.button {   font-family: Arial;font-size: 8pt;color: #666666; }
input  {   font-family: Arial;font-size: 8pt;color: #666666; }
</style>
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<centear>
<TABLE align=center width="680" cellSpacing=0 cellPadding=0  border=0>
<tr><td >   

<%

        RCMURL="https://secure20.rentalcarmanager.com.au"


        CompanyCode="Australiawide71"
        DatabaseFile="Australiawide71"

        Dim webConn     'webConn
         Set webConn = Server.CreateObject("ADODB.Connection")

         webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"



       theimage=RCMURL&"/DB/"&CompanyCode&"/"&Session("AuBurswood169_CarImageName")
          ServerID=20
        RCMCompanyID=71


         theimage="https://secure20.rentalcarmanager.com.au/DB/"&CompanyCode&"/"&Session("RCM169a_CarImageName")

        logo="logo_burswood.gif"
         logo="https://secure20.rentalcarmanager.com.au/DB/"&CompanyCode&"/"&logo
        FilePath=Server.MapPath("/DB")&"\"&CompanyCode
          
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
 
IF Session("RCM169a_UnallocatedRANo") ="" then
            CardNumber=request.form("ccNumber1")&""&request.form("ccNumber2")&""&request.form("ccNumber3")&""&request.form("ccNumber4")
            CardDate=request.form("ccDate1")&"/"&request.form("ccDate2")
            ccName=tidyup(Request.form("ccName"))
            ccType=Request.form("ccType")
            'CardDate="03/12"
           ' CardNumber=""
           ' CardDate=""
             Session("RCM169a_DOB")= "1/Jan/1900"
   
            Session("RCM169a_LicExpDate") ="1/Jan/2010"
               Session("RCM169a_FirstName")=tidyup(Request.Form("firstname"))
               Session("RCM169a_LastName")=tidyup(Request.Form("lastname"))
            Session("RCM169a_License")=""
         Session("RCM169a_address")=Request.Form("address")
         Session("RCM169a_city")=Request.Form("city")
         Session("RCM169a_state")=Request.Form("state")
         Session("RCM169a_postcode")=Request.Form("postcode")
         Session("RCM169a_countryID")=Request.Form("countryID")
         Session("RCM169a_CustomerEmail")=tidyup(Request.Form("CustomerEmail"))
         Session("RCM169a_phone")=tidyup(Request.Form("phone"))
         Session("RCM169a_fax")=Request.Form("fax")
         Session("RCM169a_Notes")=Request.Form("Notes")
                 
                  Set s_c=webConn.Execute("SELECT * FROM Country where (ID)='"&Request.Form("countryID")&"' " )
                 Session("RCM169a_country")=s_c("Country")
                 s_c.close
                 Set s_c=nothing
              
                
                  
                  Session("RCM169a_AmountCollected")=0
               if Request.Form("AgentCollected")<>"" then
                     Session("RCM169a_AmountCollected")=Request.Form("AgentCollected")
               end if
   if Session("RCM169a_CustomerID")="" then
            SQL="INSERT INTO customers (CompanyID,DoNotRentID,acPostalAddress,acCity,acState,acPostcode,acCountryID,acFax,acDOB,acLicenseExpiry,acLicense,acFirstName, acLastName, acEmail, acPhone,CC_Type,CC_Number,CC_Name,CC_Date)"
            SQL=SQL&"VALUES (0,0,'"&Left(tidyup(Session("RCM169a_address")),80)&"','"&Left(tidyup(Session("RCM169a_city")),50)&"','"&Left(tidyup(Session("RCM169a_state")),30)&"','"&Left(tidyup(Session("RCM169a_postcode")),10)&"','"&Session("RCM169a_CountryID")&"','"&Left(tidyup(Session("RCM169a_fax")),15)&"','"&Session("RCM169a_DOB")&"','"&Session("RCM169a_LicExpDate")&"','"&Left(tidyup(Session("RCM169a_License")),30)&"','"&Left(tidyup(Session("RCM169a_firstname")),30)&"','"&Left(tidyup(Session("RCM169a_lastname")),30)&"','"&Left(tidyup(Session("RCM169a_CustomerEmail")),50)&"','"&Left(tidyup(Session("RCM169a_phone")),20)&"','"&Left(Tidyup(ccType),40)&"','"&CardNumber&"','"&Left(Tidyup(ccName),50)&"','"&CardDate&"')"
        'Response.Write(SQL)
         webConn.Execute(SQL) 
         '---get customerID
            Set s_cus=webConn.Execute("SELECT Max(acID)  as customID FROM Customers where acLastName ='"&tidyup(Session("RCM169a_lastname"))&"' ")
            Session("RCM169a_CustomerID")=s_cus("customID")
            s_cus.close 
            set s_cus=nothing
   end if
 


     
     BrandID=6
 
   '---Insert the booking details to ReservationBuffer table  
      DateEntered =Day(Now)&"/"&Monthname(Month(Now))&"/"&Year(Now)
         SQL="INSERT INTO ReservationBuffer (driverage,DateEntered,UpdatedDate,EnteredBy,LastUpdatedBy,BrandID,AgentCommission,AddKmsFee,KmsFree,AgentEmail,AgentBranchID,AgencyName,NoTravelling,Flightout,Flight,StampDuty,GST,PickupDateTime,DropoffDateTime,CustomerID,RentalSource,CarSizeID,PickupTime,Pickupdate,DropoffTime,DropoffDate,PickupLocationID,DropoffLocationID,Notes,ReservationTypeID)"
   SQL=SQL&"VALUES ('"&Session("RCM169a_driverage")&"','"&DateEntered&"','"&DateEntered&"',2,2,"&BrandID&","&Session("RCM169a_AgentCommissionValue")&","&Session("RCM169a_AddKmsFee")&","&Session("RCM169a_KmsFree")&",'"&Left(tidyup(Session("RCM169a_AgentEmail")),50)&"','"&Session("RCM169a_AgentBranchID")&"','"&Left(tidyup(Session("RCM169a_AgencyName")),30)&"','"&Left(tidyup(Session("RCM169a_NoTravelling")),20)&"','"&Left(tidyup(Session("RCM169a_Flightout")),50)&"','"&Left(tidyup(Session("RCM169a_Flight")),50)&"','"&Session("RCM169a_StampDuty")&"','"&Session("RCM169a_GST")&"','"&Session("RCM169a_RequestPickDateTime")&"','"&Session("RCM169a_RequestDropDateTime")&"' ,"&(Session("RCM169a_CustomerID"))&",'Online Booking',"&(Session("RCM169a_CarSizeID"))&",'"&Session("RCM169a_RequestPickTime")&"','"&Session("RCM169a_RequestPickDate")&"','"&Session("RCM169a_RequestDropTime")&"', '"&Session("RCM169a_RequestDropDate")&"', "&Session("RCM169a_PickupLocationID")&", "&Session("RCM169a_DropoffLocationID")&", '"&Left(tidyup(Session("RCM169a_Notes")),250)&"', '1')"
    '   SQL="INSERT INTO ReservationBuffer (BrandID,Quotation,AddKmsFee,KmsFree,FreeSale,Flightout,Flight,StampDuty,GST,PickupDateTime,DropoffDateTime,CustomerID,RentalSource,CarSizeID,PickupTime,Pickupdate,DropoffTime,DropoffDate,PickupLocationID,DropoffLocationID,Notes,ReservationTypeID)"
    '  SQL=SQL&"VALUES (0,"&Quotation&","&Session("RCM71_AddKmsFee")&","&Session("RCM71_KmsFree")&","&FreeSale&",'"&Left(tidyup(Session("RCM71_Flightout")),50)&"','"&Left(tidyup(Session("RCM71_Flight")),50)&"','"&Session("RCM71_StampDuty")&"','"&Session("RCM71_GST")&"','"&Session("RCM71_RequestPickDateTime")&"','"&Session("RCM71_RequestDropDateTime")&"' ,"&(CustomerID)&",'"&RentalSource&"',"&(Session("RCM71_CarSizeID"))&",'"&Session("RCM71_RequestPickTime")&"','"&Session("RCM71_RequestPickDate")&"','"&Session("RCM71_RequestDropTime")&"', '"&Session("RCM71_RequestDropDate")&"', "&Session("RCM71_PickupLocationID")&", "&Session("RCM71_DropoffLocationID")&", '"&Left(tidyup(Session("RCM71_Notes")),250)&"', '1')"
       'Response.Write("<p>")
      ' Response.Write(SQL)
         webConn.Execute(SQL)   
  
   '---get the ReservationNo
     ' Set s_No=webConn.Execute("SELECT Max(ReservationNo)  as ResNo FROM ReservationBuffer ")
       Set s_No=webConn.Execute("SELECT Max(ReservationNo)  as ResNo FROM ReservationBuffer where  CustomerID='"&Session("RCM169a_CustomerID")&"' ")
    Session("RCM169a_UnallocatedRANo") = s_No("ResNo")
      
      s_No.close
       set     s_No=nothing       
      '--insert Unallocaited RA# to WebReservaiton table to check if user pass step5?  
      Quotation="No" 
      ReservationTypeID=1  '--for online booking   
      
          
      SQL="UPDATE WebReservation SET "
      SQL=SQL&" BookingType ="&ReservationTypeID&",  "          
         SQL=SQL&" Name ='"&tidyup(Session("RCM169a_lastname"))&"',  "
         SQL=SQL&" Phone ='"&tidyup(Session("RCM169a_phone"))&"',  "
         SQL=SQL&" Email ='"&tidyup(Session("RCM169a_CustomerEmail"))&"',  "
      SQL=SQL&" ReservationTypeID ="&ReservationTypeID&",  "          
      SQL=SQL&" UnallocatedRA ='"&Session("RCM169a_UnallocatedRANo")&"'  "
       'SQL=SQL&" customerID ='"&Session("RCM169a_UnallocatedRANo")&"'  "
      SQL=SQL&"WHERE (ReservationNo) ='"&Session("RCM169a_OnlineBookingNo")&"'"
      '  Response.Write("<p>") 
       'Response.Write(SQL)
      webConn.Execute(SQL)   

      Set s_km=webConn.Execute("SELECT * FROM WebReservationFees WHERE (rf_ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' ")
       if Not s_km.EOF   then
              
               SQL="INSERT INTO ReservationFeesBuff (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)"
             SQL=SQL&"VALUES ("&Session("RCM169a_UnallocatedRANo")&","&s_km("rf_MaxKmscharge")&","&s_km("rf_DailyRate")&")"
                'Response.Write(SQL)                                 
            webConn.Execute(SQL) 
      end if
   s_km.Close
   Set s_km=nothing 
   
       '--get each season record from the WebPaymentDetail and insert to paymentdetailes table 
        webConn.Execute("DELETE  FROM PaymentDetailBuffer WHERE (ReservationNo)='"&Session("RCM169a_UnallocatedRANo")&"' ")
         Set s_rate=webConn.Execute("SELECT * FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' ")
         RentalCost=0
      While Not s_rate.EOF
                 RentalCost=s_rate("Days")* s_rate("Rate") + RentalCost 
         SQL="INSERT INTO PaymentDetailBuffer (TripRates,DiscountType,DiscountName,DiscountPerc,StandardRate,Rate,ReservationNo,SeasonID,Days,RateName)" 
               SQL=SQL&"VALUES (0,'"&Session("RCM169a_DiscountType")&"','"&tidyup(Session("RCM169a_DiscountName"))&"',"&Session("RCM169a_DiscountRate")&","&s_rate("StandardRate")&","&s_rate("Rate")&","&Session("RCM169a_UnallocatedRANo")&","&s_rate("SeasonID")&","&s_rate("Days")&",'"&tidyup(s_rate("RateName"))&"')"
               'Response.Write("<br>") 
            'Response.Write(SQL)
            webConn.Execute(SQL) 
   s_rate.MoveNext 
   Wend
   s_rate.Close
   Set l_s=nothing    
        
    '-Insert Extra Fees (Mandatory and Selected)  to PaymentExtraFeesBuffer table 
        webConn.Execute("DELETE FROM PaymentExtraFeesBuffer WHERE (ReservationNo)='"&Session("RCM169a_UnallocatedRANo")&"' ")
   'Set s_rate=webConn.Execute("SELECT * FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' ")
       Set s_rate=webConn.Execute("SELECT WebPaymentExtraFees.*, Name, Type,PayAgency FROM WebPaymentExtraFees, ExtraFees WHERE  (ReservationNo)='"&Session("RCM169a_OnlineBookingNo")&"' and ExtraFeesID = ExtraFees.ID ORDER BY TYPE, NAME ")
   While Not s_rate.EOF
               EachExtraFees=s_rate("ExtraValue")
               SetMaxPrice=0
               if    s_rate("SetMaxPrice")=True then   
                       SetMaxPrice=1
               end if
      EachExtraFees=Round(EachExtraFees,2)  
            SQL="INSERT INTO PaymentExtraFeesBuffer(ExtraValue,SetMaxPrice,QTY,ReservationNo,ExtraFeesID,Fees,Days)" 
            SQL=SQL&"VALUES ("&EachExtraFees&","&SetMaxPrice&","&s_rate("QTY")&",'"&Session("RCM169a_UnallocatedRANo")&"',"&s_rate("ExtraFeesID")&","&s_rate("Fees")&","&s_rate("Days")&")"
               'Response.Write("<br>") 
                'Response.Write(SQL)
                  webConn.Execute(SQL)  
   s_rate.MoveNext 
   Wend
   s_rate.Close
   Set s_rate=nothing   
       
   '--agent collected  
   if Session("RCM169a_AmountCollected")>0 then
   PaymentDate=Day(Now)&"/"&MonthName(Month(Now))&"/"&Year(Now)
        webConn.Execute("DELETE FROM ReservationPaymentBuffer WHERE (ReservationNo)='"&Session("RCM169a_UnallocatedRANo")&"' ")
        SQL="INSERT INTO ReservationPaymentBuffer(ReservationNo,PaymentType,Paid,PaymentDate)" 
       SQL=SQL&"VALUES ("&Session("RCM169a_UnallocatedRANo")&",'Agent Collected','"&Session("RCM169a_AmountCollected")&"','"&PaymentDate&"')"
      'Response.Write("<br>") 
     'Response.Write(SQL)
         webConn.Execute(SQL)   
       
       end if
         '--  send email to the Company
                   
             '-----use company info  
        Set s_com=webConn.Execute("SELECT * from Company WHERE ID=6  ")
        if s_com("BrandLogo")<>"" then
        'logo=s_com("BrandLogo")
        end if
        Company=s_com("Company")  
        CompanyEmail=s_com("Email")

         BranchAddress=s_com("Address")
        BranchCity = s_com("Suburb")
        BranchPostCode = s_com("State")&"&nbsp;"&s_com("PostCode")&"&nbsp;"&s_com("Country")
        BranchPhone=s_com("Phone")  
        BranchFax=s_com("Fax")    
         if s_com("WebSite")<>"" then
                     WebSite="<a href=http://"&s_com("WebSite")&">"&s_com("WebSite")&"</a>"
        end if 
                  FreePhone=""      
        if s_com("FreePhone")<>"" then
                     FreePhone="&nbsp;&nbsp;Free Phone: "&s_com("FreePhone")&""
        end if          
         s_com.close
         set  s_com=nothing       
    '-----Send a confirmation to customer         
         Subject1="Agent Online Booking Request with "&Company&" - Ref #U-"&Session("RCM169a_DocPrFix")&""&Session("RCM169a_UnallocatedRANo")&" ("&Session("RCM169a_PickupLocation")&")"
            
            
                 
      Dim  HTML
      Dim MyCDONTSMail
    
    '--to Location       
        Set MyCDONTSMail = CreateObject("CDONTS.NewMail")
        'MyCDONTSMail.From = Session("RCM169a_CustomerEmail")
        MyCDONTSMail.From = CompanyEmail  '----Session("RCM169a_AgentEmail") ' ---Session("RCM169a_LocationEmail")
         MyCDONTSMail.To = CompanyEmail '---Session("RCM169a_LocationEmail")
         MyCDONTSMail.Cc = Session("RCM169a_AgentEmail")
       ' MyCDONTSMail.to = "rita@rentalcarmanager.com"     
      
      MyCDONTSMail.Subject=Subject1
         MyCDONTSMail.BodyFormat=0
         MyCDONTSMail.MailFormat=0
         MyCDONTSMail.Body=HTML
         MyCDONTSMail.Importance = 2
     
    'Response.Write(Session("RCM169a_LocationEmail"))
         HTML = HTML & "<html>"
         HTML = HTML & "<head>"
         HTML = HTML & "<META http-equiv=Content-Type content='text/html; charset=windows-1252'>"
         HTML = HTML & "<STYLE>"
         HTML = HTML & ".text{  font-size: 11px; line-height: 15px; font-size: 11px;  font-family: Verdana,Arial;}   "
         HTML = HTML & ".white{  font-size: 11px;  font-weight: bold;color: #FFFFFF;  font-family: Verdana,Geneva;}    "
         HTML = HTML & ".greytext{  font-size: 11px;  color:#666666;  font-family: Verdana,Geneva;}    "
         HTML = HTML & ".Yellow{  font-weight: normal;  font-size: 11px;  color: #FDFEBC;  font-family: Verdana,Geneva;}    "
         HTML = HTML & "A.linkBlue{  font-size: 11px;  color: blue;  font-weight: 900; font-family: Verdana,Geneva;  text-decoration: none;}  "
         HTML = HTML & ".HighlightRow {background-color:#EEF1F4;} "
         HTML = HTML & ".TitleRow  {background-color:#376293;}"
         HTML = HTML & ".OpeningTD {     "
         HTML = HTML & "border:solid windowtext 1.0pt;   "
         HTML = HTML & "border-color:"&Session("RCM169a_CompanyColour")&"; }  "
         HTML = HTML & "BODY   {      "
         HTML = HTML & "background-color:#FFFFFF;  "
         HTML = HTML & "scrollbar-3dlight-color:#000000; "
         HTML = HTML & "scrollbar-arrow-color:#4D6185;   "
         HTML = HTML & "scrollbar-base-color:#BDD1FB;"
         HTML = HTML & "scrollbar-darkshadow-color:#000000; "
         HTML = HTML & "scrollbar-face-color:#B4BDC5;   "
         HTML = HTML & "scrollbar-highlight-color:#ffffff;"
         HTML = HTML & "scrollbar-track-color:#BDD1FB; "
         HTML = HTML & "scrollbar-shadow-color:#BDD1FB;}"

   HTML = HTML & "</STYLE>"
      HTML = HTML & "<META content='MSHTML 6.00.2900.2722' name=GENERATOR></HEAD>"
         HTML = HTML & "<title>"&Subject1&" </title>"  
      HTML = HTML & "</head>"
      HTML = HTML & "<body bgcolor=FFFFFF>"     
      
        HTML = HTML & "<center><IMG  src='"&logo&"' ></center>"
   
         HTML = HTML & "<table style='border-collapse:collapse;  border:solid windowtext 1.0pt; border-color:"&Session("RCM169a_CompanyColour")&"; ' cellspacing=0 cellpadding=2 width=600 align=center bgcolor=#ffffff >"
         HTML = HTML & "<tr height=25 style='border:solid windowtext 1.0px;  border-color:"&Session("RCM169a_CompanyColour")&"'>"
         HTML = HTML & "<td style='border:solid windowtext 1.0px;  border-color:"&Session("RCM169a_CompanyColour")&"' bgcolor="&Session("RCM169a_CompanyColour")&" colspan=2  class=Yellow>"

   HTML = HTML & Subject1
   HTML = HTML & "</td></tr>"
       
         HTML = HTML & "<tr><td colspan=2 class=text>Thank you for your Online booking Request with "&Company&".</td></tr>"






       
         HTML = HTML & "<tr><td colspan=2 class=text>Your   booking details are as follows:</td></tr>"
        
        HTML = HTML & "<TR class=HighlightRow bgcolor=#EEF1F4><TD class=OpeningTD colspan=2><FONT class=TEXT>Booking Date: "
         HTML = HTML & Day(now)&"/"&Left(MonthName(Month(Now)),3)&"/"&Year(now)
        HTML = HTML & "</FONT></TD></tr>"
            
        HTML = HTML & "<tr><td class=text width=120>Agent:<td class=text>"
        HTML = HTML & Session("RCM169a_Agency")
        HTML = HTML & "</TD></tr>"
        HTML = HTML & "<tr><td  class=text>Branch:&nbsp;&nbsp;<td class=text>"
         HTML = HTML & Session("RCM169a_Branch")
        HTML = HTML & "</TD></tr>"
        HTML = HTML & "<tr><td class=text>Name:<td class=text>"
        HTML = HTML & Session("RCM169a_AgencyName")
        HTML = HTML & "</TD></tr>"
        HTML = HTML & "<tr><td class=text>Agent Email:<td class=text>"
        HTML = HTML & Session("RCM169a_AgentEmail")
        HTML = HTML & "</TD></tr>"
        
      
        HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor="&Session("RCM169a_CompanyColour")&"></td></tr>"
       
                 '-------get booking information
         HTML = HTML & "<TR ><TD class=GREYTEXT width=120>Renter's Name: <td class=text align=left >"&Session("RCM169a_FirstName")&"&nbsp;"&Session("RCM169a_LastName")&"</TD>"

         HTML = HTML & "<TR ><TD class=GREYTEXT >Email: <td class=text align=left>"&Session("RCM169a_CustomerEmail")&"</TD></tr>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Phone: <td class=text align=left>"&Session("RCM169a_phone")&"</TD></tr>"
         HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor="&Session("RCM169a_CompanyColour")&"></td></tr>"
         HTML = HTML & "<tr><td colspan=2 >"
            HTML = HTML & "<table width=100% ><tr><td><table>"
            HTML = HTML & "<TR ><TD class=GREYTEXT width=120>Vehicle Type<td class=text align=left>"&Session("RCM169a_CarType")&"</TD></tr>"
            HTML = HTML & "<TR ><TD class=GREYTEXT >Pickup Location: <td class=text align=left>"&Session("RCM169a_PickupLocation")&"</TD></tr>"
            HTML = HTML & "<TR ><TD class=GREYTEXT >Pickup Date Time: <td class=text align=left>"
            HTML = HTML & Day(Session("RCM169a_RequestPickDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestPickDate"))),3)&"/"&Year(Session("RCM169a_RequestPickDate"))
            HTML = HTML & "&nbsp;"
            HTML = HTML & Session("RCM169a_RequestPickTime")
            HTML = HTML & "</td></tr>"
            if Session("RCM169a_Flight")<>"" then
            HTML = HTML & "<TR ><TD class=GREYTEXT >Flight In: <td class=text align=left>"&Session("RCM169a_Flight")&"</TD></tr>"
            end if
            HTML = HTML & "<TR ><TD class=GREYTEXT >Dropoff Location: <td class=text align=left>"&Session("RCM169a_DropoffLocation")&"</TD></tr>"
            HTML = HTML & "<TR ><TD class=GREYTEXT >Dropoff Date Time: <td class=text align=left>"
            HTML = HTML & Day(Session("RCM169a_RequestDropDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestDropDate"))),3)&"/"&Year(Session("RCM169a_RequestDropDate"))
             HTML = HTML & "&nbsp;"
            HTML = HTML & Session("RCM169a_RequestDropTime")
            HTML = HTML & "</td></tr>"
            if Session("RCM169a_Flightout")<>"" then
            HTML = HTML & "<TR ><TD class=GREYTEXT >Flight Out: <td class=text align=left>"&Session("RCM169a_Flightout")&"</TD></tr>"
            end if
            if Session("RCM169a_NoTravelling")<>"" then
          HTML = HTML & "<TR ><TD class=GREYTEXT >No Travelling: <td class=text align=left>"&Session("RCM169a_NoTravelling")&"</TD></tr>"
            end if
            HTML = HTML & "<TR ><TD class=GREYTEXT >No Days: <td class=text align=left>"&Session("RCM169a_TotalRentalDays")&"</TD></tr>"
            HTML = HTML & "</table></td><td align=center><IMG  src='"&theimage&"' ></td></tr></table>"
         HTML = HTML & "</td></tr>"
         
         
                '----the seasonal rates
                HTML = HTML & "<TR class=HighlightRow><TD class=OpeningTD colspan=2><Span class=text>Rental Rate and Fees</td></tr>"
             Set s_rate=webConn.Execute("SELECT * from QPaymentDetailBuffer WHERE (ReservationNo)='"&Session("RCM169a_UnallocatedRANo")&"' ")
          CarTotalCost=0
            cost=0
            TotalRentalDays=0
            DO WHILE NOT s_rate.EOF
                     if s_rate("Season")="Default" then
                        Season="Standard Rates"
                     else
                     Season=s_rate("Season")
                  end if
                     cost=s_rate("Days")*s_rate("Rate")
                     CarTotalCost=CartotalCost + s_rate("Days")*s_rate("Rate")
                     'TotalRentalDays=TotalRentalDays+s_rate("Days")
               HTML = HTML & "<tr><td class=greytext>"
               HTML = HTML & Season
                           HTML = HTML & "&nbsp;&nbsp;"
               HTML = HTML & s_rate("Days")
                     HTML = HTML & "&nbsp;days @&nbsp;"
               HTML = HTML &  FormatCurrency(s_rate("Rate"),2)
                  HTML = HTML & "&nbsp;(per day)"
                         HTML = HTML & "&nbsp;</td><td align=right class=text>&nbsp;"
                  HTML = HTML & FormatCurrency(cost,2)
                     HTML = HTML & "</td></tr>"
            s_rate.MoveNext
         Loop
         s_rate.close
                set s_rate=nothing
                
                  if  Session("RCM169a_KmsDesc")<>"" then
                        HTML = HTML & "<tr><td colspan=2 class=greytext>"&Session("RCM169a_KmsDesc")&" </td></tr>"
                        
                 end if
                
                '--- extra fees
         Set s_extra=webConn.Execute("SELECT * from QPaymentExtraFeesBuffer WHERE (ReservationNo)='"&Session("RCM169a_UnallocatedRANo")&"' ")
         EachExtraFees=0
         TotalExtraFees=0
         DO WHILE NOT s_extra.EOF
                  EachExtraFees=s_extra("ExtraValue")
               ExtraFeesQTY=s_extra("QTY")
               theQTY=""
                  if ExtraFeesQTY>1 then
                  theQTY="(QTY "&ExtraFeesQTY&")"
                  end if
                       if s_extra("Type")="Percentage" then
                            HTML = HTML & "<tr><td class=greytext>"&s_extra("Name")&",   "&theQTY&":</td><td  align=right class=text>"&FormatCurrency(EachExtraFees,2)&"</td></tr>"
               elseif s_extra("Type")="Daily" then
                  extraType =s_extra("Type")
                        if s_extra("SetMaxPrice")  =True then
                        extraType="Fixed"
                  end if
                     HTML = HTML & "<tr><td class=greytext>"&s_extra("Name")&",  "&extraType&" at "&FormatCurrency(s_extra("Fees"),2)&" "&theQTY&":</td><td  align=right class=text>"&FormatCurrency(EachExtraFees,2)&"</td></tr>"
                     elseif s_extra("Type")="Fixed" then
                        HTML = HTML & "<tr><td class=greytext>"&s_extra("Name")&",  "&s_extra("Type")&" at "&FormatCurrency(s_extra("Fees"),2)&" "&theQTY&":</td><td  align=right class=text>"&FormatCurrency(EachExtraFees,2)&"</td></tr>"
                     end if
                     
                  TotalExtraFees=TotalExtraFees+EachExtraFees
               
                
         s_extra.MoveNext
                 Loop
            s_extra.close

             if  Session("RCM169a_KmsDesc")<>"" then
                  '  HTML = HTML & "<tr><td colspan=2 class=greytext>"&Session("RCM169a_KmsDesc")&" </td></tr>"
                  HTML = HTML & "<tr><td class=greytext>"&Session("RCM169a_KmsDesc")&" </td><td class=text>"
                  if Session("RCM169a_KmsCost")<>0 then
                        HTML = HTML & FormatCurrency(Session("RCM169a_KmsCost"),2)
                  end if
                  HTML = HTML & "</td></tr>"
            end if
            if Session("RCM169a_AreaofUsed")<>"" then
                      HTML = HTML & "<tr><td class=greytext>Area of Use:<td class=text>"&Session("RCM169a_AreaofUsed")&" </td></tr>"
            end if

         

               if  Session("RCM169a_StampDuty") >0 then
                  HTML = HTML & "<tr><td class=greytext>"
                  HTML = HTML & Session("RCM169a_TaxName2")
                  HTML = HTML & "</td><td  align=right class=text>"
                  HTML = HTML & FormatCurrency(Session("RCM169a_StampDuty"),2)
                  HTML = HTML & "</td></tr>"
             end if
              if Session("RCM169a_GSTInclusive") = "Yes"  then

                 HTML = HTML & "<tr><td class=greytext><b>Estimate of Charges:</b></td><td  align=right class=text>"
                 HTML = HTML & FormatCurrency(Session("RCM169a_TotalEstimateofCharges"),2)
                 HTML = HTML & "</td></tr>"
                 HTML = HTML & "<tr><td class=greytext colspan=2 align=right>(All Prices "&Session("RCM169a_TaxName1")&" Inclusive)</td></tr>"
              else
                  HTML = HTML & "<tr><td class=greytext>"&Session("RCM169a_TaxName1")&"<td class=greytext  align=right>"&FormatCurrency(Session("RCM169a_GST"),2)&"</td></tr>"
                 HTML = HTML & "<tr><td class=greytext><b>Estimate of Charges:</b></td><td  align=right class=text>AU"
                 HTML = HTML & FormatCurrency(Session("RCM169a_TotalEstimateofCharges"),2)
                 HTML = HTML & "</td></tr>"


              end if
                 HTML = HTML & "<tr><td class=greytext>Agent Commission:</td><td align=right class=text> "
                 HTML = HTML & FormatCurrency(Session("RCM169a_AgentCommissionValue"),2)
                 HTML = HTML & "</td></tr>"
                 BalanceDue= Session("RCM169a_TotalEstimateofCharges")-Session("RCM169a_AmountCollected")
                  ' BalanceDue= TotalCahrges-Session("RCM169a_AmountCollected")
                 HTML = HTML & "<tr><td class=greytext>Amount collected:</td><td  align=right class=text> "
                 HTML = HTML & FormatCurrency(Session("RCM169a_AmountCollected"),2)
                 HTML = HTML & "</td></tr>"
                 HTML = HTML & "<tr><td class=greytext><b>Balance Due:</td><td  align=right class=text><b> "
                 HTML = HTML & FormatCurrency(BalanceDue,2)
                 HTML = HTML & "</td></tr>"
               

              
              HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor="&Session("RCM169a_CompanyColour")&"></td></tr>"

         '---if pickuplocation confirmation text exist, use it,
               EmailText="EmailConfirmation"&Session("RCM169a_PickupLocationID")
            Set FileObject=Server.CreateObject("Scripting.FileSystemObject")
                'Response.Write(FilePath)
           If (FileObject.FileExists(FilePath & "\"&EmailText&".txt" )=true) Then
                   FileName=FilePath & "\"&EmailText&".txt"
            else
                   FileName=FilePath+"\EmailConfirmation.txt"
          end if
                Set MFile=FileObject.OpenTextFile(FileName, 1)
                HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor="&Session("RCM169a_CompanyColour")&"></td></tr>"
            HTML = HTML & "<tr><td class=greytext colspan=2>"
                  HTML = HTML & MFile.ReadAll
            HTML = HTML & "</td></tr>"
                  MFile.Close
                  Set MFile=nothing







         'HTML = HTML & "<tr><td class=greytext colspan=2>"
        'HTML = HTML & "If you have any queries regarding the status of this booking request please don't hesitate to contact us at&nbsp;"   
        'HTML = HTML & Session("RCM169a_LocationEmail")
   'HTML = HTML & "<p>Once again thank you for your "&onlineType&" with "&Company&"."   
         'HTML = HTML & "</td></tr>"
          HTML = HTML & "<tr><td class=text colspan=2><br><p><B>"&Company&"</td></tr>"

         HTML = HTML & "<tr><td style='border:solid windowtext 1.0px;  border-color:"&Session("RCM169a_CompanyColour")&"' bgcolor="&Session("RCM169a_CompanyColour")&" align=center colspan=2  class=Yellow>"
         HTML = HTML & BranchAddress
         HTML = HTML & "<br>"
         HTML = HTML & BranchCity
         HTML = HTML & ",&nbsp;"
         HTML = HTML & BranchPostCode
         HTML = HTML & "<br>Phone:"
         HTML = HTML & BranchPhone
         HTML = HTML & "&nbsp;&nbsp;&nbsp;Fax: "
         HTML = HTML & BranchFax
         HTML = HTML & FreePhone
         HTML = HTML & "</td></tr></table><center>"
         HTML = HTML & WebSite
         HTML = HTML & "</body>"
       HTML = HTML & "</html>"
          
        MyCDONTSMail.Body=HTML    
         MyCDONTSMail.Send
         set MyCDONTSMail=nothing    
  END IF             
  
%>
<!-- HTML page start here-----------> 

         
<!------------------RCM Code  start here-----------------------------------> 
     
<center><IMG  src=<%=logo%> ></center>
<p>
              <table bgcolor=#FFFFFF  cellspacing=0 cellpadding=2 border=0>
              <tr>
                  <td bgcolor=<%=Session("RCM169a_CompanyColour")%>  colspan=4 class=white>Agent Booking Request Completed </td>
                </tr>  

               <tr><td></td><td class=greytext align=left colspan=3><li>Thank you for your booking request. We will be in contact very shortly to confirm the Booking Details.  
         

         <tr><td></td><td align=left class=greytext colspan=3><li>You may print out this Booking Request by clicking on the "Print Booking Request" button at the bottom of this page.</td> </tr>
      <tr><td></td><td align=left class=greytext colspan=3><li>When you are finished click on the 'Close Window' button to return to the Web Site</td> </tr>
       <tr><td bgcolor=<%=Session("RCM169a_CompanyColour")%>  align=left  colspan=4 class=white>Customer Details</td> </tr>
                    <tr><td></td><td align=left  class=text><b>Booking Request No:</td><td align=left class=text><b><%=Session("RCM169a_UnallocatedRANo")%></td><td class=text align=right></td></tr>
          
                  <tr><td></td><td align=left class=text>Rental's Name:</td><td align=left class=text colspan=2><%=Session("RCM169a_FirstName")%>&nbsp;<%=Session("RCM169a_LastName")%></td></tr>
                   <tr><td></td><td align=left class=text>Address:</td><td class=text align=left  colspan=2><%=Session("RCM169a_address")%>&nbsp;<%=Session("RCM169a_city")%></td></tr>
                   
                   <tr><td></td><td align=left class=text></td><td class=text align=left colspan=2><%=Session("RCM169a_state")%>&nbsp;<%=Session("RCM169a_postcode")%>&nbsp;<%=Session("RCM169a_Country")%></td></tr>
                    <tr><td></td><td align=left class=text>Email Address:</td><td class=text align=left colspan=2><%=Session("RCM169a_CustomerEmail")%></td></tr>
                    <tr><td></td><td align=left class=text>Phone:</td><td class=text align=left colspan=2><%=Session("RCM169a_phone")%></td></tr>
                    <% if Session("RCM169a_fax")<>"" then
                    Response.Write("<tr><td></td><td align=left class=text>Fax:</td><td align=left class=text colspan=2>"&Session("RCM169a_fax")&"</td></tr>")
                    end if %>
                    <tr><td colspan=4 height=1 bgcolor=<%=Session("RCM169a_CompanyColour")%> ></td></tr>
              
                
                     <tr><td bgcolor=<%=Session("RCM169a_CompanyColour")%>  align=left colspan=4 class=white>Booking Details </td> </tr>
               
                <%      
                       Response.Write("<tr><td></td><td align=left class=text>Pickup Location:</td><td class=text align=left colspan=2> ")
                        Response.Write(Session("RCM169a_PickupLocation"))
                        Response.Write("</td></tr>")
                       
                        Response.Write("<tr><td></td><td align=left class=text>Pickup Date Time: </td><td class=text align=left colspan=2>"&WeekdayName(WeekDay(Session("RCM169a_RequestPickDate")))&", ")
                        'Response.Write(Session("RCM169a_RequestPickDateTime"))
                        Response.Write(Day(Session("RCM169a_RequestPickDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestPickDate"))),3)&"/"&Year(Session("RCM169a_RequestPickDate")))
                        Response.Write("&nbsp;")
                        Response.Write(Session("RCM169a_RequestPickTime"))
                        Response.Write("</td></tr>")
                        
                        if Session("RCM169a_Flight")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Arrival FLT: </td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM169a_Flight"))
                        Response.Write("</td></tr>")
                        end if
                        
                        Response.Write("<tr><td></td><td align=left class=text>Return Location: </td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM169a_DropoffLocation"))
                        Response.Write("</td></tr>") 
                       
                      
                        Response.Write("<tr><td></td><td align=left class=text>Return Date Time: </td><td align=left class=text colspan=2>"&WeekdayName(WeekDay(Session("RCM169a_RequestDropDate")))&", ")
                         'Response.Write(Session("RCM169a_RequestDropDateTime"))
                        Response.Write(Day(Session("RCM169a_RequestDropDate"))&"/"&Left(MonthName(Month(Session("RCM169a_RequestDropDate"))),3)&"/"&Year(Session("RCM169a_RequestDropDate")))
                        Response.Write("&nbsp;")
                        Response.Write(Session("RCM169a_RequestDropTime"))
                       
                        Response.Write("</td></tr>")
                      
                       if Session("RCM169a_Flightout")<>"" then
                        Response.Write("<tr><td></td><td align=left class=text>Departure FLT:</td><td align=left class=text colspan=2>")
                        Response.Write(Session("RCM169a_Flightout"))
                        Response.Write("</td></tr>")
                       end if 
                       
                        if Session("RCM169a_NoTravelling")<>"" then
                        Response.Write("<tr><td></td><td class=text>No Travelling:</td><td class=text align=left colspan=2>")
                        Response.Write(Session("RCM169a_NoTravelling"))
                        Response.Write("</td></tr>")
                       end if 
                        Response.Write("<tr><td></td><td align=left class=text>Vehicle Type: </td><td align=left class=text>"&Session("RCM169a_CarType")&"</td><td class=text align=right></td></tr>")
                   Response.Write("<tr><td bgcolor="&Session("RCM169a_CompanyColour")&"  align=left colspan=4 class=white>Rates and Payment</td> </tr>")
                  
                      Set s_rate=webConn.Execute("SELECT * from QPaymentDetailBuffer WHERE (ReservationNo)='"&Session("RCM169a_UnallocatedRANo")&"' ")
            CarTotalCost=0
                     cost=0 
               TotalRentalDays=0
                     DO WHILE NOT s_rate.EOF
                     if s_rate("Season")="Default" then
                        Season="Standard Rates" 
                     else
                     Season=s_rate("Season")
                  end if  
                     cost=s_rate("Days")*s_rate("Rate")  
                     CarTotalCost=CartotalCost + s_rate("Days")*s_rate("Rate")
                     'TotalRentalDays=TotalRentalDays+s_rate("Days") 
                           Response.Write("<tr><td></td><td align=left class=text>"&Season&"</td><td class=text align=left >"&s_rate("Days")&" Days @"&FormatCurrency(s_rate("Rate"),2)&"</td><td class=text align=right>"&FormatCurrency(cost,2)&"</td></tr>")
         
            
                  
            s_rate.MoveNext
         Loop 
         s_rate.close   
                set s_rate=nothing
                  
                   AgencyCommintion=CarTotalCost   
                   
             if  Session("RCM169a_KmsDesc")<>"" then
                        Response.Write("<tr><td colspan=2 class=text>"&Session("RCM169a_KmsDesc")&" </td></tr>")
                        
                 end if
                   
                   
                       '-- Extra Fees 
                       Set s_extra=webConn.Execute("SELECT PaymentExtraFeesBuffer.*, Name, Type FROM PaymentExtraFeesBuffer, ExtraFees WHERE  (ReservationNo)='"&Session("RCM169a_UnallocatedRANo")&"' and ExtraFeesID = ExtraFees.ID ORDER BY TYPE, NAME ")
                       EachExtraFees=0
                       TotalExtraFees=0
                   While Not s_extra.EOF
                        EachExtraFees=s_extra("ExtraValue") 
                        if s_extra("Type")="Percentage" then
                              Response.Write("<tr><td></td><td align=left class=text>"&s_extra("Name")&"</td><td class=text></td><td class=text align=right>"&FormatCurrency(EachExtraFees,2)&"</td></tr>")
                        else
                           Response.Write("<tr><td></td><td align=left class=text>"&s_extra("Name")&"</td><td align=left class=text>"&FormatCurrency(s_extra("Fees"),2)&" ("&s_extra("Type")&")</td><td class=text align=right>"&FormatCurrency(EachExtraFees,2)&"</td></tr>")
                         end if 
                         
                         TotalExtraFees=TotalExtraFees+EachExtraFees 
                   s_extra.MoveNext 
             Wend
             s_extra.Close
                   Set s_extra=nothing   
            if  Session("RCM169a_StampDuty") >0 then
               Response.Write("<tr><td></td><td class=text align=left  colspan=2>Stamp Duty & Administration Fee</td><td class=text align=right>"&FormatCurrency(Session("RCM169a_StampDuty"),2)&"</td></tr>")
            end if
               if Session("RCM169a_GSTInclusive") = "Yes"  then
                           Response.Write("<tr height=1><td></td><td class=text></td><td class=text></td><td class=text align=right bgcolor=#999999></td></tr>")
                           Response.Write("<tr><td></td><td class=text align=left colspan=2><b>Total Estimate of Charges</td><td class=text align=right><b>"&FormatCurrency(Session("RCM169a_TotalEstimateofCharges"),2)&"</td></tr>")
                           Response.Write("<tr><td class=text colspan=2></td><td class=text colspan=2 align=right>(incl "&Session("RCM169a_TaxName1")&" of "&FormatCurrency(Session("RCM169a_GST"),2)&")</td></tr>")
               else
                         Response.Write("<tr><td class=text colspan=3>"&Session("RCM169a_TaxName1")&"</td><td class=text  align=right>"&FormatCurrency(Session("RCM169a_GST"),2)&"</td></tr>")
                         Response.Write("<tr height=1><td></td><td class=text></td><td class=text></td><td class=text align=right bgcolor=#999999></td></tr>")
                         Response.Write("<tr><td></td><td class=text align=left colspan=2><b>Total Estimate of Charges</td><td class=text align=right><b>"&FormatCurrency(Session("RCM169a_TotalEstimateofCharges"),2)&"</td></tr>")

               end if
                  

       BalanceDue= Session("RCM169a_TotalEstimateofCharges")-Session("RCM169a_AmountCollected")
      %>
      <tr><td></td><td align=left class=text colspan=2>Agent Commission</td><td class=text align=right><%=FormatCurrency(Session("RCM169a_AgentCommissionValue"),2)%></td></tr>
      <tr><td></td><td align=left class=text colspan=2>Amount collected</td><td class=text align=right><%=FormatCurrency(Session("RCM169a_AmountCollected"),2)%></td></tr>
      <tr><td></td><td align=left class=text colspan=2><B>Balance Due</td><td class=text align=right><b><%=FormatCurrency(BalanceDue,2)%></td></tr>
       <TR height=2><td colspan=4 bgColor=<%=Session("RCM169a_CompanyColour")%>  ></td></tr>
      <TR><td colspan=4 align=right>
      <table><tr><td>
         <form method=post action="webAgentBooking6.asp?reservationNo=<%=Session("RCM169a_UnallocatedRANo")%>"   >
         <input Type=submit name=add class="button" value="Print Booking Request"></form></td></form>
         <td><form method=post action="webAgentBooking1.asp?dir=newbooking" > <input class="button" type=submit value="Make another booking" >
        <form method=post action="webAgentBooking5.asp" ><input class="button" type=submit value="Close Window" onClick="window.close()">
         </form> </td></tr></table>
     </td></tr>
                                
  </table>
 </td></tr></table> <br>

<%  webConn.CLOSE
   set webConn=nothing  %>  
<!-- END RCM HTML CODE-----------> 
         
