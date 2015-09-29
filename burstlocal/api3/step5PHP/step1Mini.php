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
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>:: Web API Step 1/4 ::</title>
  <!-- CSS -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/form-elements.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link href="assets/css/MiniStyle.css" rel="stylesheet" type="text/css" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <base target="_parent" />
</head>
<body>
  <!-- Top content -->
        <div class="row">
          <div class="col-sm-3 form-box">
            <div class="form-bottom">
              <form id="frmStep1" role="form" name="frmStep1" action="step2.php" method="post"class="registration-form">
                <div class="form-group">
                  <label class="" for="form-Pickup-Location">Pickup Location</label>
                  <select id="cmbPickup" name="form-Pickup-Location" placeholder="Pickup Location..." class="form-Pickup-Location form-control">
                    <!--<option value="" disabled selected>Select your Pickup Location</option>-->
                  </select>
                </div>
                <div class="row">
                  <div class="form-group col-xs-7">
                    <label class="" for="form-Pickup-Date">Pickup Date</label>
                    <input type="text" name="form-Pickup-Date" placeholder="Pickup-Date..." class="form-Pickup-Date form-control" id="txtPickup" autocomplete="off">
                  </div>
                  <div class="form-group col-xs-5">
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
                  <div class="form-group col-xs-7">
                    <label class="" for="form-Dropoff-Date">Dropoff Date</label>
                    <input type="text" name="form-Dropoff-Date" placeholder="Dropoff-Date..." class="form-Dropoff-Date form-control" id="txtReturn" autocomplete="off">
                  </div>
                  <div class="form-group col-xs-5">
                    <label class="" for="form-Dropoff-Time">Dropoff Time</label>
                    <input type="text" name="form-Dropoff-Time" placeholder="Dropoff-Time..." class="form-Dropoff-Time form-control" id="txtReturnTime" autocomplete="off">
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-xs-7">
                    <label class="" for="form-Category-Type">Category Type</label>
                    <select id="cmbCatType" name="form-Category-Type" placeholder="Category Type..." class="form-Category-Type form-control">
                    </select>
                  </div>
                  <div class="form-group col-xs-5">
                    <label class="" for="form-Minimum-Age">Driver Age</label>
                    <select id="cmbAge" name="form-Minimum-Age" placeholder="Minimum-Age..." class="form-Minimum-Age form-control"></select>
                  </div>
                  <div class="form-group col-xs-12">
                    <input type="text" name="form-Promo-Code" placeholder="Promo-Code if any..." class="form-Promo-Code form-control" id="txtPromoCode" autocomplete="off">
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-xs-12 text-right">
                    <button type="button" id="fat-btn" class="btn has-spinner" data-loading-text="loading..." onclick="doSearch()"><span class="spinner"><i class="fa fa-refresh fa-spin"></i></span>&nbsp;Continue</button>
                  </div>
                </div>
                <input type='hidden' name='choosetext' id='choosetext' value='Check the following entries:'>
                <input type='hidden' name='refid' id='refid' value='<?php echo $_SESSION["refid"]; ?>'>
              </form>
            </div>
          </div>
        </div>
  <script src="include/jquery.js"></script>
  <script src="include/jquery.datetimepicker.js"></script>
  <script src="https://demo.rentalcarmanager.com/api/3.0/main" type="text/javascript"></script>
  <script type="text/javascript">
    var oAPI = new rcmAPI();

    $(document).ready(function () {

      var maxWidth = Math.max.apply(null, $(window).map(function () {
        return $(this).outerWidth(true);
      }).get());
      //alert(maxWidth);
      oAPI.OnReadyStep1(DisplStep1);
      oAPI.OnLocationChange(LocUpdForm);
      oAPI.GetStep1();

      $('#fat-btn').click(function () {
        //debugger;
        //$(this).text('loading.');
        $(this).addClass('btn-danger');
        $(this).toggleClass('active');
      });

    })

    function DisplStep1() {
      oAPI.LoadCategoryType(document.getElementById("cmbCatType"), '<?php echo $_SESSION["CategoryTypeID"]; ?>');
      oAPI.LoadAgeList(document.getElementById("cmbAge"), '<?php echo $_SESSION["Age"]; ?>');
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
      // Save New Values
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
        //btn has-spinner btn-danger active
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
      var mydate = new Date(parts[2], parts[1] - 1, parts[0]);
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
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <!-- For dialog -->
  <script src="assets/prettify/run_prettify.js"></script>
  <link href="assets/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
  <script src="assets/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
  <!-- For dialog ends -->

</body>
</html>
