<?php
	if (!isset($_SESSION['CategoryTypeID'])) $_SESSION["CategoryTypeID"] = "";
	if (!isset($_SESSION['PickupLocationID'])) $_SESSION["PickupLocationID"] = "";
	if (!isset($_SESSION['DropOffLocationID'])) $_SESSION["DropOffLocationID"] = "";
	if (!isset($_SESSION['PickupDate'])) $_SESSION["PickupDate"] = "";
	if (!isset($_SESSION['PickupTime'])) $_SESSION["PickupTime"] = "";
	if (!isset($_SESSION['ReturnDate'])) $_SESSION["ReturnDate"] = "";
	if (!isset($_SESSION['ReturnTime'])) $_SESSION["ReturnTime"] = "";
	if (!isset($_SESSION['Age'])) $_SESSION["Age"] = "";
	if (!isset($_SESSION['PromoCode'])) $_SESSION["PromoCode"] = "";
	if (!isset($_SESSION['refid'])) $_SESSION["refid"] = "";

	if (isset($_POST["form-Category-Type"])) $_SESSION["CategoryTypeID"] = $_POST["form-Category-Type"];
	if (isset($_POST["form-Pickup-Location"])) $_SESSION["PickupLocationID"] = $_POST["form-Pickup-Location"];
	if (isset($_POST["form-Dropoff-Location"])) $_SESSION["DropOffLocationID"] = $_POST["form-Dropoff-Location"];
	if (isset($_POST["form-Pickup-Date"])) $_SESSION["PickupDate"] = $_POST["form-Pickup-Date"];
	if (isset($_POST["form-Pickup-Time"])) $_SESSION["PickupTime"] = $_POST["form-Pickup-Time"];
	if (isset($_POST["form-Dropoff-Date"])) $_SESSION["ReturnDate"] = $_POST["form-Dropoff-Date"];
	if (isset($_POST["form-Dropoff-Time"])) $_SESSION["ReturnTime"] = $_POST["form-Dropoff-Time"];
	if (isset($_POST["form-Minimum-Age"]))  $_SESSION["Age"] = $_POST["form-Minimum-Age"];
	if (isset($_POST["PromoCode"]))  $_SESSION["PromoCode"] = $_POST["PromoCode"];
	if (isset($_POST["refid"]))  $_SESSION["refid"] = $_POST["refid"];
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <script src="include/jquery.js"></script>
  <link type="text/css" href="assets/css/Extra.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="include/jquery.datetimepicker.css" />
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <script type="text/javascript">
    //paste this code under head tag or in a seperate js file.
    // Wait for window load
    $(window).load(function () {
      // Animate loader off screen
      $(".se-pre-con").fadeOut("slow");
    });
  </script>

	<script src="include/jquery.datetimepicker.js"></script>
	<script src="include/form_validation.js"></script>
	<script src="https://demo.rentalcarmanager.com/api/3.0/main" type="text/javascript"></script>
	<script type="text/javascript">
		var minDays;
		var frmvalidator;
		var getDetails = 0;
		var oAPI = new rcmAPI();
	
		$(document).ready(function () {
			oAPI.OnReadyStep2(DisplStep2);
			oAPI.OnLocationChange(LocUpdForm);
			oAPI.GetStep2(
					document.getElementById("CategoryTypeID").value,
					document.getElementById("PickupLocationID").value,
					document.getElementById("PickupDate").value,
					document.getElementById("PickupTime").value,
					document.getElementById("DropOffLocationID").value,
					document.getElementById("ReturnDate").value,
					document.getElementById("ReturnTime").value,
					document.getElementById("Age").value,
					document.getElementById("PromoCode").value,
					getDetails
			);
			$(".clickme").click(function () {
				$("#displInfo").slideToggle("200", function () {
					// Animation complete.
				});
			});
		})

		function DisplStep2() {
			$(".se-pre-con").fadeOut("slow");
			oAPI.LoadCategoryType(document.getElementById("cmbCatType"), document.getElementById("CategoryTypeID").value, "Select a Vehicle Type...");
			oAPI.LoadAgeList(document.getElementById("cmbAge"), document.getElementById("Age").value);
			oAPI.LoadLocationsList(document.getElementById("cmbPickup"), document.getElementById("cmbDropOff"),   document.getElementById("cmbAge"), document.getElementById("PickupLocationID").value, document.getElementById("DropOffLocationID").value, "Select Location..", "Select Location..");

			var out = "";
			var subtotal = 0.0;
			var total = 0.0;
			var LocID = document.getElementById("cmbPickup").value;
			var SizeID = 0;
			var LocAvailable = true;
			var LocAvailableMsg = oAPI.CheckLocationAvailable();
			if (LocAvailableMsg != '') LocAvailable = false;
			document.getElementById("displmsg").innerHTML = LocAvailableMsg;
			if (LocAvailable == false) {
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
						message: LocAvailableMsg
					});
			}

			for (var i = 0; i < rcmAvailableCars.length; ++i) {
				CarAvailable = true;
				if (rcmAvailableCars[i]["available"] == '0') CarAvailable = false;
				SizeID = rcmAvailableCars[i]["carsizeid"];
				subtotal = parseFloat(rcmAvailableCars[i]["total"]).toFixed(2);
				numofdays = parseInt(rcmAvailableCars[i]["numofdays"]);
				out = out + "<div class='row topdiv TopPad'>"
				out = out + "<div class='col-sm-12 text-center'>";
				out = out + "<div class='col-sm-3 text-center'>";
				out = out + "<div class='vehicleThumbnail verticalMiddle'>";
				out = out + "<div class='row'><div class='col-sm-12 text-center'><img src='" + rcmAvailableCars[i]["imagename"] + "' class='img-responsive' alt='' /></div></div>";
				out = out + "<div class='row'><div class='col-sm-12 text-center'>";
				out = out + "<i class='fa fa-child fa-2'></i>x" + rcmAvailableCars[i]["noadults"];
				out = out + "&nbsp;&nbsp;<i class='fa fa-child'></i>x" + rcmAvailableCars[i]["nochildren"];
				out = out + "&nbsp;&nbsp;<i class='fa fa-briefcase fa-2'></i>x" + rcmAvailableCars[i]["nolargecase"];
				out = out + "&nbsp;&nbsp;<i class='fa fa-briefcase'></i>x" + rcmAvailableCars[i]["nosmallcase"];
				out = out + "</div></div>";
				out = out + "</div>"; //vehicleThumbnail
				out = out + "</div>"; //col-sm-3
				out = out + "<div class='col-sm-6  text-left'>";
				out = out + "<span class='vehicle-title DescText'>" + rcmAvailableCars[i]["categoryfriendlydescription"] + "</span>";
				if (LocAvailable == true && CarAvailable == true) {
					out = out + "<p class='text-success'><span class='glyphicon glyphicon-ok'></span><strong>AVAILABLE</strong></p>";
				}
				if (rcmAvailableCars[i]["numofdays"] > 0) {
					out = out + "<p class='RemovePadding_p'><span class=''>" + rcmAvailableCars[i]["numofdays"] + "</span> Rental Days | Daily Rate $" + parseFloat(rcmAvailableCars[i]["avgrate"]).toFixed(2) + "</p>"; //" | Total  $" + parseFloat(parseFloat(rcmAvailableCars[i]["avgrate"]) * parseFloat(rcmAvailableCars[i]["numofdays"])).toFixed(2) + 
				} else {
					out = out + "<p class='RemovePadding_p'>" + " [" + rcmAvailableCars[i]["numofhours"] + " hours] |  Hourly Rate $" + parseFloat(rcmAvailableCars[i]["totrate"]).toFixed(2) + "</p>";
				}
				if (rcmAvailableCars[i]["totaldiscount"] > 0) {
					out = out + "<p class='RemovePadding_p'><span class='glyphicon glyphicon-minus'></span>&nbsp;Discounts: <span class=''>$" + parseFloat(rcmAvailableCars[i]["totaldiscount"]).toFixed(2) + "</span></p>";
				}
				// FreeDays
				if (rcmAvailableCars[i]["freedays"] > 0) {
					out = out + "<p class='RemovePadding_p'><span class=''>You qualify for " + rcmAvailableCars[i]["freedays"] + " Free day(s) special</span>" + "</p>";
					subtotal = subtotal - parseFloat(rcmAvailableCars[i]["avgrate"]) * parseFloat(rcmAvailableCars[i]["freedays"]);
				}
				// Relocation Fees
				if (rcmAvailableCars[i]["relocfee"] > 0) {
					out = out + "<p class='RemovePadding_p'>Relocation Fee: $" + parseFloat(rcmAvailableCars[i]["relocfee"]).toFixed(2) + "</p>";
					subtotal = parseFloat(subtotal) + parseFloat(rcmAvailableCars[i]["relocfee"]);
				}
				// unattendedfee and afterhourfees
				for (j in rcmLocationFees) {
					if (rcmLocationFees[j]["unattendedfee"] > 0) {
						out = out + "<p class='RemovePadding_p'>Unattended Dropoff Fee [" + rcmLocationFees[j]["location"] + "]: $" + parseFloat(rcmLocationFees[j]["unattendedfee"]).toFixed(2) + "</p>";
						subtotal = parseFloat(subtotal) + parseFloat(rcmLocationFees[j]["unattendedfee"]);
					}
					if (rcmLocationFees[j]["afterhourfee"] > 0) {
						out = out + "<p class='RemovePadding_p'>Afterhour Fee [" + rcmLocationFees[j]["location"] + "]: $" + parseFloat(rcmLocationFees[j]["afterhourfee"]).toFixed(2) + "</p>";
						subtotal = parseFloat(subtotal) + parseFloat(rcmLocationFees[j]["afterhourfee"]);
					}
				}
				total = parseFloat(subtotal);
				// Medatory Extra Fees
				for (j in rcmMandatoryFees) {
					if ((rcmMandatoryFees[j]["locationid"] == LocID || rcmMandatoryFees[j]["locationid"] == "0") && (rcmMandatoryFees[j]["vehiclesizeid"] == SizeID || rcmMandatoryFees[j]["vehiclesizeid"] == "0")) {
						if (rcmMandatoryFees[j]["type"] == "Daily") {
							out = out + "<p class='RemovePadding_p'><span class='glyphicon glyphicon-plus-sign'></span>&nbsp;" + rcmMandatoryFees[j]["name"] + " @ $" + parseFloat(rcmMandatoryFees[j]["fees"]).toFixed(2) + " Per Day: $" + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"])).toFixed(2) + "</p>";
							total = parseFloat(total) + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"]));
							subtotal = parseFloat(subtotal) + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"]));
						} else if (rcmMandatoryFees[j]["type"] == "Percentage") {
							out = out + "<p class='RemovePadding_p'><span class='glyphicon glyphicon-plus-sign'></span>&nbsp;" + "$" + (subtotal * parseFloat(rcmMandatoryFees[j]["fees"]) / 100).toFixed(2) + " FOR " + rcmMandatoryFees[j]["name"]  + "</p>";
							total = parseFloat(total) + parseFloat(subtotal) * parseFloat(rcmMandatoryFees[j]["fees"]) / 100;
						} else {
							out = out + "<p class='RemovePadding_p'><span class='glyphicon glyphicon-plus-sign'></span>&nbsp; " + " $" + parseFloat(rcmMandatoryFees[j]["fees"]).toFixed(2) + " FOR " + rcmMandatoryFees[j]["name"] + "</p>";
							total = parseFloat(total) + parseFloat(rcmMandatoryFees[j]["fees"]);
							subtotal = parseFloat(subtotal) + parseFloat(rcmMandatoryFees[j]["fees"]);
						}
					}
				}
				out = out + "</div>"; // Web-desc Div
				out = out + "<div class='col-sm-3 verticalMiddle'>";
				if (LocAvailable == true && CarAvailable == true) {
					out = out + "<div class='row'><div class='col-sm-12 col-xs-7 text-right' id='totalCostFinal'><span class='results-price'> TOTAL &nbsp; $" + parseFloat(total).toFixed(2) + "</span></div>";
					if (rcmAvailableCars[i]["available"] == '2') out = out + "<div class='row'><div class='col-sm-12'><span class='red'>" + rcmAvailableCars[i]["availablemsg"] + "</span></div></div>";
					out = out + "<div class='col-sm-12 col-xs-5 text-right' Id='dvbooknow'><button class='btn' onclick='booknow(" + rcmAvailableCars[i]["carrateid"] + "," + rcmAvailableCars[i]["carsizeid"] + ")'><span class='glyphicon glyphicon-ok'></span>&nbsp;Select</button></div></div>";
				} else if (CarAvailable == false) {
					out = out + "<div class='row'><div class='col-sm-12'><span class='red'>" + rcmAvailableCars[i]["availablemsg"] + "</span>" + "</div></div>";
				}
				out = out + "</div>";
				out = out + "</div>"; //col-sm-12 where background
				out = out + "</div>"; // New row class inside loop
			}
			document.getElementById("availablecars").innerHTML = out;
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
			if (document.getElementById("txtPickupTime").value == '__:__') $('#txtPickupTime').val("10:00");
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
			if (document.getElementById("txtReturnTime").value == '__:__') $('#txtReturnTime').val("10:00");

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
				scrollInput: false,
				closeOnDateSelect: true,
				minDate: rcmGetdate(startPickup)
			});
			if (document.getElementById("txtPickup").value == '__/__/____' && '<?php echo $_SESSION["PickupDate"]; ?>' == '') $('#txtPickup').val(rcmGetdate(startPickup + PickUpOffset));
			$('#txtReturn').datetimepicker({
				timepicker: false,
				mask: true,
				format: 'd/m/Y',
				formatDate: 'd/m/Y',
				scrollInput: false,
				closeOnDateSelect: true,
				minDate: rcmGetdate(startDropOff)
			});
			if (document.getElementById("txtReturn").value == '__/__/____' && '<?php echo $_SESSION["ReturnDate"]; ?>' == '') $('#txtReturn').val(rcmGetdate(startDropOff + DropOffOffset));
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
			window.location.href = "#results";
		}
		// End function DisplStep2

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
		function DoRefresh() {
			$('#Imhere').removeClass('Addborder');
			// Save New Values
			var test = true;
			var testmsg = "";
			var pickUpID = document.getElementById("cmbPickup").value;

			var startPickup = oAPI.GetNoticePeriod(pickUpID);
			minDays = oAPI.MinBookingDay(pickUpID);
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
			if (document.getElementById("cmbCatType").value == "") {
				test = false;
				testmsg = testmsg + "Please select a Valid Vehicle Type!\n";
				document.getElementById("cmbCatType").style.borderColor = "red";
			}
			if (document.getElementById("cmbAge").value == "") {
				test = false;
				testmsg = testmsg + "Please select a Valid Youngest Driver Age!\n";
				document.getElementById("cmbAge").style.borderColor = "red";
			}
			if (test == true) {
				$("form").each(function () {
					$(this).find(':input').css('borderColor', ''); //<-- Should return all input elements in that specific form.
				});
				document.getElementById("CategoryTypeID").value = document.getElementById("cmbCatType").value;
				document.getElementById("PickupLocationID").value = document.getElementById("cmbPickup").value;
				document.getElementById("PickupDate").value = document.getElementById("txtPickup").value;
				document.getElementById("PickupTime").value = document.getElementById("txtPickupTime").value;
				document.getElementById("DropOffLocationID").value = document.getElementById("cmbDropOff").value;
				document.getElementById("ReturnDate").value = document.getElementById("txtReturn").value;
				document.getElementById("ReturnTime").value = document.getElementById("txtReturnTime").value;
				document.getElementById("Age").value = document.getElementById("cmbAge").value;

				oAPI.GetStep2(
							document.getElementById("CategoryTypeID").value,
							document.getElementById("PickupLocationID").value,
							document.getElementById("PickupDate").value,
							document.getElementById("PickupTime").value,
							document.getElementById("DropOffLocationID").value,
							document.getElementById("ReturnDate").value,
							document.getElementById("ReturnTime").value,
							document.getElementById("Age").value,
							document.getElementById("PromoCode").value,
							getDetails
				);
			} else {
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
			};
		}
		function booknow(rateid, sizeid) {
			// Save New Values
			document.getElementById("RateID").value = rateid;
			document.getElementById("CarSizeID").value = sizeid;
			document.getElementById("CategoryTypeID").value = document.getElementById("cmbCatType").value;
			document.getElementById("PickupLocationID").value = document.getElementById("cmbPickup").value;
			document.getElementById("PickupDate").value = document.getElementById("txtPickup").value;
			document.getElementById("PickupTime").value = document.getElementById("txtPickupTime").value;
			document.getElementById("ReturnDate").value = document.getElementById("txtReturn").value;
			document.getElementById("ReturnTime").value = document.getElementById("txtReturnTime").value;
			document.getElementById("Age").value = document.getElementById("cmbAge").value;
			document.getElementById("frmStep2").submit();
		}
		function showInfo(mode) {
			if (mode == 0)
				document.getElementById("displInfo").style.display = "none";
			else
				document.getElementById("displInfo").style.display = "";
		}
	</script>  

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>:: Web API Step 2/4 ::</title>
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
        <a class="navbar-brand" href="index.php"><img src="images/logo.gif" alt="" id="logo" /></a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <!--<div class="collapse navbar-collapse" id="top-navbar-1">
        <ul class="nav navbar-nav navbar-right">
          <li>
            .. navigation content
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
                <div class="progress-bar-step done" id="Imhere">
                  <a href="Index.php">
                  <div class="step_number">1</div>
                  <div class="step_name">Request</div></a>
                </div>
                <div class="progress-bar-step current">
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
        <div class="row"><div class="col-sm-12 form-box"><p class="bg-error" id='1displmsg'></p></div></div>
        <div class="row">
          <div class="col-sm-12 form-box">
            <div class="form-bottom">
              <form id="frmStep2" role="form" name="frmStep2" action="step3.php" method="post">
                <div class="row">
                  <div class="col-sm-2 margin0">
                    <label class="col-sm-12 margin0" for="form-Pickup-Date">Pickup: </label>
                  </div>
                  <div class="col-sm-3 margin0">
                    <select id="cmbPickup" name="form-Pickup-Location" class="col-sm-12 form-control"></select>
                  </div>
                  <div class="col-sm-2 margin0">
                    <label class="col-sm-12 margin0" for="form-Pickup-Date">Date & Time: </label>
                  </div>
                  <div class="col-sm-3 margin0">
                    <input type="text" name="form-Pickup-Date" value='<?php echo $_SESSION["PickupDate"]; ?>' placeholder="Pickup-Date..." class="form-control col-sm-12" id="txtPickup" autocomplete="off">
                  </div>
                  <div class="col-sm-2 margin0">
                    <input type="text" name="form-Pickup-Time" value='<?php echo $_SESSION["PickupTime"]; ?>' placeholder="Pickup-Time..." class="form-control col-sm-12" id="txtPickupTime" autocomplete="off">
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-2 margin0">
                    <label class="col-sm-12 margin0" for="form-Dropoff-Location">Return: </label>
                  </div>
                  <div class="col-sm-3 margin0">
                    <select id="cmbDropOff" name="form-Dropoff-Location" class="col-sm-12 form-control"></select>
                  </div>
                  <div class="col-sm-2 margin0">
                    <label class="col-sm-12 margin0" for="form-Dropoff-Date">Date & Time: </label>
                  </div>
                  <div class="col-sm-3 margin0">
                    <input type="text" name="form-Dropoff-Date" value='<?php echo $_SESSION["ReturnDate"]; ?>'  placeholder="Dropoff-Date..." class="form-control col-sm-12" id="txtReturn" autocomplete="off">
                  </div>
                  <div class="col-sm-2 margin0">
                    <input type="text" name="form-Dropoff-Time" value='<?php echo $_SESSION["ReturnTime"]; ?>' placeholder="Dropoff-Time..." class="form-control col-sm-12" id="txtReturnTime" autocomplete="off">
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-2 margin0">
                    <label class="col-sm-12 margin0" for="form-Category-Type">Vehicle Type: </label>
                  </div>
                  <div class="col-sm-3 margin0">
                    <select id="cmbCatType" name="form-Category-Type" class="col-sm-12 form-control">
                      <!--<option value="" disabled selected>Select your Pickup Location</option>-->
                    </select>
                  </div>
                  <div class="col-sm-2 margin0">
                    <label class="col-sm-12 margin0" for="form-Minimum-Age">Driver Age (min): </label>
                  </div>
                  <div class="col-sm-2 margin0">
                    <select id="cmbAge" name="form-Minimum-Age" class="col-sm-12 form-control" onchange="getLocations()">
                      <!--<option value="" disabled selected>Select your Pickup Location</option>-->
                    </select>
                  </div>
                  <div class="col-sm-3 text-right">
                    <button type="button" class="btn btn-primary btn-xs" onclick="DoRefresh()">Continue!</button></div>
                </div>
                <input type="hidden" name='CategoryTypeID' id='CategoryTypeID' value='<?php echo $_SESSION["CategoryTypeID"]; ?>'>
                <input type='hidden' name='PickupLocationID' id='PickupLocationID' value='<?php echo $_SESSION["PickupLocationID"]; ?>'>
                <input type='hidden' name='DropOffLocationID' id='DropOffLocationID' value='<?php echo $_SESSION["DropOffLocationID"]; ?>'>
                <input type='hidden' name='PickupDate' id='PickupDate' value='<?php echo $_SESSION["PickupDate"]; ?>'>
                <input type='hidden' name='PickupTime' id='PickupTime' value='<?php echo $_SESSION["PickupTime"]; ?>'>
                <input type='hidden' name='ReturnDate' id='ReturnDate' value='<?php echo $_SESSION["ReturnDate"]; ?>'>
                <input type='hidden' name='ReturnTime' id='ReturnTime' value='<?php echo $_SESSION["ReturnTime"]; ?>'>
                <input type='hidden' name='Age' id='Age' value='<?php echo $_SESSION["Age"]; ?>'>
                <input type='hidden' name='PromoCode' id='PromoCode' value='<?php echo $_SESSION["PromoCode"]; ?>'>
                <input type='hidden' name='RateID' id='RateID' value=''>
                <input type='hidden' name='CarSizeID' id='CarSizeID' value=''>
                <input type='hidden' name='refid' id='refid' value='<?php echo $_SESSION["refid"]; ?>'>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class='container form-box'>
        <div class="row"><div class="col-sm-12 form-box"><p class="bg-error" id='displmsg'></p></div></div>
        <div class="row">
          <div class="col-sm-12 form-box">
			<a name="results"></a>
            <div id="availablecars" class='col-sm-12 form-bottom'></div>
          </div>
        </div>
        <div class="row"><div class="col-sm-12">&nbsp;</div></div>


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
