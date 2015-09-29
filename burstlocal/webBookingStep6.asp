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
<!--  distributed under license restricting its use, copying, distribution   -->
<!--  and decompilation. No part of this product or related documentation may  -->
<!--  reproduced in any form by any means without prior written consent of -->
<!--  GMH Systems LTD  -->
<!--  For more information contact sales@rentalcarmanager.com -->



<%
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


<link href="ausbook.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
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

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<body bgcolor=#FFFFFF leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('images/homed.gif','graphics/homed.gif')">
<!-- Banner starts here -->
<table width="748" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="left" valign="top"><img src="graphics/auswide-car-banner.jpg" alt="Australia Wide Car Rentals" name="cars" width="748" height="164" border="0" id="cars" /></td>
          </tr>
</table>
<!-- Banner ends here -->
<!-- Order steps start here -->
<table class="egg" width="748" border="0" align="center" cellpadding="10" cellspacing="0">
        <tr align="left" valign="top" class="pink">
          <td height="80" align="center" valign="middle"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="graphics/rentals-dates.gif" alt="Select Pick-up  Location and Hire Dates" width="80" height="53"></td>
              <td><img src="graphics/rentals-vehicle.gif" alt="Select Vehicle" width="80" height="53"></td>
              <td><img src="graphics/rentals-estimate.gif" alt="Review Car Rental Estimate" width="80" height="53"></td>
              <td><img src="graphics/rentals-purchase.gif" alt="Car Rental Purchase Details" width="80" height="53"></td>
              <td><img src="graphics/rentals-confirm.gif" alt="Car Rental Booking Confirmation" width="80" height="53" border="0"></td>
            </tr>
          </table></td>
          <td align="center" valign="middle"><a href="http://www.australiawidecarrentals.com.au"><img src="graphics/home.gif" alt="Home Page" width="191" height="38" border="0" id="home" onmouseover="MM_swapImage('home','','graphics/homed.gif',1)" onmouseout="MM_swapImgRestore()" /></a><a href="index.html"></a><a href="index.html" target="_top" onclick="MM_nbGroup('down','group1','home','',1)" onmouseover="MM_nbGroup('over','home','images/homed.gif','',1)" onmouseout="MM_nbGroup('out')"></a><a href="http://www.australiawidecarrentals.com.au"></a></td>
        </tr>
</table>
<!-- Order steps end here -->
<!-- RCM HTML CODE-----------> 

<table class="egg" width="748" align="center"><tr><td>
<%    
      Company="Australia Wide Car Rental" 
       CompanyCode="Australiawide71"
        RCMURL="https://secure20.rentalcarmanager.com.au"
        theimage=RCMURL&"/DB/"&CompanyCode&"/"&Session("RCM71_CarImageName")
          ServerID=20
        RCMCompanyID=71

           Company="Australia Wide Car Rental"
       CompanyCode="Australiawide71"


      
if Session("RCM71_OnlineBookingNo")="" then
        Response.Redirect "webBookingStep1.asp"
        ' Response.Write("<TABLE  width=500  align=center bgcolor=#001B6C  cellSpacing=0 cellPadding=1  border=0><tr><td>")
       ' Response.Write("<TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>")
       ' Response.Write("<tr height=20><td  align=center class=header bgColor=#001B6C >Thank you for your Request</td></tr>")
       ' Response.Write("<tr><td bgcolor=#FFFFFF>")
 
    
