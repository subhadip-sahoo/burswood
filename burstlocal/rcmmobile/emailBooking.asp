<%
'https://secure.rentalcarmanager.co.nz/ssl/NZRentaDentRot26/emailBooking.asp

ignorehack = True
allowanything = False

function GetPath()
	query_string = request.ServerVariables("QUERY_STRING")
	if query_string <> "" then
		query_string = "?" & query_string
	end if

  port = "http" 
  https = lcase(request.ServerVariables("HTTPS")) 
  if https <> "off" then prot = "https" 

  'http://dev.rentalcarmanager.com.au/ssl/demorcm/mobile/
	GetPath = port & "://" & request.ServerVariables("SERVER_NAME") 
  '&  "/ssl/" & CompanyCode & "/mobile/"
end function

'RCMURL="https://secure.rentalcarmanager.co.nz"
RCMURL = GetPath()

BookingNo = request.QueryString("BookQuoteRefNo")
'**************************************
'------------ need to check with the live DB and make changes accordingly ------------

RCMCompanyID = 71
ServerID = 20
CompanyCode="Australiawide71"
DatabaseFile="Australiawide71"

logo="Mobilelogo.png"
FilePath=Server.MapPath("/DB")&"\"&CompanyCode
CompanyColour = "#f28a0f"
Dim Conn
Set Conn = Server.CreateObject("ADODB.Connection")

conn.Open "Provider=SQLOLEDB;Data Source = 4461NVIRT; Initial Catalog = "&DatabaseFile&";Trusted_Connection=yes;"'Secure#20

'-------------END connect RCM Customer DB  --------------------------------
'**************************************
%>
<!--#include file="a_server-checks.asp"-->
<html>
<head>
  <title>Online Payment</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  <meta name="apple-touch-fullscreen" content="yes" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<style type="text/css">
  .text
  {
    font-family: Arial, Helvetica, Times New Roman;
    font-size: 8pt;
    color: #666666;
  }
  .white
  {
    font-family: Arial, Helvetica, Sans-serif;
    font-weight: bold;
    font-size: 10pt;
    color: #FFFFFF;
    text-decoration: none;
  }
  
  .rcmbutton
  {
    font-family: Arial;
    font-size: 10pt;
    border-radius: 3px;
    height: 24px;
    color: #FFFFFF;
    background: #29A9BF;
    border: 1pt solid #0099CC;
    cursor: hand;
    cursor: pointer;
  }
  .Button
  {
    vertical-align:middle;
    text-align:center;
    text-decoration:none;
    font-family:Arial Narrow;
    font-size:15px;
    letter-spacing:normal;
    color: #fff;
    width: 120px;
    height: 30px;
    border: none;
    background:#004123;/*Change*/
    -webkit-border-radius: 5px;
    -webkit-appearance: none;
    float:none;
    background-repeat: no-repeat;  /* make the background image appear only once */
    background-position: right;
    border: none;           /* assuming we don't want any borders */
    cursor: pointer;        /* make the cursor like hovering over an <a> element */
    padding-left:10px;     /* make text start to the right of the image */
    padding-right:10px;     /* make text start to the right of the image */
    padding-bottom:5px;     /* make text start to the right of the image */
    vertical-align: middle; /* align the text vertically centered */
  }

</style>
<body leftmargin="0" rightmargin="0" topmargin="0" link="#5D5D5D" vlink="#5D5D5D" alink="#Ffffff" bgproperties="fixed">
  <table align="center" cellspacing="0" cellpadding="0" border="0" class="text">
    <tr>
      <td align="center">
        <%   
         Set s_st=Conn.Execute("SELECT * FROM SystemTable WHERE Code='GSINC'  ")
         GSTInclusive = "Yes"
         If not s_st.EOF then
            GSTInclusive = s_st("syValue")
         END IF
         s_st.CLOSE
         SET s_st=NOTHING


         SQL="SELECT QReservationforBuffer.*, "
          SQL=SQL&" RentalDays = dbo.BookingRentalDaysBuffer(ReservationNo), "
          SQL=SQL&" averageRate=dbo.BookingDailyRatesBuffer(ReservationNo), "
          SQL=SQL&" CarTotalRates=Round(dbo.BookingRentalDaysBuffer(ReservationNo) * (dbo.BookingDailyRatesBuffer(ReservationNo)),2), "
         SQL=SQL&" CASE WHEN dbo.CategoryPerNightRate(CarSizeID)=0 THEN 'day' ELSE 'night' END as sRateTypeDesc, "
         SQL=SQL&" BookingValue=dbo.BookingValueBuffer(ReservationNo, '"&GSTInclusive&"')  "
         SQL=SQL&"   from QReservationforBuffer where ReservationNo="&BookingNo&"  "
