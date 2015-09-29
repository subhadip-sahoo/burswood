<%
' -----------------------------------------
' URL decode to retrieve the original value

Function URLDecode(sConvert)
    Dim aSplit
    Dim sOutput
    Dim I
    If IsNull(sConvert) Then
       URLDecode = ""
       Exit Function
    End If

    ' convert all pluses to spaces
    sOutput = REPLACE(sConvert, "+", " ")

    ' next convert %hexdigits to the character
    aSplit = Split(sOutput, "%")

    If IsArray(aSplit) Then
      sOutput = aSplit(0)
      For I = 0 to UBound(aSplit) - 1
        sOutput = sOutput & _
          Chr("&H" & Left(aSplit(i + 1), 2)) &_
          Right(aSplit(i + 1), Len(aSplit(i + 1)) - 2)
      Next
    End If

    URLDecode = sOutput
End Function

' Anti-hacker checks
if not allowanything then 
'Response.Write "allowanything="&allowanything&"<br>"
'thispage = lcase(request.ServerVariables("SCRIPT_NAME"))

if not ignorehack then hackcheck = lcase(request.querystring+request.form) else hackcheck = lcase(request.querystring)
'Response.Write "ignorehack = "&ignorehack &"<br/>"
hackcheck = replace(hackcheck, "&action=update", "")
'hackcheck = replace(hackcheck, "1=1", "")
ckoff = false
if len(hackcheck) > 5 then
   ckoff = (instr(replace(hackcheck,"selection", ""),"select") > 0 OR instr(hackcheck,Trim("1=1")) > 0 OR ((instr(hackcheck,"convert") > 0 or instr(hackcheck,"cast") > 0) OR (instr(hackcheck,"int%") > 0 or instr(hackcheck,"char") > 0)) or (instr(hackcheck,"sysobjects") > 0 or instr(hackcheck,"information_schema") > 0))
   if instr(hackcheck,"<script") + instr(hackcheck,"/script") + instr(hackcheck,"%3cscript") + instr(hackcheck,"char(124)") > 0 then ckoff = true
   if not ckoff and ((instr(hackcheck,"declare") > 0 and instr(hackcheck,"exec") > 0 and instr(hackcheck,"@") > 0) or (instr(hackcheck,"declare") > 0 and instr(hackcheck,"set%") > 0 and instr(hackcheck,"@") > 0 and (instr(hackcheck,"cast") > 0 or instr(hackcheck,"convert") > 0)) ) then ckoff = True
   if not ckoff and ((instr(URLDecode(hackcheck),"declare") > 0 and instr(URLDecode(hackcheck),"cast") > 0 and instr(hackcheck,"@") > 0) or (instr(URLDecode(hackcheck),"declare") > 0 and instr(URLDecode(hackcheck),"set%") > 0 and instr(URLDecode(hackcheck),"@") > 0 and (instr(URLDecode(hackcheck),"cast") > 0 or instr(URLDecode(hackcheck),"convert") > 0)) ) then ckoff = true
   'if ckoff then response.write((instr(hackcheck,"select") > 0 and ((instr(hackcheck,"convert") > 0 or instr(hackcheck,"cast") > 0) and (instr(hackcheck,"int") > 0 or instr(hackcheck,"char") > 0)))) : response.End()
'Response.Write "len(hackcheck)= "&len(hackcheck)&"<br/>"
'Response.Write "ckoff= "&ckoff&"<br/>"
end if
hackqs = lcase(request.querystring)
hackqs = replace(hackqs, "&action=update", "")
if not ckoff and len(hackqs) > 10 then
   ckoff = ((instr(hackqs,"delete") > 0 and instr(hackqs,"from") > 0) or (instr(hackqs,"update") > 0 and instr(hackqs,"set%") > 0) or (instr(hackqs,"drop") > 0 and instr(hackqs,"table") > 0) or (instr(hackqs,"truncate") > 0 and instr(hackqs,"table") > 0))
   if instr(hackqs,"<script") + instr(hackqs,"/script") > 0 + instr(hackcheck,"%3cscript") > 0 then ckoff = true
   if not ckoff and ((instr(hackcheck,"declare") > 0 and instr(hackcheck,"exec") > 0 and instr(hackcheck,"@") > 0) or (instr(hackcheck,"declare") > 0 and instr(hackcheck,"set%") > 0 and instr(hackcheck,"@") > 0 and (instr(hackcheck,"cast") > 0 or instr(hackcheck,"convert") > 0)) ) then ckoff = true
