<%
   'if Session(tst("Key"))="" Then Response.Redirect("Step2.aspx")

   Dim tst As New Hashtable
   tst.Add("Key", "V1VraUF0SVBKZkNaZTlLWDltVERzUT09")
   tst.Add("WebTitle", "Burswood Car Rentals")
   tst.Add("CategoryTypeID", "")
   tst.Add("PickupLocationID", "")
   tst.Add("DropOffLocationID", "")
   tst.Add("PickupDate", "")
   tst.Add("PickupTime", "")
   tst.Add("ReturnDate", "")
   tst.Add("ReturnTime", "")
   tst.Add("Age", "")
   tst.Add("PromoCode", "")
   tst.Add("RateID", "")
   tst.Add("CarSizeID", "")
   tst.Add("valoldcustomer", "")
   tst.Add("valquote", "")
   tst.Add("valbooking", "")
   tst.Add("selOptions", "")
   tst.Add("CustomerData", "")
   tst.Add("Insurance", "")
   tst.Add("ExtraKmOut", "")
   tst.Add("ReservationRef", "")
   tst.Add("ReservationNo", "")
   tst.Add("BookingType", "")
   tst.Add("firstname", "")
   tst.Add("lastname", "")
   tst.Add("email", "")
   tst.Add("phone", "")

   If Not IsNothing(Session(tst("Key"))) Then tst = Session(tst("Key"))
   
   If (Trim(Request.Form("CategoryTypeID")) <> "") Then tst("CategoryTypeID") = Request.Form("CategoryTypeID")
   If (Trim(Request.Form("PickupLocationID")) <> "") Then tst("PickupLocationID") = Request.Form("PickupLocationID")
   If (Trim(Request.Form("DropOffLocationID")) <> "") Then tst("DropOffLocationID") = Request.Form("DropOffLocationID")
   If (Trim(Request.Form("PickupDate")) <> "") Then tst("PickupDate") = Request.Form("PickupDate")
   If (Trim(Request.Form("PickupTime")) <> "") Then tst("PickupTime") = Request.Form("PickupTime")
   If (Trim(Request.Form("ReturnDate")) <> "") Then tst("ReturnDate") = Request.Form("ReturnDate")
   If (Trim(Request.Form("ReturnTime")) <> "") Then tst("ReturnTime") = Request.Form("ReturnTime")
   If (Trim(Request.Form("Age")) <> "") Then tst("Age") = Request.Form("Age")

   If (Trim(Request.Form("RateID")) <> "") Then tst("RateID") = Request.Form("RateID")
   If (Trim(Request.Form("CarSizeID")) <> "") Then tst("CarSizeID") = Request.Form("CarSizeID")
   If (Trim(Request.Form("valoldcustomer")) <> "") Then tst("valoldcustomer") = Request.Form("valoldcustomer")
   If (Trim(Request.Form("valquote")) <> "") Then tst("valquote") = Request.Form("valquote")
   If (Trim(Request.Form("valbooking")) <> "") Then tst("valbooking") = Request.Form("valbooking")
   If (Trim(Request.Form("selOptions")) <> "") Then tst("selOptions") = Request.Form("selOptions")
   If (Trim(Request.Form("CustomerData")) <> "") Then tst("CustomerData") = Request.Form("CustomerData")
   If (Trim(Request.Form("Insurance")) <> "") Then tst("Insurance") = Request.Form("Insurance")
   If (Trim(Request.Form("ExtraKmOut")) <> "") Then tst("ExtraKmOut") = Request.Form("ExtraKmOut")
   If (Trim(Request.Form("ExtraKmOut")) <> "") Then tst("CustomerData") = Request.Form("CustomerData")
   If (Trim(Request.Form("ReservationRef")) <> "") Then tst("ReservationRef") = Request.Form("ReservationRef")
   If (Trim(Request.Form("ReservationNo")) <> "") Then tst("ReservationNo") = Request.Form("ReservationNo")
   If (Trim(Request.Form("BookingType")) <> "") Then tst("BookingType") = Request.Form("BookingType")

   If (Trim(Request.Form("firstname")) <> "") Then tst("firstname") = Request.Form("firstname")
   If (Trim(Request.Form("lastname")) <> "") Then tst("lastname") = Request.Form("lastname")
   If (Trim(Request.Form("email")) <> "") Then tst("email") = Request.Form("email")
   If (Trim(Request.Form("phone")) <> "") Then tst("phone") = Request.Form("phone")

   Session(tst("Key")) = tst
 If ( (Request.Form("PickupLocationID")= "") AND (Request.Form("DropOffLocationID")= "") ) Then Response.Redirect("Step2.aspx")

 
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <link type="text/css" href="assets/css/Extra.css" rel="stylesheet" />
  <script src="include/jquery.js"></script>

  <script type="text/javascript" language="javascript">
    //paste this code under head tag or in a seperate js file.
    // Wait for window load
    $(window).load(function () {
      // Animate loader off screen
      $(".se-pre-con").fadeOut("slow");
    });
  </script>

  <script src="https://secure20.rentalcarmanager.com.au/api/3.0/main/<%=tst("Key")%>" type="text/javascript"></script>
  <script type="text/javascript">
    var frmvalidator;
    var getDetails = 0;
    var subtotal = 0.0;
    var basetotal = 0.0;
    var stamptotal = 0.0;
    var LocID = 0;
    var Age = 0;
    var SizeID = 0;
    var idleTime = 0;
    var idleInterval;
    var oAPI = new rcmAPI();

    $(document).ready(function () {
      //// Sample on how to Init Values from JSON Data build in step3 in case we need it

      //oAPI.InitOptionalItems(document.getElementById("selOptions").value);
      //oAPI.InitCustomerData(document.getElementById("CustomerData").value);
      //if (document.getElementById("Insurance").value!="") oAPI.SetInsurance(document.getElementById("Insurance").value);
      //if (document.getElementById("ExtraKmOut").value != "") oAPI.SetExtraKms(document.getElementById("ExtraKmOut").value);
      document.getElementById("lblResNo").innerHTML = "Booking Reference Number:<strong>" + document.getElementById("ReservationRef").value + "</strong>";

      // Prevent user using Back button
      if (window.history && window.history.pushState) {
        window.history.pushState('forward', null, './Step4.aspx');
        $(window).on('popstate', function () {
          //document.getElementById("btnBack").style.borderColor = "red";
          //alert("Please use 'Select Extra' link instead of browser's back function.");
          BootstrapDialog.show({
            type: BootstrapDialog.TYPE_INFO,
            title: 'Oops you are missing something: ',
            buttons: [{
              label: 'Close',
              cssClass: 'btn-type_info',
              action: function (dialogItself) {
                dialogItself.close();
              }
            }],
            draggable: true,
            message: "Please use 'Select Extra' link instead of browser's back function."
          });
        });
      }

      var ifrm = document.getElementById("frmAuric");
      ifrm.contentWindow.document.write("<center><img src='images/loading_white.gif' alt='Loading....'><br/>Loading...</center>");
      ifrm.contentWindow.document.close();

      oAPI.GetURL(document.getElementById("ReservationRef").value, 'frmAuric');

      // Lock Payment screen after 1 minute being idle
      //Increment the idle time counter every second.
      idleInterval = setInterval(timerIncrement, 1000); // 1 minute

      //Zero the idle timer on mouse movement.
      $(this).mousemove(function (e) {
        idleTime = 0;
      });
      $(this).keypress(function (e) {
        idleTime = 0;
      });

    })

    function timerIncrement() {
      idleTime = idleTime + 1;
      document.getElementById("lblMessage").innerHTML = "Auto lock in: " + (60 - idleTime) + " seconds.";
      if (idleTime >= 60) {
        LockPayment();
      }
    }

    function LockPayment() {
      clearInterval(idleInterval);
      var ifrm = document.getElementById("frmAuric");
      ifrm.src = "lock.htm";
    }

    function gotoConfirmation() {
      document.getElementById("frmStep4").submit();
    }

    var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
    var eventer = window[eventMethod];
    var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";

    // Listen to message from child window
    eventer(messageEvent, function (e) {
      var key = e.message ? "message" : "data";
      var data = e[key];
      //run function//
      document.getElementById('frmAuric').src = "about:blank";

      oAPI.OnPaymentDone(gotoConfirmation);
      oAPI.MakePayment(
            document.getElementById("ReservationRef").value,
            data
         );
    }, false);

  </script>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>:: <%=tst("WebTitle")%> ::</title>
  <!-- CSS -->
  <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:400,100,300,500">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/form-elements.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- Favicon and touch icons -->
  <link rel="shortcut icon" href="assets/ico/favicon.png">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
  <div class="se-pre-con"></div>
  <!-- Top menu -->
  <nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.aspx"><img src="logo.png" alt="" id="logo" /></a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <!--<div class="collapse navbar-collapse" id="top-navbar-1">
        <ul class="nav navbar-nav navbar-right">
          <li>
            <span class="li-text"> Powered by </span>
            <a href="http://www.rentalcarmanager.com/" target="_blank"><strong> Rental Car Manager</strong></a>
            <span class="li-social">
              <a href="https://www.facebook.com/pages/Rental-Car-Manager/108594145878269"><i class="fa fa-facebook"></i></a>
              <a href="https://twitter.com/RCM_News"><i class="fa fa-twitter"></i></a>
              <a href="mailto:mailto:support@rentalcarmanager.com?Subject=Support%20required%20from%20NzRentalCarVillage306"><i class="fa fa-envelope"></i></a>
              <a href="skype:support.rentalcarmanager?call"><i class="fa fa-skype"></i></a>
            </span>
          </li>
        </ul>
      </div>-->
    </div>
  </nav>
  <!-- Top content -->
  <div class="top-content">

    <div class="inner-bg">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div id="progress-bar">
              <div id="progress-bar-steps"><a href="Index.aspx">
                <div class="progress-bar-step done">
                  <!--<div class="progress-bar-step done">-->
                  <div class="step_number">1</div>
                  <div class="step_name">Create request</div></a>
                </div>
                <div class="progress-bar-step done"><a href="Step2.aspx">
                  <div class="step_number">2</div>
                  <div class="step_name">Choose a car</div></a>
                </div>
                <div class="progress-bar-step done">
                  <div class="step_number">3</div>
                  <div class="step_name">Choose extras</div>
                </div>
                <div class="progress-bar-step current">
                  <div class="step_number">4</div>
                  <div class="step_name">Payment</div>
                </div>
                <div class="progress-bar-step last">
                  <div class="step_number">5</div>
                  <div class="step_name">Summary</div>
                </div>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>
        
        <div class="row" style="margin-top:5px;">
          <div class="col-sm-12 form-box">
            <div class="col-sm-12" style="background-color: white; border-radius: 5px; padding-top: 5px; padding-bottom: 5px;">
              <div class="row">
                <div class="form-group col-md-12">
                  
                        <div id="displHeader"><span id="lblResNo">###</span></div>
                      <div id="displBooking">
                        <table align="center" class="padlock">
                      <tr>
                        <td style="padding-right: 5px; width: 8%; text-align: left;" id="td_Padlock">
                          <img src="images/padlock.png" width="32" height="32" />
                        </td>
                        <td style="width: 80%; text-align: center" nowrap="nowrap">
                          <span id="lblHeaderTxt">Secure Credit Card Payment</span>
                        </td>
                        <td style="padding-left: 5px; text-align: right;" id="td_Card">
                          <img src="images/visa_mastercard.jpg" width="100" height="32" />
                        </td>
                      </tr>
                    </table>
                        <div id="divCard" style="padding-top: 5px;">
                      <div id="pnlCardView" class="tdbackCard">
                        <center>
                          <iframe id="frmAuric" name="frmAuric" class="frame" src="about:blank"></iframe>
                        </center>
                      </div>
                    </div>
                        <div id="DivErrorMSG" class="DivFrmMSG" style="display: none;">
                      <center>
                        <div id="imgloading">
                          <img src="images/Loading_White.gif" alt="Confirming" />
                        </div>
                        <table border="0" cellspacing="5" cellpadding="0" id="showcardMSG">
                          <tbody>
                            <tr>
                              <td align="center">
                                <textarea rows="7" cols="120" id="ltrlError" readonly="readonly" class="TextBoxAsLabel"> </textarea><br />
                                <input type="button" value="Add" id="btnAdd" name="btnAdd" onclick="window.location.reload();"
                                  style="text-align: center; display: none;" />
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </center>
                    </div>
                        <table align="center" border="0" style="margin-top: -15px; position: absolute">
                      <tr>
                        <td colspan="2" class="NoteFooter">
                          Note : Your card will NOT be charged until vehicle availability is confirmed
                        </td>
                      </tr>
                    </table>
                        <table align="center" class="padlockFooter">
                      <tr>
                        <td colspan="2">
                          <span id="lblMessage"></span>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" style="width: 90%;" class="fontsmall">
                          <img src='images/Auric.png' /><br />
                          Secured by www.auricsystems.com<br />
                          Auric Systems is a Level 1 PCI DSS Validated Service Provider.
                        </td>
                        <td style="padding-left: 5px; vertical-align: bottom; text-align: right;">
                          <img src="images/pci_dss.png" />
                        </td>
                      </tr>
                    </table>
                      </div>
                </div>
            </div>
          </div>
        </div>
        <div class="row"><div class="col-sm-12">&nbsp;</div></div>

        <form id="frmStep4" name="frmStep4" action="Step5.aspx" method="post">
          <%--<span id='displmsg' class='red'></span>--%>
          <input type='hidden' name='CategoryTypeID' id='CategoryTypeID' value='<%=tst("CategoryTypeID")%>'>
          <input type='hidden' name='PickupLocationID' id='PickupLocationID' value='<%=tst("PickupLocationID")%>'>
          <input type='hidden' name='DropOffLocationID' id='DropOffLocationID' value='<%=tst("DropOffLocationID")%>'>
          <input type='hidden' name='PickupDate' id='PickupDate' value='<%=tst("PickupDate")%>'>
          <input type='hidden' name='PickupTime' id='PickupTime' value='<%=tst("PickupTime")%>'>
          <input type='hidden' name='ReturnDate' id='ReturnDate' value='<%=tst("ReturnDate")%>'>
          <input type='hidden' name='ReturnTime' id='ReturnTime' value='<%=tst("ReturnTime")%>'>
          <input type='hidden' name='Age' id='Age' value='<%=tst("Age")%>'>
          <input type='hidden' name='RateID' id='RateID' value='<%=tst("RateID")%>'>
          <input type='hidden' name='CarSizeID' id='CarSizeID' value='<%=tst("CarSizeID")%>'>
          <input type='hidden' name='choosetext' id='choosetext' value='Check the following entries:'>
          <input type='hidden' name='valoldcustomer' id='valoldcustomer' value='<%=tst("valoldcustomer")%>'>
          <input type='hidden' name='valquote' id='valquote' value='<%=tst("valquote")%>'>
          <input type='hidden' name='valbooking' id='valbooking' value='<%=tst("valbooking")%>'>
          <input type='hidden' name='selOptions' id='selOptions' value='<%=tst("selOptions")%>'>
          <input type='hidden' name='CustomerData' id='CustomerData' value='<%=tst("CustomerData")%>'>
          <input type='hidden' name='Insurance' id='Insurance' value='<%=tst("Insurance")%>'>
          <input type='hidden' name='ExtraKmOut' id='ExtraKmOut' value='<%=tst("ExtraKmOut")%>'>
          <input type='hidden' name='ReservationRef' id='ReservationRef' value='<%=tst("ReservationRef")%>'>
          <input type='hidden' name='ReservationNo' id='ReservationNo' value='<%=tst("ReservationNo")%>'>
          <input type='hidden' name='BookingType' id='BookingType' value='<%=tst("BookingType")%>'>
          <input type='hidden' name='AurSession' id='AurSession' value='<%=tst("AurSession")%>'>
        </form>
      </div>
    </div>
  </div>
  <!-- Javascript -->
  <!--<script src="assets/js/jquery-1.11.1.min.js"></script>-->
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/js/jquery.backstretch.min.js"></script>
  <script src="assets/js/retina-1.1.0.min.js"></script>
  <script src="assets/js/scripts.js"></script>
  <!-- For dialog -->
  <script src="assets/prettify/run_prettify.js"></script>
  <link href="assets/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
  <script src="assets/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
  <!-- For dialog ends -->

  <!--[if lt IE 10]>
      <script src="assets/js/placeholder.js"></script>
  <![endif]-->
</body>
</html>