'Response.Write SQL
Set s_d=Conn.Execute(SQL)
If not s_d.EOF then
           Set s_sy=Conn.Execute("SELECT * FROM SystemTable WHERE Code='CURCY'  ")
         CurrencySample="$"
         If not s_sy.EOF then
               CurrencySample= s_sy("syValue")
         END IF
        s_sy.CLOSE
         SET s_sy=NOTHING

         Function DisplayCurrency(n)
           DisplayCurrency = CurrencySample&""&FormatNumber(n,2)
         End Function
         DocByBrand ="No"
         if s_d("BrandID")=0 then
                Set s_com=Conn.Execute("SELECT * from Company WHERE Defaulted=1  ")

         else
                   Set s_com=Conn.Execute("SELECT * from Company WHERE ID=19")''' For dev-server & Demo Server
                   '********* for others Server ********
                   'Set s_com=Conn.Execute("SELECT * from Company WHERE ID="&s_d("BrandID")&" ")
                     '------get the email comfirmation text file name --------------------------------------
                  Set s_b = Conn.Execute("SELECT syValue FROM SystemTable WHERE Code='BRDOC' ")

                  if  Not s_b.EOF then
                     DocByBrand =s_b("syValue")
                  end if
                  s_b.close
                  set s_b=nothing

         end if
         'Response.Write s_com.source
         'Response.Write s_com("CompanyColour")
         'Response.Write "<hr>BrandID = " & s_d("BrandID")
         'Response.Write "<hr>CompanyColour = " & s_com("CompanyColour")
         'Response.End

          'CompanyColour= "#0080C0"
          'if s_com("CompanyColour")<>"" then
          'CompanyColour=  s_com("CompanyColour")
          'end if
          'if s_com("WebColour")<>"" then
          'CompanyColour=s_com("WebColour")
          'end if

         CompanyCurrency=s_com("CompanyCurrency")
         CompanyEmail= s_com("Email")
         CompanyCcEmail= s_com("ccEmail")
           Company=s_com("Company")
                            
           '--check use location or company address---
            Set RG=Conn.Execute("SELECT * FROM SystemTable WHERE Code='DOCS'  ")
            DOCSAddress="Yes"   '---Location Address
            If not RG.EOF then
               DOCSAddress= RG("syValue")
            END IF
            RG.CLOSE
            SET RG=NOTHING


       if s_d("Quotation")=True then
            if DocByBrand ="No" then
                     '---if pickuplocation quotation text exist, use it,
                     '--location Email Letter name = "EmailConfirmatLett + locationID"
                     EmailLett="QuotationLett"&s_d("PickupLocationID")
                     quotFile="Quotation"&s_d("PickupLocationID")
             else
                     EmailLett="QuotationLettBrand"&s_d("BrandID")
                     quotFile="QuotationBrand"&s_d("BrandID")
             end if
              Set FileObject=Server.CreateObject("Scripting.FileSystemObject")
              If (FileObject.FileExists(FilePath & "\"&quotFile&".txt" )=true) Then
                   FileName=FilePath & "\"&quotFile&".txt"
               else
                   FileName=FilePath+"\Quotation.txt"
               end if

       else
            if DocByBrand ="No" then
                     '---if pickuplocation quotation text exist, use it,
                     '--location Email Letter name = "EmailConfirmatLett + locationID"
                     EmailLett="EmailConfirmatLett"&s_d("PickupLocationID")
                     EmailText="EmailConfirmation"&s_d("PickupLocationID")
             else
                     EmailLett="EmailConfirmatLettBrand"&s_d("BrandID")
                     EmailText="EmailConfirmationBrand"&s_d("BrandID")
             end if
              Set FileObject=Server.CreateObject("Scripting.FileSystemObject")
                'Response.Write  EmailText
               'Response.Write(FilePath)
               If (FileObject.FileExists(FilePath & "\"&EmailText&".txt" )=true) Then
                   FileName=FilePath & "\"&EmailText&".txt"
               else
                   FileName=FilePath+"\EmailConfirmation.txt"
               end if
      end if

'Response.Write FileName







            if DOCSAddress="No" then '--use company address
                  BranchEmail = CompanyEmail
                   LocationBranch = ""  '---do not dispaly location ---s_d("PickupCity")
                   BranchAddress = s_com("Address")
                   BranchCity = s_com("Suburb")&"&nbsp;"&s_com("City")
                  BranchPostCode = s_com("State")&"&nbsp;"&s_com("PostCode")&"&nbsp;"&s_com("Country")
                     
                   BranchPhone = s_com("Phone")
                   BranchFax = s_com("Fax")
               
         else   '---use locaiton Address
               '--use pickup branch email address to send confirmation
                  Set s_add=Conn.Execute("SELECT  QLocationState.* FROM QLocationState WHERE ID="&s_d("PickuplocationID")&"  ")
                        if NOT s_add.EOF  then
                        if s_add("LocationCurrency")<>"" then
                         CompanyCurrency=s_add("LocationCurrency")
                         end if
                     if s_d("BrandID")=0 and s_add("Email")<>"" then  '--if is Brand then use compay email address to sent email
                        BranchEmail = s_add("Email")
                     end if
                      LocationEmail=s_add("Email")
                       '--25 Jul 2011, new flag LOCEM Use Location email address for all brands (added for NZ RAF)
                         if DOCSAddress="" then
                              Set RG=Conn.Execute("SELECT * FROM SystemTable WHERE Code='LOCEM'  ")
                              If not RG.EOF then
                                    DOCSAddress= RG("syValue")
                              END IF
                              RG.CLOSE
                              SET RG=NOTHING
                        end if
                        if DOCSAddress="Yes" then
                        BranchEmail= s_add("Email")
                        end if

                        LocationBranch = s_add("Location")
                        BranchAddress = s_add("Address")
                        BranchCity = s_add("Suburb")&"&nbsp;"&s_add("City")
                     if s_add("StateCode")<>"N/A" then
                        BranchPostCode = s_add("StateCode")&"&nbsp;"&s_add("PostCode")&"&nbsp;"&s_add("Country")
                        else
                           BranchPostCode = s_add("PostCode")&"&nbsp;"&s_add("Country")
                        end if
                        BranchPhone = s_add("Phone")
                        BranchFax = s_add("Fax")
                  end if
                  
                  if BranchEmail="" then
                        BranchEmail =CompanyEmail
                     end if
                     if BranchAddress="" then
                           BranchAddress=s_com("Address")
                        BranchCity = s_com("Suburb")&"&nbsp;"&s_com("City")
                           BranchPostCode = s_com("State")&"&nbsp;"&s_com("PostCode")&"&nbsp;"&s_com("Country")
                     end if
                     if BranchPhone="" then
                  BranchPhone=s_com("Phone")
                     end if
                     if BranchFax="" then
                     BranchFax=s_com("Fax")
                     end if
                     
                        s_add.close
                     Set s_add=nothing
             end if
              
                  WebSite=""
                  if s_com("WebSite")<>"" then
                     WebSite="<a href=http://"&s_com("WebSite")&">"&s_com("WebSite")&"</a>"
                  end if
                  FreePhone=""
                  if s_com("FreePhone")<>"" then
                     FreePhone="<br>Free Phone: "&s_com("FreePhone")&""
                  end if
                  s_com.close
                  set  s_com=nothing
             
               Set s_car=Conn.Execute("SELECT WebDesc,Size,ImageName,ID   from CarSize  WHERE (ID)="&s_d("CarSizeID")&" ")
                



     
      '------pickup Date Time ----------------
               pickupDate=Day(s_d("Pickupdate"))&"/"&Left(MonthName(Month(s_d("Pickupdate"))),3)&"/"&Year(s_d("Pickupdate"))
                  DropoffDate=Day(s_d("Dropoffdate"))&"/"&Left(MonthName(Month(s_d("Dropoffdate"))),3)&"/"&Year(s_d("Dropoffdate"))
                  '----Display Pickup and Return Time on Quotes and Email Confirmations
                  Set s_sy=Conn.Execute("SELECT * FROM SystemTable WHERE Code='DTIME'  ")
                     DisplayTime="Yes"
               If not s_sy.EOF then     
                     DisplayTime= s_sy("syValue") 
               END IF
               s_sy.CLOSE
               SET s_sy=NOTHING  
               
               if DisplayTime="Yes"   then
                           PickupTime=s_d("PickupTime")
                           DropoffTime=s_d("DropoffTime")
                  else
                     PickupTime="By Appointment only"
                           DropoffTime="By Appointment only"
                  end if      

    '-----Send a confirmation to customer
     
         Set S_name=Conn.Execute("SELECT *  FROM QCustomersList WHERE (acID)="&s_d("customerID")&" ")
         sendtoEmail=S_name("acEmail")


         'Response.Write  BranchEmail
         'sendtoEmail = "support@rentalcarmanager.com"

       ' Response.Write  s_d("Quotation")
            if s_d("Quotation")=True then

                  ReservationTypeID=3  '--for quotation
                  onlineType="Online Quotation"
                  Subject1="Online Quotation with "&Company&" -  Ref #Q-"&s_d("DocPrFix")&""&s_d("ReservationNo")&" ("&s_d("PickupCity")&")"
            else

                  ReservationTypeID=1  '--for quotation
                  onlineType="Online Booking Request"
                  FreeSale  = 0
                  Set s_w=Conn.Execute("select ReservationTypeID from WebReservation where UnallocatedRA="&s_d("ReservationNo")&" ")
                  if Not s_w.EOF   then
                        if s_w("ReservationTypeID")=1 then
                        FreeSale =1
                        onlineType="Online Booking"
                        end if
                        'Response.Write s_w("ReservationTypeID")
                  end if
                  s_w.close
                  set s_w=Nothing

                  if FreeSale  = 0  then '---LIMITED AVAILABILTY
                     Subject1="Online Booking Request with "&Company&" - Ref #U-"&s_d("DocPrFix")&""&s_d("ReservationNo")&" ("&s_d("PickupCity")&")"
                  else
                     Subject1="Online Booking with "&Company&" - Ref #U-"&s_d("DocPrFix")&""&s_d("ReservationNo")&" ("&s_d("PickupCity")&")"
                  end if
            end if




         Dim  HTML
         Dim MyCDONTSMail
         Set MyCDONTSMail = CreateObject("CDONTS.NewMail")
         MyCDONTSMail.From = Company&"<"&BranchEmail&">"
  
         MyCDONTSMail.To = sendtoEmail
         replyEmailto = Company&"<"&BranchEmail&">"


        ' MyCDONTSMail.Cc = Company&"<"&BranchEmail&">"


        MyCDONTSMail.Value("Reply-To") = replyEmailto
        

        
          MyCDONTSMail.Subject=Subject1

         MyCDONTSMail.BodyFormat=0
         MyCDONTSMail.MailFormat=0
         MyCDONTSMail.Body=HTML
         MyCDONTSMail.Importance = 2

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
         HTML = HTML & "border-color:"&CompanyColour&"; }  "
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
         HTML = HTML & "<title>Booking Confirmation</title>"
    
      
         HTML = HTML & "</head>"
         HTML = HTML & "<body bgcolor=FFFFFF>"

         Dim fs
         Set fs=Server.CreateObject("Scripting.FileSystemObject")
         If (fs.FileExists(FilePath&"\"&Logo)=true) Then
                     HTML = HTML & "<center><img  src='"&RCMURL&"/db/"&CompanyCode&"/"&logo&"' /></center>"
                     'HTML = HTML & "<center><img  src='https://secure2.rentalcarmanager.com/db/NZRentaDentRot26/Mobilelogo.png' /></center>"

         End If

         HTML = HTML & "<table style='border-collapse:collapse;  border:solid windowtext 1.0pt; border-color:"&CompanyColour&"; ' cellspacing='0' cellpadding='2' align='center' 'bgcolor=#ffffff' >"
         HTML = HTML & "<tr style='border:solid windowtext 1.0px;  border-color:"&CompanyColour&"'>"
         HTML = HTML & "<td style='border:solid windowtext 1.0px;height:25px;  border-color:"&CompanyColour&"' bgcolor='"&CompanyColour&"' colspan='2'  class='white'><b>"



         
    

          if s_d("Quotation")=True then

                     HTML = HTML & "Online Vehicle Quotation  - "&Company&"</td></tr>"

                     HTML = HTML & "<tr><td colspan='2' class='text'>Thank you for your online quotation with "&Company&".</td></tr>"
                     HTML = HTML & "<tr><td colspan='2' class='text'>This "&onlineType&" has now been forwarded to the Location - "
                     HTML = HTML & s_d("PickupCity")
                     HTML = HTML & ".</td></tr>"

                     HTML = HTML & "<tr><td colspan='2' class='text'>If you would like to proceed with this quotation :</td></tr>"

                     '---1. need pass CompanyID and ServerID ( not compayCode/DbName)
                     '---2. need pass Quotation No
                     '---3.  need pass s_d("DateEntered")
                      '-------------Quotations to be confirmed and paid online  -------------------------------


                     DateEntered=Day(s_d("DateEntered"))&"/"&Left(MonthName(Month(s_d("DateEntered"))),3)&"/"&Year(s_d("DateEntered"))
                     QuotationNo = s_d("ReservationNo")
                     ValidDateTo=""
                     if s_d("DaysQuoteValid")  <>0 and ISNull(s_d("DaysQuoteValid"))<>True then
                              ValidDateTo=Day(Now+s_d("DaysQuoteValid"))&"/"&Left(MonthName(Month(Now+s_d("DaysQuoteValid"))),3)&"/"&Year(Now+s_d("DaysQuoteValid"))
                     end if
                     HTML = HTML & "<tr ><td class=OpeningTD colspan='2'> "
                     HTML = HTML & "<table><tr><td class='text'><b>TURN YOUR QUOTE INTO A BOOKING REQUEST "
                     HTML = HTML & " <b><a href='"&rcmURL&"/s_QPay.asp?id="&RCMCompanyID&"&MC2="&ServerID&"&ferq="&s_d("ReservationNo")&"&E604="&DateEntered&"' >"
                     HTML = HTML & " <font color='#FF0000'>CLICK HERE</font></a> </b></td><td><img src='"&rcmURL&"/images/SafePayment.jpg'  border='0' /></td></tr>"


                     if s_d("DaysQuoteValid")  <>0 then
                              HTML = HTML & "<tr><td class='text'><b>Please note this quote is valid for "&s_d("DaysQuoteValid")&" days. </b></td></tr>"
                     end if
                     HTML = HTML & "<tr><td class='text'  colspan='2'>Note : If you are viewing this message in text mode and having difficulties opening the above link, please try copying and pasting the following entire link into the address bar of your Internet homepage.</td></tr>"
                     HTML = HTML & "<tr><td class='text' colspan='2'>"&rcmURL&"/s_QPay.asp?id="&RCMCompanyID&"&MC2="&ServerID&"&ferq="&s_d("ReservationNo")&"&E604="&DateEntered&"&VD2="&ValidDateTo&"</td></tr>"
                     HTML = HTML & "</table></td></tr>"

                  HTML = HTML & "<tr><td colspan='2' class='text'>Your Quotation details are as follows:</td></tr>"
                  HTML = HTML & "<tr class='HighlightRow' bgcolor='#EEF1F4'><td class=OpeningTD colspan='2'><FONT class='text'>Quotation Date: "
                  HTML = HTML & Day(now)&"/"&Left(MonthName(Month(Now)),3)&"/"&Year(now)
                  HTML = HTML & "</font></td></tr>"
                  HTML = HTML & "<tr><td style='height:1px' colspan='2'  bgcolor="&CompanyColour&"></td></tr>"
                  'HTML = HTML & "<tr ><td class='GREYTEXT' style='width:120px' ><b>Ref:</b></td> <td class='text' align='left' style='width:520px'>#Q-"&s_d("DocPrFix")&""&s_d("ReservationNo")&" ("&s_d("PickupCity")&")</td></tr>"
       else
                    HTML = HTML & onlineType&"  - "&Company&"</td></tr>"

                  HTML = HTML & "<tr><td colspan='2' class='text'>Thank you for your "&onlineType&" with "&Company&"</td></tr>"
                  HTML = HTML & "<tr><td colspan='2' class='text'>Your "&onlineType&" has now been forwarded to the Location - "
                  HTML = HTML & s_d("PickupCity")
                  HTML = HTML & ".<tr><td colspan='2' class='text'>You will receive a email confirmation from the renting location shortly."
                  HTML = HTML & "<tr><td colspan='2' class='text'>Your booking details are as follows:</td></tr>"
                  HTML = HTML & "<tr class=HighlightRow bgcolor=#EEF1F4><td class=OpeningTD colspan='2'><FONT class='text'>Booking Date: "
                  HTML = HTML & Day(now)&"/"&Left(MonthName(Month(Now)),3)&"/"&Year(now)
                  HTML = HTML & "</font></td></tr>"
                  HTML = HTML & "<tr><td style='height:1px' colspan='2'  bgcolor='"&CompanyColour&"'></td></tr>"
                  'HTML = HTML & "<tr ><td class='GREYTEXT'><b> Ref:</b></td><td class='text' align='left'><b>#U-"&s_d("DocPrFix")&""&s_d("ReservationNo")&" ("&s_d("PickupCity")&")</b></td></tr>"

        end if
        HTML = HTML & "<tr><td colspan=2 class=text>"
        HTML = HTML & "Dear&nbsp;"
        HTML = HTML & S_name("acFirstName") 
         if S_name("acFirstName")="" then
            HTML = HTML & "&nbsp;"
            HTML = HTML & S_name("acLastName")
        end if
        HTML = HTML & "</td></tr>"
        
       

        

         HTML = HTML & "<tr><td colspan=2 class=text>"
         HTML = HTML & "<p>Please check the details below."         
         HTML = HTML & "</td></tr>"
        

        
        
         HTML = HTML & "<TR class=HighlightRow bgcolor=#EEF1F4><TD class=OpeningTD colspan=2><span class=TEXT>Personal Information "
         HTML = HTML & "</span></TD></tr>"
         HTML = HTML & "<tr><td class=greytext>Name:</td><td class=text align=left>" 
         HTML = HTML & S_name("acFirstName") 
         HTML = HTML & "&nbsp;" 
         HTML = HTML & S_name("acLastName")   
         HTML = HTML & "</td></tr>" 
     
       
        
         HTML = HTML & "<tr><td class=greytext>Address:</td><td class=text align=left>" 
         HTML = HTML & S_name("acPostalAddress")
         HTML = HTML & "&nbsp;"
         HTML = HTML & S_name("acCity") 
         HTML = HTML & "</td></tr><tr><td class=greytext>"

         HTML = HTML & "</td><td class=text align=left>" 
         HTML = HTML & S_name("acState") 
         HTML = HTML & "&nbsp;"
         HTML = HTML & S_name("acPostcode") 
         HTML = HTML & "&nbsp;"   
       
         HTML = HTML & S_name("Country") 
         HTML = HTML & "</td></tr>" 
         HTML = HTML & "<tr><td class=greytext>Phone:</td><td class=text align=left>" 
         HTML = HTML & S_name("acphone")
         HTML = HTML & "</td></tr>"
         HTML = HTML & "<tr><td class=greytext>Email Address:</td><td class=text align=left>" 
         HTML = HTML & S_name("acEmail")
         HTML = HTML & "</td></tr>"
                   
         HTML = HTML & "<TR bgcolor=#EEF1F4><TD colspan=1><span class=TEXT><b>"
         HTML = HTML & onlineType
          HTML = HTML & " Ref</b></span></td><td><span class=TEXT><b>#U-"
       
         HTML = HTML & s_d("DocPrFix")  
         HTML = HTML & s_d("ReservationNo")
         HTML = HTML & "</b></span></TD></tr>"
       
         HTML = HTML & "<tr><td class=greytext>Booking Date: </td><td class=TEXT>"
         HTML = HTML & Day(s_d("DateEntered"))&"/"&Left(MonthName(Month(s_d("DateEntered"))),3)&"/"&Year(s_d("DateEntered"))
         HTML = HTML & "</TD></tr>"
       
         HTML = HTML & "<tr><td class=greytext><b>Vehicle Category:</td><td class=text align=left><b>"
         if s_car("WebDesc")<> "" then
            HTML = HTML & s_car("WebDesc") 
         else  
            HTML = HTML & s_car("Size") 
        end if 
        HTML = HTML & "</TD></tr>"
       
                        
         HTML = HTML & "<tr><td class=greytext>Pickup Location:</td><td class=text align=left>"  
         HTML = HTML & s_d("PickupCity")
         HTML = HTML & "&nbsp;"          
         HTML = HTML & s_d("CollectionPoint") 
         HTML = HTML & "</td></tr>"    
         
         HTML = HTML & "<tr><td class=greytext>Pickup Date:</td><td class=text align=left>"
         HTML = HTML & WeekdayName(Weekday(s_d("Pickupdate")))
         HTML = HTML & "&nbsp;"
         HTML = HTML & pickupDate
         HTML = HTML & "</td></tr>"
         HTML = HTML & "<tr><td class=greytext  nowrap>Pickup Time:</td><td class=text align=left>"
         HTML = HTML & PickupTime
         HTML = HTML & "</td></tr>"
 
 
        if s_d("Flight")<>"" then
               HTML = HTML & "<tr><td class=greytext>Arrival Flight:</td><td class=text align=left>"
               HTML = HTML & s_d("Flight")
               HTML = HTML & "</td></tr>"
        end if 
        
         HTML = HTML & "<tr><td class=greytext>Dropoff Location:</td><td class=text align=left>"
         HTML = HTML & s_d("DropoffCity")
         HTML = HTML & "&nbsp;"
         HTML = HTML & s_d("ReturnPoint")
         HTML = HTML & "</td></tr>"
             
         HTML = HTML & "<tr><td class=greytext>Dropoff Date:</td><td class=text align=left>"   
         HTML = HTML & WeekdayName(Weekday(s_d("Dropoffdate")))
         HTML = HTML & "&nbsp;"
         HTML = HTML & DropoffDate 
         HTML = HTML & "</td></tr>"
         HTML = HTML & "<tr><td class=greytext  nowrap>Return Time:</td><td class=text align=left>"
         HTML = HTML & DropoffTime 
         HTML = HTML & "</td></tr>"
         
          if s_d("Flightout")<>"" then
               HTML = HTML & "<tr><td class=greytext>Flight Out:</td><td class=text align=left>"
               HTML = HTML & s_d("Flightout")
               HTML = HTML & "</td></tr>"
        end if  
            
       
          '----the rates  
         HTML = HTML & "<TR class=HighlightRow><TD class=OpeningTD colspan=2><Span class=text>Rental Rate and Fees</td></tr>"
         HTML = HTML & "<tr><td colspan=2 >" 
         '---rate and fee table---
         HTML = HTML & "<table>" 
        
         Set s_sy=Conn.Execute("SELECT * FROM SystemTable WHERE Code='AvgRate'  ")
         Session("averageRate")="No"
        If not s_sy.EOF then
               Session("averageRate") = s_sy("syValue")
         END IF
        s_sy.CLOSE
         SET s_sy=NOTHING
          if Session("averageRate")="Yes" then

                  if  s_d("RentalDays")<>0 then

                        HTML = HTML & "<tr><td class=greytext>Rate:"
                        HTML = HTML & "&nbsp;"&s_d("RentalDays")&" "&s_d("sRateTypeDesc")&"s @ "&DisplayCurrency(s_d("averageRate"))&" per "&s_d("sRateTypeDesc")&"</td>"
                        HTML = HTML & "<td align=right class=text>&nbsp;"
                        HTML = HTML & DisplayCurrency(s_d("CarTotalRates"))
                        HTML = HTML & "</td></tr>"
                  end if
          else
            SQL="       SELECT PaymentDetailBuffer.*, Days*Rate as Cost,  "
            SQL=SQL&"   CASE WHEN Season='Default'   THEN 'Standard'  "
            SQL=SQL&"   WHEN Season IS NULL then 'Rate'  "
            SQL=SQL&"   ELSE Season  "
            SQL=SQL&"   END   AS Season     "
            SQL=SQL&"  from PaymentDetailBuffer LEFT OUTER JOIN dbo.Season ON dbo.PaymentDetailBuffer.SeasonID = dbo.Season.ID "
            SQL=SQL&"  WHERE (ReservationNo)="&s_d("ReservationNo")&" and Days>0 "
         Set s_rate=Conn.Execute(SQL)



         DO WHILE NOT s_rate.EOF

                      if s_rate("DiscountPerc")>0 then
                              if s_rate("DiscountType")="p" then
                                    Discount="("&s_rate("DiscountPerc")&"% discount)"
                              else
                                 Discount="("&DisplayCurrency(s_rate("DiscountPerc"))&" discount)"
                              end if
                           HTML = HTML & "<tr><td class=greytext>Rate:"
                           HTML = HTML & "&nbsp;"&s_rate("Days")&"&nbsp; "&s_d("sRateTypeDesc")&"s @ "&DisplayCurrency(s_rate("StandardRate"))&","&s_rate("DiscountName")&" "&Discount&" @ "&DisplayCurrency(s_rate("Rate"))&"</td>"
                           HTML = HTML & "<td align=right class=text>&nbsp;"
                           HTML = HTML & DisplayCurrency(s_rate("Cost"))
                           HTML = HTML & "</td></tr>"
                     else    
                           HTML = HTML & "<tr><td class=greytext>Rate:"
                           HTML = HTML & "&nbsp;"&s_rate("Days")&"&nbsp; "&s_d("sRateTypeDesc")&"s @ "&DisplayCurrency(s_rate("Rate"))&"</td>"
                           HTML = HTML & "<td align=right class=text>&nbsp;"
                           HTML = HTML & DisplayCurrency(s_rate("Cost"))
                           HTML = HTML & "</td></tr>"
                     end if
            

        s_rate.MoveNext
        Loop
        s_rate.close
        set s_rate=nothing
      
         end if
        
           '--- extra fees

           SQL="SELECT   PaymentExtraFeesBuffer.Fees,ExtraFeesID, ExtraValue,ExtraDesc,  "
           SQL=SQL&" CASE WHEN QTY=1 then '' else 'QTY '+ CONVERT(VARCHAR(10),QTY) END AS ExtraFeesQTY, "
           SQL=SQL&" case WHEN SetMaxPrice=1 then 'Fixed' ELSE Type END as Type, "
           SQL=SQL&"  Name   "
           SQL=SQL&" FROM PaymentExtraFeesBuffer, ExtraFees    "
           SQL=SQL&" WHERE (ReservationNo)="&s_d("ReservationNo")&" "
           SQL=SQL&" and ExtraFeesID = ExtraFees.ID  "
           SQL=SQL&" ORDER BY TYPE, NAME  "
         Set s_extra=Conn.Execute(SQL)
        


        DO WHILE NOT s_extra.EOF
               if s_extra("Type")="Percentage" then
                       HTML = HTML & "<tr><td class=greytext>"&s_extra("Name")&"  "&theQTY&":</td>"

               else
                        HTML = HTML & "<tr><td class=greytext>"&s_extra("Name")&" "&s_extra("Type")&"  "&DisplayCurrency(s_extra("Fees"))&" "&s_extra("ExtraFeesQTY")&":</td>"
               end if
               HTML = HTML & "<td align=right class=text>"&DisplayCurrency(s_extra("ExtraValue"))&"</td></tr>"
               if s_extra("ExtraDesc")<>"" then
                       HTML = HTML & "<tr><td class=greytext colspan=2>"&s_extra("ExtraDesc")&" </td></tr>"
                end if
             
        s_extra.MoveNext
        Loop 
        s_extra.close   
          
  '----Unlimited kms within area of use, use syDesc to hold the text desc
          Session("Mileage")="Kms"
          Session("unlimitedKms") ="Unlimited "&Session("Mileage")
        Set s_st=Conn.Execute("SELECT * FROM SystemTable WHERE Code='ULKMS'  ")
         If not s_st.EOF then
               Session("unlimitedKms") = s_st("syDesc")
        END IF
        s_st.CLOSE
        SET s_st=NOTHING


         SQL="SELECT KmsFree,AddKmsFee,rf_MaxKmscharge,rf_DailyRate from ReservationBuffer "
         SQL=SQL&" LEFT JOIN  ReservationFeesBuff  ON   ReservationBuffer.ReservationNo=ReservationFeesBuff.rf_ReservationNo "
         SQL=SQL&" where  ReservationNo="&s_d("ReservationNo")&" "
        'Response.Write(SQL)
         Set s_kmf=Conn.Execute(SQL)
         KmsRateTotal=0
         
         TotalRentalDays=s_d("RentalDays")

           if s_kmf("rf_MaxKmscharge")=0 and s_kmf("rf_DailyRate")=0  then
                   KmsDesc=Session("unlimitedKms")
                   HTML = HTML & "<tr><td class=greytext colspan=2>"&KmsDesc&"</td></tr>"
          elseif s_kmf("rf_DailyRate")<>"" and s_kmf("rf_DailyRate")<>0 and s_kmf("KmsFree")=0 then
                   KmsRateTotal=TotalRentalDays* s_kmf("rf_DailyRate")
                KmsDesc="Unlimited "&Session("Mileage")&", daily rate @"&DisplayCurrency(s_kmf("rf_DailyRate"))
                     HTML = HTML & "<tr><td  class=greytext>"&KmsDesc&"</td><td align=right  class=text>"&DisplayCurrency(KmsRateTotal)&"</td></tr>" 
                
         elseif s_kmf("rf_DailyRate")<>"" and s_kmf("rf_DailyRate")<>0 and s_kmf("KmsFree")>0 then
                    KmsRateTotal=TotalRentalDays* s_kmf("rf_DailyRate")
                KmsDesc="Daily rate @"&DisplayCurrency(s_kmf("rf_DailyRate"))&", "&s_kmf("KmsFree")&" "&Session("Mileage")&" free per day, additional per "&Session("Mileage")&" "&DisplayCurrency(s_kmf("AddKmsFee"))
                   HTML = HTML & "<tr><td class=greytext colspan=2>"&KmsDesc&"</td></tr>"
           elseif  s_kmf("rf_MaxKmscharge")<>"" and  s_kmf("rf_MaxKmscharge")<>0 then  
                   sKmsMaxprice=", max charge "&DisplayCurrency(s_kmf("rf_MaxKmscharge"))&" per day" 
                   KmsDesc=s_kmf("KmsFree")&" "&Session("Mileage")&" free per day, additional per "&Session("Mileage")&" "&DisplayCurrency(s_kmf("AddKmsFee"))&" "&sKmsMaxprice
                     HTML = HTML & "<tr><td class=greytext colspan=2>"&KmsDesc&"</td></tr>"
            elseif (s_kmf("KmsFree")<>0 or s_kmf("AddKmsFee")<>0 )  then
                   KmsDesc=s_kmf("KmsFree")&" "&Session("Mileage")&" free per day, additional per "&Session("Mileage")&" "&DisplayCurrency(s_kmf("AddKmsFee"))
                    HTML = HTML & "<tr><td class=greytext colspan=2>"&KmsDesc&"</td></tr>"
         'else
                     'Response.Write("<option value='0' selected>-------N/A---------</option>")
            end if

       
        
         s_kmf.close
         set s_kmf=nothing
      


         Set s_st=Conn.Execute("SELECT * FROM QStampDuty WHERE ID="&s_d("PickupLocationID")&"  ")
         If not s_st.EOF then

                  TaxName2=s_st("LocalTaxDesc")
                  TaxName1=s_st("SalesTax")
         end if
         s_st.close
          set s_st=nothing



       
        if GSTInclusiv="Yes" then
                  if s_d("StampDuty")>0 then
                     HTML = HTML & "<tr><td class=greytext>"&TaxName2&":</td><td align=right class=text>"&DisplayCurrency(s_d("StampDuty"))&"</td></tr>"
                  end if 
                  HTML = HTML & "<tr><td class=greytext><b>Total Estimate of Charges:</td><td align=right class=text><b>"&CompanyCurrency&" "&DisplayCurrency(s_d("BookingValue"))&"</td></tr>"
                  if s_d("GST")>0 then
                        HTML = HTML & "<tr><td colspan=2 class=greytext>(All Prices "
                        HTML = HTML &TaxName1
                        HTML = HTML & " Inclusive)</td></tr>"
                  end if
        
        else
                   if s_d("StampDuty")>0 then
                                 HTML = HTML & "<tr><td class=greytext>"&TaxName2&" ("&(Request.form("StampDutyRate")*100)&"%):</td><td align=right class=text>"&DisplayCurrency(s_d("StampDuty"))&"</td></tr>"
                   end if
                   if s_d("GST")>0 then
                        HTML = HTML & "<tr><td class=greytext>"&TaxName1&"</td><td align=right class=text>"&DisplayCurrency(s_d("GST"))&"</td></tr>"
                  end if

                   HTML = HTML & "<tr><td class=greytext><b>Total Estimate of Charges</td><td align=right class=text>"&CompanyCurrency&" "&DisplayCurrency(s_d("BookingValue"))&"</td></tr>"

         end if
     
        HTML = HTML & "</table>"
         HTML = HTML & "</td></tr>"
         if s_d("Notes")<>"" then
            HTML = HTML & "<tr><td colspan='2' >&nbsp;</td></tr>"
            HTML = HTML & "<tr><td class='GREYTEXT' colspan='2'>Comments/Requests:</td></tr>"
            HTML = HTML & "<tr><td class='GREYTEXT' colspan='2'>"&s_d("Notes")&"</td></tr>"
       end if

'Response.Write FileName


           Set MFile=FileObject.OpenTextFile(FileName, 1)
           HTML = HTML & "<tr><td style='height:1px' colspan='2'  bgcolor='"&CompanyColour&"'></td></tr>"
           HTML = HTML & "<tr><td class='GREYTEXT' colspan='2'>"
           HTML = HTML & MFile.ReadAll
           HTML = HTML & "</td></tr>"
           MFile.Close
           Set MFile=nothing
    

         HTML = HTML & "<tr><td HEIGHT=1 colspan=2  bgcolor="&CompanyColour&"></td></tr>"



           HTML = HTML & "<tr><td class=text colspan=2><br><p>"
           HTML = HTML & "Kind regards"
           HTML = HTML & "</td></tr>"
         
         
        
           HTML = HTML & "<tr><td class=text colspan=2><br><p><B>"&Company&"</td></tr>"
           HTML = HTML & "<tr><td class=text colspan=2>"&LocationBranch&"</td></tr>"
           HTML = HTML & "<tr><td style='border:solid windowtext 1.0px;  border-color:"&CompanyColour&"' bgcolor="&CompanyColour&" align=center colspan=2  class=Yellow>"
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
            
       
          
            HTML = HTML & "<br><p></body>"
         HTML = HTML & "</html>"
            
    
         MyCDONTSMail.Body=HTML    
         MyCDONTSMail.Send
         set MyCDONTSMail=nothing  

        'Response.Write HTML

    

        Response.Write("<table   align='center' bgcolor='"&CompanyColour&"' cellspacing='1' cellpadding='1'  border='0'>")
        Response.Write("<tr><td>")
      Response.Write("<table width='100%' align='center' bgcolor='#FFFFFF'  cellspacing='0' cellpadding='2'  border='0'>")
      Response.Write("<tr><td  style='height:20px' align='center' bgcolor='"&CompanyColour&"' class='white' >Thank you for your "&onlineType&"</td></tr>")


      if FreeSale  = 1 then
            Response.Write("<tr><td>&nbsp;</td></tr>")
            if s_d("Quotation")=True then
                  Response.Write("<tr><td align='center' class='text'>Your "&onlineType&"  has now been forwarded to "&Company&"</td></tr>")
                  Response.Write("<tr><td align='center'  class='text'>A copy of this quotation has also been emailed to you.</td></tr>")
                  Response.Write("<tr><td>&nbsp;</td></tr>")
                  Response.Write("<tr><td class='text' align='center' >If you would like to proceed with this quotation please email us at <a href='mailto:"&CompanyEmail&"'  class='re'd><font color='#FF0000'>"&CompanyEmail&"</font></a></h1></td></tr>")
                  Response.Write("<tr><td align='center' class='text'>Once again thank you for your "&onlineType&" with "&Company&"..</td></tr> ")

             else
                  Response.Write("<tr><td align='center' class='text'>Your "&onlineType&"  has now been forwarded to "&Company&"</td></tr>")
                  Response.Write("<tr><td align='center' class='text'>You will be contacted shortly with pick-up details and confirmation.</td></tr>")
                  Response.Write("<tr><td align='center' class='text'>An "&onlineType&" confirmation has been emailed to you.</td></tr>")
                  if Session("RCM168_useDPSpayment")="Yes" and DPS_PaymentAmount>0 then
                              Response.Write("<TR><td align='center'  class='text'>Your <strong>PAYMENT REFERENCE</strong> number is  <strong>"&strDpsTxnRef&" </strong><Br></td></tr>  ")
                  elseif Session("RCM168_useDPSpayment")="Yes" and DPS_PaymentAmount=0 then
                              Response.Write("<TR><td class='text'>Your Credit Card payment has been declined. Please contact us directly and quote your booking request number to confirm your booking request.</td></tr> ")
                  end if
                  Response.Write("<tr><td align='center' class='text'>If you have any queries regarding the status of your "&onlineType&" please don't hesitate to contact "&Company&"  at <a href='mailto:"&CompanyEmail&"'  class='red'><font color='#FF0000'>"&CompanyEmail&"</font></a></td></tr>  ")
                  Response.Write("<tr><td align='center' class='text'>Once again thank you for your "&onlineType&" with "&Company&"..</td></tr> ")
           end if
      else
            if s_d("Quotation")=True then
                     Response.Write("<tr><td align='center' class='text'>Your "&onlineType&"  has now been forwarded to "&Company&"</td></tr>")
                     Response.Write("<tr><td align='center' class='text'>A copy of this quotation has also been emailed to you.</td></tr>")
                     Response.Write("<tr><td>&nbsp;</td></tr>")
                     Response.Write("<tr><td class='text' align=center >If you would like to proceed with this quotation please email us at <a href='mailto:"&CompanyEmail&"'  class=red><font color='#FF0000'>"&CompanyEmail&"</font></a></h1></td></tr>")
                    Response.Write("<tr><td  align='center' class='text'>Once again thank you for your "&onlineType&" with "&Company&"..</td></tr> ")

             else
                     Response.Write("<tr><td class='text' align=center>Your booking request has been forwarded to "&Company&" </td></tr>")
                     Response.Write("<tr><td>&nbsp;</td></tr>")
                     Response.Write("<tr><td class='text' align=center >As this car type is heavily booked during this period you will be contacted shortly to confirm availability.</h1></td></tr>")
                     'Response.Write("<tr><td class='text' align=center >Please note: No charge will be made against your credit card until your reservation is confirmed.</h1></td></tr>")
                     Response.Write("<tr><td>&nbsp;</td></tr>")
                     if Session("RCM168_useDPSpayment")="Yes" and DPS_PaymentAmount>0 then
                              Response.Write("<TR><td align='center'  class='text'>Your <strong>PAYMENT REFERENCE</strong> number is  <strong>"&strDpsTxnRef&" </strong><Br></td></tr>  ")
                     elseif Session("RCM168_useDPSpayment")="Yes" and DPS_PaymentAmount=0 then
                              Response.Write("<TR><td>Your Credit Card payment has been declined. Please contact us directly and quote your booking request number to confirm your booking request.</td></tr> ")
                     end if
                    Response.Write("<tr><td align='center' class='text'>If you have any queries regarding the status of your "&onlineType&" please don't hesitate to contact "&Company&"  at <a href='mailto:"&CompanyEmail&"'  class=red><font color='#FF0000'>"&CompanyEmail&"</font></a></td></tr>  ")
                     Response.Write("<tr><td  class='text'></td></tr>")
                     Response.Write("<tr><td align='center' class='text'>Once again thank you for booking with "&Company&".</td></tr> ")
            end if
       end if
      Response.Write("<tr><td  align='center'>")
      Response.Write("<form method='post' action='emailBooking.asp'>")
      Response.Write "<div style='text-align: center; padding-bottom: 4px; padding-top: 4px;'>"
      '<a href='WebStep1.aspx' target='_self'>"
      Response.Write "<a id=btnContinue' class='Button' href='WebStep1.aspx' target='_self'>Click for another booking</a>"
      '<asp:Button ID="btnContinue" CssClass="Button" runat="server" Text="Continue" PostBackUrl="~/webStep1.aspx" />
      'Response.Write "<img src='images/Clickforanotherbooking.png' alt='Click for another booking' style='border:none;' />"
      Response.Write "</a></div>"
      Response.Write("</form>")
      Response.Write("</td></tr> ")
      Response.Write("<tr><td style='height:40px'>&nbsp;</td></tr>")
      Response.Write("</table>")
      Response.Write("</td></tr>")
      Response.Write("</table> ")



          s_d.close
           Set s_d=Nothing
          Conn.CLOSE
         Set Conn =NOTHING


   
 END IF        
    
        %>
</body>
</html>