elseif Session("RCM71_OnlineBookingNo")<>"" then 
      

   Dim webConn
   Set webConn = Server.CreateObject("ADODB.Connection")
   DatabaseFile="Australiawide71"
   webConn.Open "Provider=SQLOLEDB;Data Source = 4461nvirt; Initial Catalog = "&DatabaseFile&";Integrated Security=SSPI;"

    
        if Request.QueryString("dir")="quote" then
         CardNumber=""
         CardDate="03/12"
         ccName=""
         ccType=""  
         Quotation=1
                  ReservationTypeID=3  '--for quotation  
                  onlineType="Online Quotation" 
                  Subject1="Online Quotation with "&Company&" - "&Session("RCM71_PickupLocation") 
               
        else
         CardNumber=request.form("ccNumber1")&" "&request.form("ccNumber2")&" "&request.form("ccNumber3")&" "&request.form("ccNumber4")
            CardDate=request.form("ccDate1")&"/"&request.form("ccDate2") 
            ccName=(Request.form("ccName"))
            ccType=Request.form("ccType") 
            Quotation=0
                  ReservationTypeID=1  '--for online booking      
                  onlineType="Online Booking Request" 
                  Subject1="Online Booking Request with "&Company&" - "&Session("RCM71_PickupLocation")
               
        end if 

       SQL="INSERT INTO customers (acPostalAddress,acCity,acState,acPostcode,acCountryID,acFax,DoNotRentID,acDOB,acLicenseExpiry,acLicense,acFirstName, acLastName, acEmail, acPhone,acMobile, CC_Type,CC_Number,CC_Name,CC_Date)"
       SQL=SQL&"VALUES ('"&Left(tidyup(Session("RCM71_address")),80)&"','"&Left(tidyup(Session("RCM71_city")),50)&"','"&Left(tidyup(Session("RCM71_state")),30)&"','"&Left(tidyup(Session("RCM71_postcode")),10)&"','"&Session("RCM71_CountryID")&"','"&Left(tidyup(Session("RCM71_fax")),15)&"',0,'"&Session("RCM71_DOB")&"','"&Session("RCM71_LicExpDate")&"','"&Left(Tidyup(Session("RCM71_License")),30)&"','"&Left(Tidyup(Session("RCM71_FirstName")),30)&"','"&Left(Tidyup(Session("RCM71_LastName")),30)&"','"&Left(Tidyup(Session("RCM71_CustomerEmail")),50)&"','"&Left(Tidyup(Session("RCM71_phone")),20)&"','"&Left(Tidyup(Session("RCM71_Mobile")),25)&"','"&Left(Tidyup(ccType),40)&"','"&CardNumber&"','"&Left(Tidyup(ccName),50)&"','"&CardDate&"')"
       ' Response.Write(SQL)
      webConn.Execute(SQL)

   '---get customerID
      Set s_cus=webConn.Execute("SELECT Max(acID)  as customID FROM Customers ")
      CustomerID=s_cus("customID")
      s_cus.close

  '---check if FreeSales------------------- 
      Set s_f=webConn.Execute("SELECT FreeSale FROM CarSize WHERE (ID)='"&Session("RCM71_CarSizeID")&"' ")
      FreeSale=1
        if s_f("FreeSale")<>True then
       FreeSale=0
       end if
       s_f.close
       SET  s_f=NOTHING
   
      '-------------if KmsFree has a default setting insert it to reservation -----------------
       ' SQL="SELECT * from KmsFree  where DefaultKM = 1 "
     '   Set s_km=webConn.Execute(SQL)   
       ' AddKmsFee=0
       ' KmsFree=0
       ' if NOT s_km.EOF then 
            '' AddKmsFee=s_km("AddKmsFee")
            ' KmsFree=s_km("KmsFree")
        'end if 
       ' s_km.close
       ' set s_km=nothing
      
   '---Insert the booking details to ReservationBuffer table 
      
      '---need save 'ResOnline' as source for commission report---
      RentalSource="Online Booking"
      if Session("RCM71_URL")="RES" then
         RentalSource="ResOnline"
      end if
    
      SQL="INSERT INTO ReservationBuffer (BrandID,Quotation,AddKmsFee,KmsFree,FreeSale,Flightout,Flight,StampDuty,GST,PickupDateTime,DropoffDateTime,CustomerID,RentalSource,CarSizeID,PickupTime,Pickupdate,DropoffTime,DropoffDate,PickupLocationID,DropoffLocationID,Notes,ReservationTypeID)"
   SQL=SQL&"VALUES (4,"&Quotation&","&Session("RCM71_AddKmsFee")&","&Session("RCM71_KmsFree")&","&FreeSale&",'"&Left(tidyup(Session("RCM71_Flightout")),50)&"','"&Left(tidyup(Session("RCM71_Flight")),50)&"','"&Session("RCM71_StampDuty")&"','"&Session("RCM71_GST")&"','"&Session("RCM71_RequestPickDateTime")&"','"&Session("RCM71_RequestDropDateTime")&"' ,"&(CustomerID)&",'"&RentalSource&"',"&(Session("RCM71_CarSizeID"))&",'"&Session("RCM71_RequestPickTime")&"','"&Session("RCM71_RequestPickDate")&"','"&Session("RCM71_RequestDropTime")&"', '"&Session("RCM71_RequestDropDate")&"', "&Session("RCM71_PickupLocationID")&", "&Session("RCM71_DropoffLocationID")&", '"&Left(tidyup(Session("RCM71_Notes")),250)&"', 1)"
       'Response.Write(SQL) 
   webConn.Execute(SQL)  
  
   '---get the ReservationNo
      Set s_No=webConn.Execute("SELECT Max(ReservationNo)  as ResNo FROM ReservationBuffer ")     
      OnlineBookingNo=s_No("ResNo") 
      s_No.close
        
        '--insert Unallocaited RA# to WebReservaiton table,    
        
         SQL="UPDATE WebReservation SET " 
      SQL=SQL&" StampDuty ="&Session("RCM71_StampDuty")&",  "          
        SQL=SQL&" GST ="&Session("RCM71_GST")&",  "          
   SQL=SQL&" BookingType ="&ReservationTypeID&",  "          
         SQL=SQL&" ReservationTypeID ="&ReservationTypeID&",  "          
         SQL=SQL&" UnallocatedRA ='"&OnlineBookingNo&"'  "          
   'SQL=SQL&" customerID ='"&OnlineBookingNo&"'  "          
   SQL=SQL&"WHERE (ReservationNo) ='"&Session("RCM71_OnlineBookingNo")&"'"
   webConn.Execute(SQL)   
                          
   
      Set s_km=webConn.Execute("SELECT * FROM WebReservationFees WHERE (rf_ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' ")
       if Not s_km.EOF   then
              
               SQL="INSERT INTO ReservationFeesBuff (rf_ReservationNo,rf_MaxKmscharge,rf_DailyRate)" 
             SQL=SQL&"VALUES ("&OnlineBookingNo&","&s_km("rf_MaxKmscharge")&","&s_km("rf_DailyRate")&")"
                'Response.Write(SQL)                                 
            webConn.Execute(SQL) 
      end if
   s_km.Close
   Set s_km=nothing 
   
   
  '--get each season record from the WebPaymentDetail and insert to paymentdetailes table 
   webConn.Execute("DELETE  FROM PaymentDetailBuffer WHERE (ReservationNo)='"&OnlineBookingNo&"' ")
   Set s_rate=webConn.Execute("SELECT * FROM WebPaymentDetail WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' ")
        RentalCost=0
   While Not s_rate.EOF
               RentalCost=s_rate("Days")* s_rate("Rate") + RentalCost 
         SQL="INSERT INTO PaymentDetailBuffer (TripRates,DiscountType,DiscountName,DiscountPerc,StandardRate,Rate,ReservationNo,SeasonID,Days,RateName)" 
                  SQL=SQL&"VALUES (0,'"&Session("RCM71_DiscountType")&"','"&tidyup(Session("RCM71_DiscountName"))&"',"&Session("RCM71_DiscountRate")&","&s_rate("StandardRate")&","&s_rate("Rate")&",'"&OnlineBookingNo&"',"&s_rate("SeasonID")&","&s_rate("Days")&",'"&s_rate("RateName")&"')"
                  webConn.Execute(SQL)
          s_rate.MoveNext 
   Wend
   s_rate.Close
   Set l_s=nothing 
        TotalCahrges=RentalCost
        AgencyCommintionValue=RentalCost
     '-Insert Extra Fees (Mandatory and Selected)  to PaymentExtraFeesBuffer table 
   webConn.Execute("DELETE  FROM PaymentExtraFeesBuffer WHERE (ReservationNo)='"&OnlineBookingNo&"' ")
       'Set s_rate=webConn.Execute("SELECT * FROM WebPaymentExtraFees WHERE (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' ")
   Set s_rate=webConn.Execute("SELECT WebPaymentExtraFees.*, Name, Type,PayAgency FROM WebPaymentExtraFees, ExtraFees WHERE  (ReservationNo)='"&Session("RCM71_OnlineBookingNo")&"' and ExtraFeesID = ExtraFees.ID ORDER BY TYPE, NAME ")
      While Not s_rate.EOF
         
      TotalCahrges=TotalCahrges+ s_rate("ExtraValue")
         if s_rate("PayAgency")=True then
                     AgencyCommintionValue=AgencyCommintionValue+ s_rate("ExtraValue")
               end if
                SetMaxPrice=0
               if    s_rate("SetMaxPrice")=True then
                       SetMaxPrice=1
               end if
               SQL="INSERT INTO PaymentExtraFeesBuffer(ExtraValue,SetMaxPrice,QTY,ReservationNo,ExtraFeesID,Fees,Days)"
            SQL=SQL&"VALUES ("&s_rate("ExtraValue")&","&SetMaxPrice&","&s_rate("QTY")&",'"&OnlineBookingNo&"',"&s_rate("ExtraFeesID")&","&s_rate("Fees")&","&s_rate("Days")&")"
            webConn.Execute(SQL) 
                'Response.Write("<br>") 
            'Response.Write(SQL) 
   s_rate.MoveNext 
   Wend
   s_rate.Close
   Set s_rate=nothing       
 
         
     
        
          
        
        TotalCahrges=TotalCahrges+Session("RCM71_StampDuty")
          ' Response.Write(Session("RCM71_URL"))  
          '  Response.Write(Request.QueryString("dir"))


          '-----use company info  
        Set s_com=webConn.Execute("SELECT * from Company WHERE ID=4  ")
        logo=s_com("BrandLogo")
        Company=s_com("Company")  
        CompanyEmail=s_com("Email") 
        Session("RCM71_LocationEmail") =s_com("Email")
       
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
    
   
         if Request.QueryString("dir")="quote" then
            Subject1="Online Quotation with "&Company&" -  Ref #Q-"&Session("RCM71_DocPrFix")&""&OnlineBookingNo&" ("&Session("RCM71_PickupLocation")&")"
               
        else
         Subject1="Online Booking Request with "&Company&" - Ref #U-"&Session("RCM71_DocPrFix")&""&OnlineBookingNo&" ("&Session("RCM71_PickupLocation")&")"
               
        end if 
          
      Dim  HTML
      Dim MyCDONTSMail
         '--to customer
       Set MyCDONTSMail = CreateObject("CDONTS.NewMail") 
       MyCDONTSMail.From = Session("RCM71_LocationEmail") 
       MyCDONTSMail.To = Session("RCM71_CustomerEmail") 
        MyCDONTSMail.Cc = Company&"<"&Session("RCM71_LocationEmail")&">"  
         
      MyCDONTSMail.Subject=Subject1
         MyCDONTSMail.BodyFormat=0
         MyCDONTSMail.MailFormat=0
         MyCDONTSMail.Body=HTML
   
        
      HTML = HTML & "<html>"
        HTML = HTML & "<head>"
      HTML = HTML & "<META http-equiv=Content-Type content='text/html; charset=windows-1252'>" 
         HTML = HTML & "<STYLE>"
   HTML = HTML & ".text{  font-size: 11px; line-height: 15px; font-size: 11px;  font-family: Verdana,Arial;}   "
   HTML = HTML & ".white{  font-size: 11px;  font-weight: bold;color: #FFFFFF;  font-family: Verdana,Geneva;}    "
   HTML = HTML & ".greytext{  font-size: 11px;  color:#666666;  font-family: Verdana,Geneva;}    "
   HTML = HTML & ".Yellow{  font-weight: normal;  font-size: 11px;  color: #FDFEBC;  font-family: Verdana,Geneva;}    "
   HTML = HTML & "A.linkBlue{  font-size: 11px;  color: blue;  font-weight: 900; font-family: Verdana,Geneva;  text-decoration: none;}  "
   HTML = HTML & ".linkBlue{  font-size: 11px;  color: blue;  font-weight: 900; font-family: Verdana,Geneva;  text-decoration: none;}   "
   HTML = HTML & ".HighlightRow {background-color:#EEF1F4;} "
   HTML = HTML & ".TitleRow  {background-color:#376293;}"
   HTML = HTML & ".OpeningTD {     "
   HTML = HTML & "border:solid windowtext 1.0pt;   "
   HTML = HTML & "border-color:#898AC3; }  "
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
      
        'HTML = HTML & "<center><IMG  src='http://"&RCMURL&"/db/"&CompanyCode&"/"&logo&"'  ></center>"
                                     
        HTML = HTML & "<table style='border-collapse:collapse;  border:solid windowtext 1.0pt; border-color:#898AC3; mso-border-alt:solid windowtext 1.0pt;' cellspacing=0 cellpadding=2 width=600 align=center bgcolor=#ffffff border=0>"
   HTML = HTML & "<tr style='border:solid windowtext 1.0px;  border-color:#898AC3'>"
   HTML = HTML & "<td style='border:solid windowtext 1.0px;  border-color:#898AC3' bgcolor=#0080C0 colspan=2  class=Yellow>"
        
   HTML = HTML & Subject1
   HTML = HTML & "</td></tr>"
       
        HTML = HTML & "<tr><td colspan=2 class=text>"

      HTML = HTML & "Thank you for your "&onlineType&" with "&Company&"." 
        if Request.QueryString("dir")="quote" then
               HTML = HTML & "<tr><td colspan=2 class=text>This "&onlineType&" has now been forwarded to the Location - "  
                  HTML = HTML & Session("RCM71_PickupLocation")
                  HTML = HTML & ".<tr><td colspan=2 class=text>&nbsp;</td></tr>"  
          
                   HTML = HTML & "<tr><td colspan=2 class=text>If you would like to proceed with this quotation :</td></tr>"
  
                  IF Request.QueryString("dir")="quote" then
            '-------Quotation Confirmation online Payment-----------------------
                 
                     '---1. need pass CompanyID and ServerID ( not compayCode/DbName) 
                     '---2. need pass Quotation No
                     '---3.  need pass s_d("DateEntered")
                      '-------------Quotations to be confirmed and paid online  -------------------------------
                         SQL="SELECT QReservationforBuffer.* from QReservationforBuffer where ReservationNo="&OnlineBookingNo&" "
                        'Response.Write(SQL) 
                     Set s_d=webConn.Execute(SQL)  
                     DateEntered=Day(s_d("DateEntered"))&"/"&Left(MonthName(Month(s_d("DateEntered"))),3)&"/"&Year(s_d("DateEntered"))
                     QuotationNo = s_d("ReservationNo")
                         HTML = HTML & "<TR ><TD  colspan=2> "
                        HTML = HTML & "<table><tr><td class=text><b>TURN YOUR QUOTE INTO A BOOKING REQUEST "
                      HTML = HTML & " <b><a href='"&rcmURL&"/s_QPay.asp?id="&RCMCompanyID&"&MC2="&ServerID&"&ferq="&s_d("ReservationNo")&"&E604="&DateEntered&"' >"
                      HTML = HTML & " <font color='#FF0000'>CLICK HERE</font></a> </b></td><td><img src='"&rcmURL&"/images/SafePayment.jpg'  border='0' /></td></tr>"
                      HTML = HTML & "</table>"
                      HTML = HTML & "</TD></tr>"
           
        END IF 
                  HTML = HTML & "<tr><td colspan=2 class=text>Your Quotation details are as follows:</td></tr>"   
         HTML = HTML & "<TR class=HighlightRow bgcolor=#EEF1F4><TD class=OpeningTD colspan=2><FONT class=TEXT>Quotation Date: "
     
       else
            HTML = HTML & "<tr><td colspan=2 class=text>Your "&onlineType&" has now been forwarded to the Location - "  
            HTML = HTML & Session("RCM71_PickupLocation") 
            HTML = HTML & ".<tr><td colspan=2 class=text>You will receive a email confirmation from the renting location shortly."   
            HTML = HTML & "<tr><td colspan=2 class=text>Your booking details are as follows:</td></tr>"   
         HTML = HTML & "<TR class=HighlightRow bgcolor=#EEF1F4><TD class=OpeningTD colspan=2><FONT class=TEXT>Booking Date: "
        end if
        
        
      HTML = HTML & Day(now)&"/"&Left(MonthName(Month(Now)),3)&"/"&Year(now)  
        HTML = HTML & "</FONT></TD></tr>"
        HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor=#898AC3></td></tr>" 

  
 
    
              '-------get booking information
         HTML = HTML & "<TR ><TD class=GREYTEXT width=120>Name: <td class=text align=left width=520>"&Session("RCM71_FirstName")&"&nbsp;"&Session("RCM71_LastName")&"</TD>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >DOB: <td class=text align=left>"
         HTML = HTML & Day(Session("RCM71_DOB"))&"/"&Left(MonthName(Month(Session("RCM71_DOB"))),3)&"/"&Year(Session("RCM71_DOB"))
          HTML = HTML & "</td></tr>"     
         HTML = HTML & "<TR ><TD class=GREYTEXT >License No: <td class=text align=left>"&Session("RCM71_License")&"</TD>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Email: <td class=text align=left>"&Session("RCM71_CustomerEmail")&"</TD>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Mobile Phone No.:<td class=text align=left>"&Session("RCM71_Mobile")&"</TD>"
         HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor=#898AC3></td></tr>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Vehicle Type<td class=text align=left>"&Session("RCM71_CarType")&"</TD>" 
         
         HTML = HTML & "<TR ><TD><td class=text align=left><IMG  src='"&theimage&"' ></TD></Tr>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Pickup Location: <td class=text align=left>"&Session("RCM71_PickupLocation")&"</TD>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Pickup Date Time: <td class=text align=left>"
         HTML = HTML & Day(Session("RCM71_RequestPickDate"))&"/"&Left(MonthName(Month(Session("RCM71_RequestPickDate"))),3)&"/"&Year(Session("RCM71_RequestPickDate")) 
          HTML = HTML & "&nbsp;"
          HTML = HTML & Session("RCM71_RequestPickTime")
          HTML = HTML & "</td></tr>"
          HTML = HTML & "<TR ><TD class=GREYTEXT >Flight In: <td class=text align=left>"&Session("RCM71_Flight")&"</TD>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Dropoff Location: <td class=text align=left>"&Session("RCM71_DropoffLocation")&"</TD>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >Dropoff Date Time: <td class=text align=left>"
         HTML = HTML & Day(Session("RCM71_RequestDropDate"))&"/"&Left(MonthName(Month(Session("RCM71_RequestDropDate"))),3)&"/"&Year(Session("RCM71_RequestDropDate")) 
          HTML = HTML & "&nbsp;"
          HTML = HTML & Session("RCM71_RequestDropTime")
          HTML = HTML & "</td></tr>"
          HTML = HTML & "<TR ><TD class=GREYTEXT >Flight Out: <td class=text align=left>"&Session("RCM71_Flightout")&"</TD>"
         HTML = HTML & "<TR ><TD class=GREYTEXT >No Days: <td class=text align=left>"&Session("RCM71_TotalRentalDays")&"</TD>"
         'HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor=#898AC3></td></tr>" 
         HTML = HTML & "<TR class=HighlightRow><TD class=OpeningTD colspan=2><Span class=text>Rental Rate and Fees</td></tr>"
               
                      
         '----the seasonal rates
         HTML = HTML & "<tr><td colspan=2 >" 
         '---rate and fee table---
         HTML = HTML & "<table>" 
         
             Set s_rate=webConn.Execute("SELECT * from QPaymentDetailBuffer WHERE (ReservationNo)='"&OnlineBookingNo&"' ")
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
                

           if  Session("RCM71_KmsDesc")<>"" then
                   HTML = HTML & "<tr><td class='GREYTEXT'>"&Session("RCM71_KmsDesc")&" </td><td class='text'>"&Session("RCM71_CompanyCurrency")&""
                  if Session("RCM71_KmsCost")<>0 then
                        HTML = HTML & FormatNumber(Session("RCM71_KmsCost"),2)
                  end if
                  HTML = HTML & "</td></tr>"
            end if
                '--- extra fees
         Set s_extra=webConn.Execute("SELECT * from QPaymentExtraFeesBuffer WHERE (ReservationNo)='"&OnlineBookingNo&"' ORDER BY TYPE, NAME ")
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
                        'Response.Write("<br>"&s_extra("Name")&"--- "&extraType&" at "&FormatCurrency(s_extra("Fees"),2)&" "&theQTY&":</td><td>"&FormatCurrency(EachExtraFees,2)&"</br>")
                  
                
         s_extra.MoveNext
                 Loop 
            s_extra.close     
                set s_extra=nothing
             TotalCahrges=0
              TotalCahrges=CarTotalCost+TotalExtraFees + Session("RCM71_StampDuty")
                   
             if  Session("RCM71_StampDuty") >0 then
                 HTML = HTML & "<tr><td class=greytext>"  
                  HTML = HTML & Session("RCM71_TaxName2")
                 HTML = HTML & "</td><td  align=right class=text>"  
                  HTML = HTML & FormatCurrency(Session("RCM71_StampDuty"),2)
               HTML = HTML & "</td></tr>"
             end if 
             
             
                 HTML = HTML & "<tr><td class=greytext>GST"  
                  HTML = HTML & "</td><td  align=right class=text>"  
                  HTML = HTML & FormatCurrency(Session("RCM71_GST"),2)
               HTML = HTML & "</td></tr>"
               
                 HTML = HTML & "<tr><td class=greytext><b>Total Estimate of Charges:</b></td><td  align=right class=text>"  
                ' HTML = HTML & FormatCurrency(TotalCahrges,2)
                HTML = HTML & FormatCurrency(Session("RCM71_TotalEstimateofCharges"),2)
                 HTML = HTML & "</td></tr></table>"
               '  HTML = HTML & "<tr><td class=greytext colspan=2 align=right>(All Prices GST Inclusive)"
               '  HTML = HTML & "</td></tr></table>"
               
          
         HTML = HTML & "</td></tr>" 
                 
      if Session("RCM71_Notes")<>"" then
          HTML = HTML & "<tr><td HEIGHT=10 colspan=2 >&nbsp;</td></tr>" 
       HTML = HTML & "<tr><td class=greytext colspan=2>Comments/Requests:</td></tr>"
         HTML = HTML & "<tr><td class=greytext colspan=2>"&Session("RCM71_Notes")&"</td></tr>"
       end if   
       
      
       
        HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor=#898AC3></td></tr>" 
       
         HTML = HTML & "<tr><td class=greytext colspan=2>"
      HTML = HTML & "If you have any queries regarding the status of your "&onlineType&"  please don't hesitate to contact us at&nbsp;"   
   HTML = HTML & Session("RCM71_LocationEmail") 
   HTML = HTML & "<p>Once again thank you for your "&onlineType&" with "&Company&"."   
       ' HTML = HTML & "<BR><BR><A HREF='http://www.'><b>CLICK HERE</b></A> to return to the Home Page."   
   HTML = HTML & "</td></tr>"
         HTML = HTML & "<tr><td class=text colspan=2><br><p><B>"&Company&"</td></tr>"
         HTML = HTML & "<tr><td class=text colspan=2>"&Session("RCM71_Pickuplocation")&"</td></tr>"
    
         HTML = HTML & "<tr><td style='border:solid windowtext 1.0px;  border-color:#898AC3' bgcolor=#0080C0 align=center colspan=2  class=Yellow>"
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
          
          
         MyCDONTSMail.Body=HTML    
       MyCDONTSMail.Send
         set MyCDONTSMail=nothing  
        
        '---print out on the screen
        Response.Write("<TABLE  width=500  align=center bgcolor=#00509F  cellSpacing=0 cellPadding=1  border=0><tr><td>")
      Response.Write("<TABLE width=100% align=center bgcolor=#FFFFFF   cellSpacing=0 cellPadding=2  border=0>")
      Response.Write("<tr height=20><td  align=center class=header bgColor=#00509F >Thank you for your "&onlineType&"</td></tr>")
      Response.Write("<tr><td bgcolor=#FFFFFF>")
 
      Response.Write("<p><TABLE align=center   cellspacing=0 bgcolor=#99CCFF><tr></td>")
      Response.Write("<TABLE align=center cellSpacing=0 cellPadding=5>")
   
   
        
      if FreeSale  = 1 then
         Response.Write("<TR><td height=10></td></tr>") 
         if Request.QueryString("dir")="quote" then 
                  Response.Write("<TR><td class=text>Your "&onlineType&"  has now been forwarded to "&Company&"</td></tr>")
                  Response.Write("<TR><td  class=text>A copy of this quotation has also been emailed to you.</td></tr>")
                  Response.Write("<TR><td height=10></td></tr>") 
                  'Response.Write("<TR><td class=text align=center >If you would like to proceed with this quotation please email us at <a href='mailto:"&Session("RCM71_LocationEmail")&"'  class=red><FONT COLOR=#FF0000>"&Session("RCM71_LocationEmail")&".</FONT></a></h1></td></tr>")
                  Response.Write("<TR><td class=text >If you would like to proceed with this quotation:</td></tr>")
                  Response.Write("<TR><td class=text ><b>Please go to your emailed quote and click on:</b></td></tr>")

                  Response.Write("<tr><td class=text><b>TURN YOUR QUOTE INTO A BOOKING REQUEST</b>")
                  Response.Write("<b><FONT COLOR=#FF0000>&nbsp;CLICK HERE&nbsp;</FONT></b><IMG SRC='"&rcmURL&"/images/SafePayment.jpg'  BORDER=0></td></tr>")
                  Response.Write("<TR><td  class=text>Once again thank you for your "&onlineType&" with "&Company&"..</td></tr> ")

                else
                  Response.Write("<TR><td class=text>Your "&onlineType&"  has now been forwarded to "&Company&"</td></tr>")
                  Response.Write("<TR><td class=text>You will be contacted shortly with pick-up details and confirmation.</td></tr>")
                  Response.Write("<TR><td  class=text>An "&onlineType&" confirmation has been emailed to you.</td></tr>")
                  Response.Write("<TR><td  class=text>If you have any queries regarding the status of your "&onlineType&" please don't hesitate to contact "&Company&"  at <a href='mailto:"&Session("RCM71_LocationEmail")&"'  class=red><FONT COLOR=#FF0000>"&Session("RCM71_LocationEmail")&"</FONT></a></td></tr>  ")
                  Response.Write("<TR><td  class=text>Once again thank you for your "&onlineType&" with "&Company&"..</td></tr> ")
           end if
      else
            Response.Write("<TR><td class=text></h1></td></tr>")
      Response.Write("<TR><td class=title align=center></h1></td></tr>")
           if Request.QueryString("dir")="quote" then   
                     Response.Write("<TR><td class=text>Your "&onlineType&"  has now been forwarded to "&Company&"</td></tr>")
                  Response.Write("<TR><td  class=text>A copy of this quotation has also been emailed to you.</td></tr>")
                  Response.Write("<TR><td height=10></td></tr>") 
                 ' Response.Write("<TR><td class=text align=center >If you would like to proceed with this quotation please email us at <a href='mailto:"&Session("RCM71_LocationEmail")&"'  class=red><FONT COLOR=#FF0000>"&Session("RCM71_LocationEmail")&".</FONT></a></h1></td></tr>")
                  Response.Write("<TR><td class=text >If you would like to proceed with this quotation:</td></tr>")
                  Response.Write("<TR><td class=text ><b>Please go to your emailed quote and click on:</b></td></tr>")

                  Response.Write("<tr><td class=text><b>TURN YOUR QUOTE INTO A BOOKING REQUEST</b>")
                  Response.Write("<b><FONT COLOR=#FF0000>&nbsp;CLICK HERE&nbsp;</FONT></b><IMG SRC='"&rcmURL&"/images/SafePayment.jpg'  BORDER=0></td></tr>")
                    Response.Write("<TR><td  class=text>Once again thank you for your "&onlineType&" with "&Company&"..</td></tr> ")
       
              else
                     Response.Write("<TR><td class=textORANGEbold >Thank you for your "&onlineType&"</td></tr>")
                     Response.Write("<TR><td class=textORANGEbold >Your booking request has been forwarded to "&Company&" </td></tr>")
                     Response.Write("<TR><td height=10></td></tr>") 
                  Response.Write("<TR><td class=textORANGEbold  >As this car type is heavily booked during this period you will be contacted within 24 hours to confirm availability.</h1></td></tr>")
               'Response.Write("<TR><td class=textORANGEbold  >Please note: No charge will be made against your credit card until your reservation is confirmed.</h1></td></tr>")
                     Response.Write("<TR><td height=10></td></tr>") 
                     Response.Write("<TR><td  class=textORANGEbold >If you have any queries regarding the status of your "&onlineType&" please don't hesitate to contact "&Company&"  at <a href='mailto:"&Session("RCM71_LocationEmail")&"'  class=red><FONT COLOR=#FF0000>"&CompanyEmail&"</FONT></a></td></tr>  ")
                  Response.Write("<TR><td  class=text></td></tr>")
                  Response.Write("<TR><td  class=textORANGEbold >Once again thank you for booking with "&Company&".</td></tr> ")

      end if
       end if
    Response.Write("<TR><td  class=greytext align=center>")
    Response.Write("<form method=post action=webbookingStep5.asp  >")
       
       
    Response.Write("<input TYPE=button NAME=Back  VALUE='Close Window' onClick='window.close()'></form></td></tr> ")
    Response.Write("<TR><td height=40>&nbsp;</td></tr></table>")  
    
    Session("RCM71_OnlineBookingNo")=""
  
   Session.Abandon  
    webConn.CLOSE 
    
