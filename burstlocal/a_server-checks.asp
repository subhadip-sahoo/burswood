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
    'sOutput = REPLACE(sOutput, "%", " ")
    'Response.Write("sOutput = " & sOutput & "<hr/>")

    ' next convert %hexdigits to the character
    aSplit = Split(sOutput, "%")
    'Response.Write "<br/>Count : " & UBound(aSplit) &"<br/>"
    'For Each item In aSplit
    '  Response.Write(item & "<br />")
    'Next
    'Response.End
    On Error Resume Next
    If IsArray(aSplit) AND UBound(aSplit) > 0  Then
      sOutput = aSplit(0)
      sOutput = ""
      For I = 0 to UBound(aSplit) - 1
        sOutput = sOutput & _
          Chr("&H" & Left(aSplit(i + 1), 2)) &_
          Right(aSplit(i + 1), Len(aSplit(i + 1)) - 2)
          'Response.Write(I & "--" & sOutput & "<br />")
      Next
    End If

    URLDecode = sOutput
End Function

' Anti-hacker checks
if not allowanything then
'Response.Write "allowanything="&allowanything&"<br>"
'thispage = lcase(request.ServerVariables("SCRIPT_NAME"))


'---if ignorehack =False, it will check both request.querystring+request.form
'if not ignorehack then  scheck="form+querystring"  else scheck="querystring"
'Response.Write scheck & "<br/>"

'ignorehack = False
if not ignorehack then hackcheck = lcase(request.querystring+request.form) else hackcheck = lcase(request.querystring)

'--changed to check form and querystring, no need the flag ignorehack 
'--get error on this line if we block the line 49 a nd 50 (ignorehack = False)
'-- Mrinal | 21-8-14, Back to the hackcheck based string So, it will check Form's POST data only if ignorehack = False
'hackcheck = lcase(request.querystring+request.form)


hackcheck = replace(hackcheck, "&action=update", "")
hackcheck = replace(hackcheck, "1=1", "") '' Added after instruction from Somania | On 14-Aug-14  | By Mrinal
ckoff = False
hackcheck=urldecode(hackcheck) '' Added after instruction from Somania | On 14-Aug-14  | By Mrinal
if len(hackcheck) > 5 then
   ckoff = (instr(replace(hackcheck,"selection", ""),"select%") > 0 OR instr(hackcheck,Trim("1=1")) > 0 OR ((instr(hackcheck,"convert%") > 0 or instr(hackcheck,"convert(") > 0 or instr(hackcheck,"cast(") > 0) OR (instr(hackcheck,"int(") > 0 or instr(hackcheck,"char%") > 0)) or (instr(hackcheck,"sysobjects") > 0 or instr(hackcheck,"information_schema") > 0))
   if instr(hackcheck,"<script") + instr(hackcheck,"/script") + instr(hackcheck,"%3cscript") + instr(hackcheck,"char(124)") > 0 then ckoff = true
   if not ckoff and ((instr(hackcheck,"declare") > 0  and instr(hackcheck,"@") > 0) or (instr(hackcheck,"declare") > 0 and instr(hackcheck,"set") > 0 and instr(hackcheck,"@") > 0 and (instr(hackcheck,"cast") > 0 or instr(hackcheck,"convert(") > 0 or instr(hackcheck,"convert%") > 0)) ) then ckoff = True
   if not ckoff and ((instr(URLDecode(hackcheck),"declare") > 0 and instr(URLDecode(hackcheck),"cast") > 0 and instr(hackcheck,"@") > 0) or (instr(URLDecode(hackcheck),"declare") > 0 and instr(URLDecode(hackcheck),"set") > 0 and instr(URLDecode(hackcheck),"@") > 0 and (instr(URLDecode(hackcheck),"cast") > 0 or (instr(URLDecode(hackcheck),"convert(") > 0) or instr(URLDecode(hackcheck),"convert%") > 0)) ) then ckoff = true
 
   '' ||Added after instruction from Somania||
   '' ||On 14-Aug-14 || 
   '' ||By Mrinal    ||
   '"--", ";", " _ " || Commented as DPS using these||
   Dim BlackList
   BlackList = Array( "/*", "*/", "@@",_
              "char%", "nchar%", "varchar", "nvarchar",_
               "DELAY%",  "alter%", "begin%", "cast%", "cast(", "create%", "cursor%",_
                  "declare%", "delete%", "drop%", "end%", "exec%","exec(",_
                  "execute%", "fetch%", "insert%", "kill%", "open%",_
                  "select+", "select%", "sys%", "sysobjects", "syscolumns",_
                   "table%", "update%",  "@@version",  "Shutdown", "sleep(")

   If ( CheckStringForSQL(BlackList,hackcheck) ) Then    ckoff = True
   '' ||End Changes || 

