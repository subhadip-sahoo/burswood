<%
  ' if Session(tst("Key"))="" Then Response.Redirect("Step2.aspx")

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
   If (Trim(Request.Form("ExtraKmOut")) <> "") Then tst("ExtraKmOut") = Request.Form("CustomerData")
   If (Trim(Request.Form("ReservationRef")) <> "") Then tst("ReservationRef") = Request.Form("ReservationRef")
   If (Trim(Request.Form("ReservationNo")) <> "") Then tst("ReservationNo") = Request.Form("ReservationNo")
   If (Trim(Request.Form("BookingType")) <> "") Then tst("BookingType") = Request.Form("BookingType")

   If (Trim(Request.Form("firstname")) <> "") Then tst("firstname") = Request.Form("firstname")
   If (Trim(Request.Form("lastname")) <> "") Then tst("lastname") = Request.Form("lastname")
   If (Trim(Request.Form("email")) <> "") Then tst("email") = Request.Form("email")
   If (Trim(Request.Form("phone")) <> "") Then tst("phone") = Request.Form("phone")

   Session(tst("Key")) = tst
 If ((Request.Form("PickupLocationID") = "") And (Request.Form("DropOffLocationID") = "")) Then Response.Redirect("Step2.aspx")


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
    var oAPI = new rcmAPI();

    $(document).ready(function () {
      // screen re-sizing
      if (window.matchMedia('(max-width: 767px)').matches) {
        //alert('Here!!');
        $("#dvEmailtxt").attr('class', '');
        $('#dvEmailLbl').remove();
      }

      /////////////////////////////////////////////

      if (document.getElementById("BookingType").value == "2") {
        document.getElementById("reqtitle").innerHTML = "Booking Request Confirmed";
        document.getElementById("refno").innerHTML = "Booking Reference Number <h1>" + document.getElementById("ReservationNo").value + "</h1>";
      } else {
        document.getElementById("reqtitle").innerHTML = "Quote Request Confirmed";
        document.getElementById("refno").innerHTML = "Quote Reference Number <h1>" + document.getElementById("ReservationNo").value + "</h1>";
      }

      // Prevent user using Back button
      if (window.history && window.history.pushState) {
        window.history.pushState('forward', null, './Step5.aspx');
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
    })

    function submitBooking() {
      //alert("submitBooking");
      //document.getElementById("displquote").style.display = "none";
      //document.getElementById("displbook").style.display = "";
      //document.getElementById("bookedbefore").style.display = "";
    }
    function emailquote() {
      //alert("emailquote:" + document.getElementById("displquote").style.display);
    }

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
              <div id="progress-bar-steps"><a href="restart.aspx">
                <div class="progress-bar-step done">
                  <!--<div class="progress-bar-step done">-->
                  <div class="step_number">1</div>
                  <div class="step_name">Create request</div></a>
                </div>
                <div class="progress-bar-step done">
                  <div class="step_number">2</div>
                  <div class="step_name">Choose a car</div>
                </div>
                <div class="progress-bar-step done">
                  <div class="step_number">3</div>
                  <div class="step_name">Choose extras</div>
                </div>
                <div class="progress-bar-step done">
                  <div class="step_number">4</div>
                  <div class="step_name">Payment</div>
                </div>
                <div class="progress-bar-step current">
                  <div class="step_number">5</div>
                  <div class="step_name">Summary</div>
                </div>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>
        
        <div class="row" style="margin-top:5px;">
          <div class="col-sm-12 form-box  text-center">
            <div class="col-sm-12" style="background-color: white; border-radius: 5px; padding-top: 5px; padding-bottom: 5px;">
              <div class="row">
                <div class="col-sm-12 text-center">
                  <h3 id="reqtitle">Request Confirmed</h3>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12 text-center">
                  <img src="./images/check3.png" alt="Completed" width="80" /></div>
              </div>
              <div class="row">
                <div class="col-md-12 text-center">
                  <div id="refno" class="borderred"></div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <div class="row" style="padding-top: 3px;">
          <div class="col-sm-12 form-box">
            <div class="col-sm-12" style="background-color: white; border-radius: 5px; padding-top: 5px; padding-bottom: 5px;">
              <div class="row">
                <div class="form-group col-md-12">
                  <div id="displbook">
                        <div class='row'>
                          <div class='col-sm-12  text-center'>
                            <h3>Request Details</h3>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-5 col-sm-6 text-right">First Name : </div>
                          <div class="col-xs-7 col-sm-6 text-left"><%=tst("firstname")%></div>
                        </div>
                        <div class="row">
                          <div class="col-xs-5 col-sm-6 text-right">Last Name : </div>
                          <div class="col-xs-7 col-sm-6 text-left"><%=tst("lastname")%></div>
                        </div>
                        <div class="row">
                          <div class="col-xs-5 col-sm-6 text-right">Phone : </div>
                          <div class="col-xs-7 col-sm-6 text-left"><%=tst("phone")%></div>
                        </div>
                        <div class="row">
                          <div class="col-xs-5 col-sm-6 text-right" id="dvEmailLbl">Email  : </div>
                          <div class="col-xs-7 col-sm-6 text-left"  id="dvEmailtxt"><%=tst("email")%></div>
                        </div>
                  </div>
                </div>
            </div>
          </div>
        </div>
        <div class="row"><div class="col-sm-12">&nbsp;</div></div>

        <form id="frmStep5" name="frmStep5" action="Step5.aspx" method="post">

          <span id='displmsg' class='red'></span>
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