end if         
%>
</td></tr></table> </td></tr></table>
  </td>
     </tr>
      <tr> <td height="160"></td></tr>
      </table>
    </td>
  </tr>
</table></td></tr></table> 
<!-- END RCM HTML CODE-----------> 
<!-- Footer starts here -->
<table class="egg" width="748" border="0" align="center" cellpadding="10" cellspacing="0">
        <tr align="left" valign="top">
          <td height="80" align="center" valign="middle">&copy; Australia Wide Car Rentals  |  
 <a href="http://www.australiawidecarrentals.com.au/perth.html">Perth</a> | <a href="http://www.australiawidecarrentals.com.au/melbourne.html">Melbourne</a> | <a href="http://www.australiawidecarrentals.com.au/brisbane.html">Brisbane</a> | <a href="http://www.australiawidecarrentals.com.au/sydney.html">Sydney</a> | <a href="http://www.australiawidecarrentals.com.au/canberra.html">Canberra</a> |  <a href="http://www.australiawidecarrentals.com.au/adelaide.html">Adelaide</a>  |  <a href="http://www.australiawidecarrentals.com.au/hobart.html">Hobart</a><br />
 <br />
 For Customer Service please phone the appropriate number below<br />
 <strong>Melbourne</strong> 1800 331 220 | <strong>Canberra</strong> 1800 331 001 | <strong>Sydney</strong> 1800 331 002 <br />
 <strong>Brisbane</strong> 1800 443 400 |<strong> Adelaide</strong> 1800 331 033 | <strong>Hobart</strong> 6231 2888 | <strong>Perth</strong> 08 9472 5025 </td>
        </tr>
</table>
<!-- Footer ends here -->
</body></html>

 
