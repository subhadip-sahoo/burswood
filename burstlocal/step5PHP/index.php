<?php
	if (!isset($_SESSION['CategoryTypeID'])) $_SESSION["CategoryTypeID"] = "";
	if (!isset($_SESSION['PickupLocationID'])) $_SESSION["PickupLocationID"] = "";
	if (!isset($_SESSION['DropOffLocationID'])) $_SESSION["DropOffLocationID"] = "";
	if (!isset($_SESSION['PickupDate'])) $_SESSION["PickupDate"] = "";
	if (!isset($_SESSION['PickupTime'])) $_SESSION["PickupTime"] = "";
	if (!isset($_SESSION['ReturnDate'])) $_SESSION["ReturnDate"] = "";
	if (!isset($_SESSION['ReturnTime'])) $_SESSION["ReturnTime"] = "";
	if (!isset($_SESSION['Age'])) $_SESSION["Age"] = "";
	if (!isset($_SESSION['refid'])) $_SESSION["refid"] = "";
	
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <link type="text/css" href="assets/css/Extra.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="include/jquery.datetimepicker.css" />
  <script src="include/jquery.js"></script>
  <script src="include/jquery.datetimepicker.js"></script>

   <script src="https://secure20.rentalcarmanager.com.au/api/3.0/main" type="text/javascript"></script>
    <script type="text/javascript">
    var oAPI = new rcmAPI();
    
    $(document).ready(function () {
      var maxWidth = Math.max.apply(null, $(window).map(function () {
        return $(this).outerWidth(true);
      }).get());
      oAPI.OnReadyStep1(DisplStep1);
      oAPI.OnLocationChange(LocUpdForm);
      oAPI.GetStep1();


      $('#fat-btn').click(function () {
        $(this).addClass('btn-danger');
        $(this).toggleClass('active');
      });    
    })

    function DisplStep1() {
    	oAPI.LoadCategoryType(document.getElementById("cmbCatType"), '<?php echo $_SESSION["CategoryTypeID"]; ?>');
    	
      //oAPI.LoadAgeList(document.getElementById("cmbAge"), '<?php echo $_SESSION["Age"]; ?>');


    	oAPI.LoadLocationsList(document.getElementById("cmbPickup"), document.getElementById("cmbDropOff"), document.getElementById("cmbAge"), '<?php echo $_SESSION["PickupLocationID"]; ?>', '<?php echo $_SESSION["DropOffLocationID"]; ?>');

      $('#txtPickupTime').datetimepicker({
        datepicker: false,
        mask: true,
        format: 'H:i',
        closeOnDateSelect: true,
        step: 30,
        onChangeDateTime: function (ct, $i) {
          $i.datetimepicker('hide');
        }
      });
      $('#txtPickupTime').val('<?php echo $_SESSION["PickupTime"]; ?>' == '' ? "10:00" : '<?php echo $_SESSION["PickupTime"]; ?>');
      $('#txtReturnTime').datetimepicker({
        datepicker: false,
        mask: true,
        format: 'H:i',
        closeOnDateSelect: true,
        step: 30,
        onChangeDateTime: function (ct, $i) {
          $i.datetimepicker('hide');
        }
      });
      $('#txtReturnTime').val('<?php echo $_SESSION["ReturnTime"]; ?>' == '' ? "10:00" : '<?php echo $_SESSION["ReturnTime"]; ?>');
      var pickUpID = document.getElementById("cmbPickup").value;
      var startPickup = Math.ceil(oAPI.GetNoticePeriod(pickUpID));
      var startDropOff = eval(startPickup + '+' + oAPI.MinBookingDay(pickUpID));

      // Set Offset to init pickup and drop-off but make sure offset does not result in a sunday
      var PickUpOffset = (rcmGetDW(rcmGetdate(startPickup + 1), "d/m/Y") == 1) ? 2 : 1;
      var DropOffOffset = (rcmGetDW(rcmGetdate(startDropOff + 7), "d/m/Y") == 1) ? 8 : 7;

      $('#txtPickup').datetimepicker({
        timepicker: false,
        mask: true,
        format: 'd/m/Y',
        formatDate: 'd/m/Y',
        closeOnDateSelect: true,
        scrollInput: false,
        minDate: rcmGetdate(startPickup),
        onChangeDateTime: function (dp, $input) {
               $('#txtReturn').val(geFutureDate($input.val(), 7));
        }
      });
      $('#txtPickup').val('<?php echo $_SESSION["PickupDate"]; ?>' == '' ? rcmGetdate(startPickup + PickUpOffset) : '<?php echo $_SESSION["PickupDate"]; ?>');
      $('#txtReturn').datetimepicker({
        timepicker: false,
        mask: true,
        format: 'd/m/Y',
        formatDate: 'd/m/Y',
        closeOnDateSelect: true,
        scrollInput: false,
        minDate: rcmGetdate(startDropOff),
        onChangeDateTime: logic,
        onShow: logic
      });
      $('#txtReturn').val('<?php echo $_SESSION["ReturnDate"]; ?>' == '' ? rcmGetdate(startDropOff + DropOffOffset) : '<?php echo $_SESSION["ReturnDate"]; ?>');
      var PickUpDW = 0;
      var DropOffDW = 0;
      // Get Day of the week using function rcmGetDW(<datestring>,<format>)
      if (document.getElementById("txtPickup").value != '' && document.getElementById("txtPickup").value != '__/__/____') {
        PickUpDW = rcmGetDW(document.getElementById("txtPickup").value, "d/m/Y");
      }
      if (document.getElementById("txtReturn").value != '' && document.getElementById("txtReturn").value != '__/__/____') {
        DropOffDW = rcmGetDW(document.getElementById("txtReturn").value, "d/m/Y");
      }
      $('#txtPickupTime').datetimepicker({
        minTime: oAPI.MinTimePickup(pickUpID, PickUpDW),
        maxTime: oAPI.MaxTimePickup(pickUpID, PickUpDW)
      });
      $('#txtReturnTime').datetimepicker({
        minTime: oAPI.MinTimeDropOff(document.getElementById("cmbDropOff").value, DropOffDW),
        maxTime: oAPI.MaxTimeDropOff(document.getElementById("cmbDropOff").value, DropOffDW)
      });
    }
    function getLocations() {
      oAPI.LoadLocationsList(document.getElementById("cmbPickup"), document.getElementById("cmbDropOff"), document.getElementById("cmbAge"));
    }
    function LocUpdForm() {
      var pickUpID = document.getElementById("cmbPickup").value;
      var startPickup = Math.ceil(oAPI.GetNoticePeriod(pickUpID));
      var startDropOff = eval(startPickup + '+' + oAPI.MinBookingDay(pickUpID));
      var PickUpDW = 0;
      var DropOffDW = 0;
      // Get Day of the week using function rcmGetDW(<datestring>,<format>)
      if (document.getElementById("txtPickup").value != '' && document.getElementById("txtPickup").value != '__/__/____') {
        PickUpDW = rcmGetDW(document.getElementById("txtPickup").value, "d/m/Y");
      }
      if (document.getElementById("txtReturn").value != '' && document.getElementById("txtReturn").value != '__/__/____') {
        DropOffDW = rcmGetDW(document.getElementById("txtReturn").value, "d/m/Y");
      }

      $('#txtPickup').datetimepicker({
        minDate: rcmGetdate(startPickup)
      });
      $('#txtReturn').datetimepicker({
        minDate: rcmGetdate(startDropOff)
      });

      $('#txtPickupTime').datetimepicker({
        minTime: oAPI.MinTimePickup(pickUpID, PickUpDW),
        maxTime: oAPI.MaxTimePickup(pickUpID, PickUpDW)
      });
      $('#txtReturnTime').datetimepicker({
        minTime: oAPI.MinTimeDropOff(document.getElementById("cmbDropOff").value, DropOffDW),
        maxTime: oAPI.MaxTimeDropOff(document.getElementById("cmbDropOff").value, DropOffDW)
      });
    }
    function doSearch() {
      var test = true;
      var testmsg = "";
      var pickUpID = document.getElementById("cmbPickup").value;
      var startPickup = oAPI.GetNoticePeriod(pickUpID);
      var minDays = oAPI.MinBookingDay(pickUpID);
      var startDropOff = eval(startPickup + '+' + minDays);
      var chkPickup = rcmGetdate(startPickup);
      var chkDropOff = rcmGetdate(startDropOff);
      var chkDiff = rcmDayDiff("txtReturn", "txtPickup", "d/m/Y");
      if (chkDiff == 0 && document.getElementById("txtReturnTime").value <= document.getElementById("txtPickupTime").value) {
        test = false;
        testmsg = testmsg + "Drop off time smaller or the same as Pickup time, need to select a valid time period for rentals!\n";
      }
      if (rcmStrToDate(document.getElementById("txtPickup").value, "d/m/Y") < rcmStrToDate(chkPickup, "d/m/Y")) {
        test = false;
        testmsg = testmsg + "\nEarliest date for rental is: " + chkPickup;
        document.getElementById("txtPickup").style.borderColor = "red";
      }
      if (rcmStrToDate(document.getElementById("txtReturn").value, "d/m/Y") < rcmStrToDate(chkDropOff, "d/m/Y")) {
        test = false;
        testmsg = testmsg + "\nMinimum rental period is: " + minDays + "day(s).\nEarliest drop-off for selection is:" + chkDropOff;
        document.getElementById("txtReturn").style.borderColor = "red";
      } else if (chkDiff < minDays) {
        test = false;
        testmsg = testmsg + "\nMinimum rental period is: " + minDays + "day(s).";
        document.getElementById("txtPickup").style.borderColor = "red";
        document.getElementById("txtReturn").style.borderColor = "red";
      }
      if (rcmDayDiff("txtReturn", "txtPickup", "d/m/Y") < 0) {
        test = false;
        testmsg = "Return Date can not be smaller then Pickup Date";
        document.getElementById("txtPickup").style.borderColor = "red";
        document.getElementById("txtReturn").style.borderColor = "red";
      }
      if (test == true)
        document.getElementById("frmStep1").submit();
      else {
        $('#fat-btn').removeClass('has-spinner');
        BootstrapDialog.show({
          type: BootstrapDialog.TYPE_DANGER,
          title: 'Oops you are missing something: ',
          buttons: [{
            label: 'Close',
            cssClass: 'btn-danger',
            action: function (dialogItself) {
              dialogItself.close();
            }
          }],
          draggable: true,
          message: testmsg
        });
      }
    }
    function geFutureDate(date_input, no_of_days) {
      //debugger;
      var parts = date_input.split('/');
      //please put attention to the month (parts[0]), Javascript counts months from 0:
      // January - 0, February - 1, etc
      //YYYY-MM-DD
      var mydate = new Date(parts[2], parts[1]-1, parts[0]);
      var from_date = mydate;
      var time_after_7_days = new Date(from_date).setDate(from_date.getDate() + no_of_days);
      return convertDate(new Date(time_after_7_days));
    }
    function convertDate(inputFormat) {
      function pad(s) { return (s < 10) ? '0' + s : s; }
      var d = new Date(inputFormat);
      return [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/');
    }

    var logic = function (currentDateTime) {
      // 'this' is jquery object datetimepicker
      //debugger;
      this.setOptions({
        minDate: geFutureDate($('#txtPickup').val(), 1)//rcmGetdate(startDropOff)
      });
    };
  </script>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>:: Web API Step 1/5 ::</title>
  <!-- CSS -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
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
        <a class="navbar-brand" href="index.php"><img src="images/logo.gif" alt="" id="logo" /></a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <!--<div class="collapse navbar-collapse" id="top-navbar-1">
        <ul class="nav navbar-nav navbar-right">
          <li>
            .. navigation
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
              <div id="progress-bar-steps">
                <div class="progress-bar-step current">
                  <div class="step_number">1</div>
                  <div class="step_name">Request</div>
                </div>
                <div class="progress-bar-step">
                  <div class="step_number">2</div>
                  <div class="step_name">Select</div>
                </div>
                <div class="progress-bar-step">
                  <div class="step_number">3</div>
                  <div class="step_name">Extras</div>
                </div>
                <div class="progress-bar-step">
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
        <div class="row"><div class="col-sm-12">&nbsp;</div></div>
        <div class="row">

          <div class="col-sm-5 form-box">
            <div class="form-bottom">
              <form id="frmStep1" role="form" name="frmStep1" action="step2.php" method="post"class="registration-form">
                <div class="form-group">
                  <label class="" for="form-Pickup-Location">Pickup Location</label>
                  <select id="cmbPickup" name="form-Pickup-Location" placeholder="Pickup Location..." class="form-Pickup-Location form-control">
                    <!--<option value="" disabled selected>Select your Pickup Location</option>-->
                  </select>
                </div>
                <div class="row">
                  <div class="form-group col-sm-7">
                    <label class="" for="form-Pickup-Date">Pickup Date</label>
                    <input type="text" name="form-Pickup-Date" placeholder="Pickup-Date..." class="form-Pickup-Date form-control" id="txtPickup" autocomplete="off">
                  </div>
                  <div class="form-group col-sm-5">
                    <label class="" for="form-Pickup-Time">Pickup Time</label>
                    <input type="text" name="form-Pickup-Time" placeholder="Pickup-Time..." class="form-Pickup-Time form-control" id="txtPickupTime" autocomplete="off">
                  </div>
                </div>
                <div class="form-group">
                  <label class="" for="form-Dropoff-Location">Dropoff Location</label>
                  <select id="cmbDropOff" name="form-Dropoff-Location" placeholder="Dropoff Location..." class="form-Dropoff-Location form-control">
                    <!--<option value="" disabled selected>Select your  Dropoff Location</option>-->
                  </select>
                </div>
                <div class="row">
                  <div class="form-group col-sm-7">
                    <label class="" for="form-Dropoff-Date">Dropoff Date</label>
                    <input type="text" name="form-Dropoff-Date" placeholder="Dropoff-Date..." class="form-Dropoff-Date form-control" id="txtReturn" autocomplete="off">
                  </div>
                  <div class="form-group col-sm-5">
                    <label class="" for="form-Dropoff-Time">Dropoff Time</label>
                    <input type="text" name="form-Dropoff-Time" placeholder="Dropoff-Time..." class="form-Dropoff-Time form-control" id="txtReturnTime" autocomplete="off">
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-sm-7">
                    <label class="" for="form-Category-Type">Category Type</label>
                    <select id="cmbCatType" name="form-Category-Type" placeholder="Category Type..." class="form-Category-Type form-control">
                    </select>
                  </div>
                  <div class="form-group col-sm-5">
                    <label class="" for="form-Minimum-Age">Minimum Age</label>
                  <input type="radio" name="form-Minimum-Age1" value="8" onclick="document.getElementById('cmbAge').value=this.value"/>
                  <input type="radio" name="form-Minimum-Age1" value="9" checked="checked" onclick="document.getElementById('cmbAge').value=this.value"/>  
                  
                  <input type='hidden1' name="form-Minimum-Age"  id='cmbAge' value='9'>
                 
                  <?php /*<select id="cmbAge" name="form-Minimum-Age" placeholder="Minimum-Age..." class="form-Minimum-Age form-control" onchange="getLocations()"> </select> */ ?>
                    </div>
                  <div class="form-group col-sm-12">
                    <input type="text" name="form-Promo-Code" placeholder="Promo-Code if any..." class="form-Promo-Code form-control" id="txtPromoCode" autocomplete="off">
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-sm-12 text-right">
                    <button type="button" id="fat-btn" class="btn has-spinner" data-loading-text="loading..." onclick="doSearch()"><span class="spinner"><i class="fa fa-refresh fa-spin"></i></span>&nbsp;Continue</button>
                  </div>
                </div>
                <input type='hidden' name='choosetext' id='choosetext' value='Check the following entries:'>
                <input type='hidden' name='refid' id='refid' value='<?php echo $_SESSION['api']["refid"]; ?>'>
              </form>
            </div>
          </div>
          <div class="col-sm-7">
            &nbsp;
          </div>
        </div>
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
  <script>
    /*
    if (window.matchMedia('(max-width: 1199px)').matches) {
      //alert('Again Here!!');
      $(".step_name").each(function () {
        if ($(this).text() == "Request") {
          $(this).text('Request');
        }
        if ($(this).text() == "Select") {
          $(this).text('Choose');
        }
        if ($(this).text() == "Extras") {
          $(this).text('Extras');
        }
        if ($(this).text() == "Review & Book") {
          $(this).text('Book');
        }
      });
    }*/
  </script>
</body>
</html>