end if
'Response.Write "ckoff= "&ckoff&"<br/>"
if instr(thispage, "<") + instr(thispage, "<script") + instr(hackcheck,"%3cscript") + instr(hackcheck,"char(124)") > 0 then ckoff = true
   if ckoff then 'response.redirect("http://rentalcarmanager.com/car_rental_software_features.html?site=" & lcase(request.servervariables("SERVER_NAME")) & "&" & request.querystring & "&form=" & request.form & "&page=" & request.ServerVariables("SCRIPT_NAME")) : response.End()
   Response.Write "Error in Data Poseted"
  Dim  HTMLSC
  Dim sc_MyCDONTSMail

  Set sc_MyCDONTSMail = CreateObject("CDONTS.NewMail")

  sc_MyCDONTSMail.From = "support@rentalcarmanager.com"
  sc_MyCDONTSMail.To = "support@rentalcarmanager.com"
  'sc_MyCDONTSMail.Cc = "mrinal@rentalcarmanager.com"
  sc_MyCDONTSMail.Subject="RCM server Security Alert " &  now
  sc_MyCDONTSMail.BodyFormat=0
  sc_MyCDONTSMail.MailFormat=0
  sc_MyCDONTSMail.Body=HTMLSC
  sc_MyCDONTSMail.Importance = 2

  HTMLSC = "<html>"
  HTMLSC = HTMLSC & "<head>"
  HTMLSC = HTMLSC & "<META http-equiv=Content-Type content='text/html; charset=windows-1252'>"
  HTMLSC = HTMLSC & "<STYLE>"
  HTMLSC = HTMLSC & ".text{  font-size: 11px; line-height: 15px; font-size: 11px;  font-family: Verdana,Arial;}   "
  HTMLSC = HTMLSC & "</STYLE>"
  HTMLSC = HTMLSC & "<META content='MSHTML 6.00.2900.2722' name=GENERATOR></HEAD>"
  HTMLSC = HTMLSC & "<title>Error on Page</title>"
  HTMLSC = HTMLSC & "</head>"
  HTMLSC = HTMLSC & "<body bgcolor='#FFFFFF'>"

  HTMLSC = HTMLSC & "<table style='border-collapse:collapse;  border:solid windowtext 1.0pt; border-color:red; ' cellspacing='0' cellpadding='2' width='600' align='center' 'bgcolor=#ffffff' >"
  HTMLSC = HTMLSC & "<tr style='border:solid windowtext 1.0px;  border-color:orange'>"
  HTMLSC = HTMLSC & "<td style='border:solid windowtext 1.0px;height:25px;  border-color:red' bgcolor='#8dc63f' colspan='2'>"
  HTMLSC = HTMLSC & "Server log - hacked on " &  now
  HTMLSC = HTMLSC & "</td></tr>"
  HTMLSC = HTMLSC & "<tr><td colspan=2>&nbsp;<br></td></tr>"
  HTMLSC = HTMLSC &"<tr style='border:none 0px;  border-color:#8DC63F'><td colspan=2>Dear&nbsp; Support, </td></tr>"
  HTMLSC = HTMLSC & "<tr><td colspan=2>&nbsp;<br></td></tr>"
  HTMLSC = HTMLSC & "<tr><td colspan=2><table style='BORDER-COLLAPSE: collapse' border='1'>"
  For each item in Request.ServerVariables
   HTMLSC = HTMLSC & "<tr><td><font size='2' face='Arial'>" & item & "</font></td><td><font size='2' face='Arial'>"
   HTMLSC = HTMLSC & Request.ServerVariables(item)
   HTMLSC = HTMLSC & "</font></td></tr>" & vbCrLf
  Next
  HTMLSC = HTMLSC & "</table></td></tr>"
  HTMLSC = HTMLSC & "<tr><td colspan=2>&nbsp;<br></td></tr>"
  HTMLSC = HTMLSC &"<tr style='border:none 0px;  border-color:#8DC63F'><td colspan=2></td></tr>"
  HTMLSC = HTMLSC & "</table>"

  'Response.Write HTMLSC
  sc_MyCDONTSMail.Body=HTMLSC
  sc_MyCDONTSMail.Send
  set sc_MyCDONTSMail=nothing
  response.End()
End if
end if
'Response.Write "Complete<br/>"
%>