'Response.Write "len(hackcheck)= "&len(hackcheck)&"<br/>"
'Response.Write "ckoff= "&ckoff&"<br/>"
end if
hackqs = lcase(request.querystring)
hackqs = replace(hackqs, "&action=update", "")
if not ckoff and len(hackqs) > 10 then
   ckoff = ((instr(hackqs,"delete") > 0 and instr(hackqs,"from") > 0) or (instr(hackqs,"update") > 0 and instr(hackqs,"set") > 0) or (instr(hackqs,"drop") > 0 and instr(hackqs,"table") > 0) or (instr(hackqs,"truncate") > 0 and instr(hackqs,"table") > 0))
   if instr(hackqs,"<script") + instr(hackqs,"/script") > 0 + instr(hackcheck,"%3cscript") > 0 then ckoff = true
   if not ckoff and ((instr(hackcheck,"declare") > 0 and instr(hackcheck,"exec") > 0 and instr(hackcheck,"@") > 0) or (instr(hackcheck,"declare") > 0 and instr(hackcheck,"set") > 0 and instr(hackcheck,"@") > 0 and (instr(hackcheck,"cast") > 0 or instr(hackcheck,"convert") > 0)) ) then ckoff = true
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
  For each item in Request.ServerVariables
   HTMLSC = HTMLSC &"<tr style='border:none 0px;  border-color:#8DC63F'><td colspan=2></td></tr>"
   HTMLSC = HTMLSC & "<tr><td><font size='2' face='Arial'>" & item & "</font></td><td><font size='2' face='Arial'>"
   HTMLSC = HTMLSC & Request.ServerVariables(item)
   HTMLSC = HTMLSC & "</font></td></tr>" & vbCrLf
  Next

  HTMLSC = HTMLSC & "<tr><td><font size='2' face='Arial'>Posted Data</font></td><td><font size='2' face='Arial'>"
  HTMLSC = HTMLSC & hackcheck
  HTMLSC = HTMLSC & "</font></td></tr>" & vbCrLf

  HTMLSC = HTMLSC & "</table>"

  'Response.Write HTMLSC
  sc_MyCDONTSMail.Body=HTMLSC
  sc_MyCDONTSMail.Send
  set sc_MyCDONTSMail=nothing
  response.End()
End if
end if
'Response.Write "Complete<br/>"
'''''''''''
'' Added after instruction from InSomnia | On 14-Aug-14  | By Mrinal 
'''''''''''

'''''''''''''''''''''''''''''''''''''''''''''''''''               
'  This function does not check for encoded characters
'  since we do not know the form of encoding your application
'  uses. Add the appropriate logic to deal with encoded characters
'  in here 
'''''''''''''''''''''''''''''''''''''''''''''''''''

Function CheckStringForSQL(ArrayBlackList, str) 
  On Error Resume Next 
  'For Each item In BlackList
   'Response.Write(item & "<br />")
  'Next

  Dim lstr 
  ' If the string is empty, return true
  If ( IsEmpty(str) ) Then
    CheckStringForSQL = false
    Exit Function
  ElseIf ( StrComp(str, "") = 0 ) Then
    CheckStringForSQL = false
    Exit Function
  End If
  
  lstr = LCase(str)
  
  ' Check if the string contains any patterns in our
  ' black list
  For Each s in ArrayBlackList
  
    If ( InStr (lstr, s) <> 0 ) Then
      CheckStringForSQL = true
      Exit Function
    End If
  
  Next
  
  CheckStringForSQL = false
  
End Function 
'' End | On 14-Aug-14  | By Mrinal 
%>
