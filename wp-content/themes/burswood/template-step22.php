<?php 
    /* Template Name: step22 */
    session_start();
    if (isset($_POST["form-Category-Type"])) $_SESSION['api']["CategoryTypeID"] = $_POST["form-Category-Type"];
    if (isset($_POST["form-Pickup-Location"])) $_SESSION['api']["PickupLocationID"] = $_POST["form-Pickup-Location"];
    if (isset($_POST["form-Dropoff-Location"])) $_SESSION['api']["DropOffLocationID"] = $_POST["form-Dropoff-Location"];
    if (isset($_POST["form-Pickup-Date"])) $_SESSION['api']["PickupDate"] = $_POST["form-Pickup-Date"];
    if (isset($_POST["form-Pickup-Time"])) $_SESSION['api']["PickupTime"] = $_POST["form-Pickup-Time"];
    if (isset($_POST["form-Dropoff-Date"])) $_SESSION['api']["ReturnDate"] = $_POST["form-Dropoff-Date"];
    if (isset($_POST["form-Dropoff-Time"])) $_SESSION['api']["ReturnTime"] = $_POST["form-Dropoff-Time"];
    if (isset($_POST["form-Minimum-Age"]))  $_SESSION['api']["Age"] = $_POST["form-Minimum-Age"];
    if (isset($_POST["PromoCode"]))  $_SESSION['api']["PromoCode"] = $_POST["PromoCode"];
    if (isset($_POST["refid"]))  $_SESSION['api']["refid"] = $_POST["refid"];
    get_header(); 
?>
<script type="text/javascript">
    $(window).load(function () {
        $(".se-pre-con").fadeOut("slow");
    });
  </script>
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
            //oAPI.LoadAgeList(document.getElementById("cmbAge"), document.getElementById("Age").value);
            oAPI.LoadLocationsList(document.getElementById("cmbPickup"), document.getElementById("cmbDropOff"), document.getElementById("cmbAge"), document.getElementById("PickupLocationID").value, document.getElementById("DropOffLocationID").value, "Select Location..", "Select Location..");

            var out = "";
            var subtotal = 0.0;
            var total = 0.0;
            var LocID = document.getElementById("cmbPickup").value;
            var SizeID = 0;
            var LocAvailable = true;
            var LocAvailableMsg = oAPI.CheckLocationAvailable();
            if (LocAvailableMsg != '')
                LocAvailable = false;
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
                if (rcmAvailableCars[i]["available"] == '0')
                    CarAvailable = false;
                SizeID = rcmAvailableCars[i]["carsizeid"];
                subtotal = parseFloat(rcmAvailableCars[i]["total"]).toFixed(2);
                numofdays = parseInt(rcmAvailableCars[i]["numofdays"]);
                out = out + "<div class='car-title'>";
                out = out + "<span class='vehicle-title DescText'>" + rcmAvailableCars[i]["categoryfriendlydescription"] + "</span>";
                out = out + "</div>";
                out = out + "<div class='row topdiv TopPad' style='border-radius: 0px;border-bottom:0;'>"
                out = out + "<div class='col-sm-12 car-title-detals text-center'>";
                out = out + "<div class='col-sm-4 text-center'>";
                out = out + "<div class='vehicleThumbnail verticalMiddle'>";
                out = out + "<img src='" + rcmAvailableCars[i]["imagename"] + "' class='img-responsive' alt='' />";
               
                out = out + "</div>"; //vehicleThumbnail
                out = out + "</div>"; //col-sm-3
                out = out + "<div class='col-sm-8  text-left'>";
                
                // if (LocAvailable == true && CarAvailable == true) {
                //     out = out + "<p class='text-success'><span class='glyphicon glyphicon-ok'></span><strong>AVAILABLE</strong></p>";
                // }
                if (rcmAvailableCars[i]["numofdays"] > 0) {
                    out = out + "<div class='RemovePadding_p price'><mark> <sup>$ </sup>" + parseFloat(rcmAvailableCars[i]["avgrate"]).toFixed(2) + "</mark><div class='pd'><strong>Per Day </strong><span class=''>(For " + rcmAvailableCars[i]["numofdays"] + " Days)</span></div></div>"; //" | Total  $" + parseFloat(parseFloat(rcmAvailableCars[i]["avgrate"]) * parseFloat(rcmAvailableCars[i]["numofdays"])).toFixed(2) + 
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
                            out = out + "<p class='RemovePadding_p'><span class='glyphicon glyphicon-ok'></span>&nbsp;" + rcmMandatoryFees[j]["name"] + " @ $" + parseFloat(rcmMandatoryFees[j]["fees"]).toFixed(2) + " Per Day: $" + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"])).toFixed(2) + "</p>";
                            total = parseFloat(total) + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"]));
                            subtotal = parseFloat(subtotal) + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"]));
                        } else if (rcmMandatoryFees[j]["type"] == "Percentage") {
                            out = out + "<p class='RemovePadding_p'><span class='glyphicon glyphicon-ok'></span>&nbsp;" + "$" + (subtotal * parseFloat(rcmMandatoryFees[j]["fees"]) / 100).toFixed(2) + " FOR " + rcmMandatoryFees[j]["name"] + "</p>";
                            total = parseFloat(total) + parseFloat(subtotal) * parseFloat(rcmMandatoryFees[j]["fees"]) / 100;
                        } else {
                            out = out + "<p class='RemovePadding_p'><span class='glyphicon glyphicon-ok'></span>&nbsp; " + " $" + parseFloat(rcmMandatoryFees[j]["fees"]).toFixed(2) + " FOR " + rcmMandatoryFees[j]["name"] + "</p>";
                            total = parseFloat(total) + parseFloat(rcmMandatoryFees[j]["fees"]);
                            subtotal = parseFloat(subtotal) + parseFloat(rcmMandatoryFees[j]["fees"]);
                        }
                    }
                }
                out = out + "</div></div>"; // Web-desc Div
                 out = out + "<div class='col-sm-1 step2_space'>&nbsp;</div><div class='col-sm-4 text-center verticalMiddle noperson'>";
                out = out + "<div class='col-sm-6 text-center leftp'><i class='fa fa-child fa-2'></i>x" + rcmAvailableCars[i]["noadults"];
                out = out + "&nbsp;&nbsp;<i class='fa fa-child'></i>x" + rcmAvailableCars[i]["nochildren"];
                out = out + "</div><div class='col-sm-6 text-center leftr'>&nbsp;&nbsp;<i class='fa fa-briefcase fa-2'></i>x" + rcmAvailableCars[i]["nolargecase"];
                out = out + "&nbsp;&nbsp;<i class='fa fa-briefcase'></i>x" + rcmAvailableCars[i]["nosmallcase"];
                out = out + "</div></div>";
                out = out + "<div class='col-sm-7 verticalMiddle'>";
                if (LocAvailable == true && CarAvailable == true) {
                   
                    if (rcmAvailableCars[i]["available"] == '2')
                        out = out + "<div class='row'><div class='col-sm-6'><span class='red'>" + rcmAvailableCars[i]["availablemsg"] + "</span></div></div>";
                    out = out + "<div class='col-sm-6 col-xs-5 text-left' Id='dvbooknow'><button class='salt_btn button sl buttonsel'  onclick='booknow(" + rcmAvailableCars[i]["carrateid"] + "," + rcmAvailableCars[i]["carsizeid"] + ")'>Select Car</button></div>";
                     out = out + "<div class='col-sm-6 col-xs-7 text-right' id='totalCostFinal'><span class='results-price salt_btn deep_black total-estimate'> TOTAL &nbsp; $" + parseFloat(total).toFixed(2) + "</span></div></div>";
                } else if (CarAvailable == false) {
                    out = out + "<div class='row'><div class='col-sm-12'><span class='red'>" + rcmAvailableCars[i]["availablemsg"] + "</span>" + "</div></div>";
                }
                
                out = out + "</div>"; //col-sm-12 where background
                 out = out + "</div>";
               
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
            if (document.getElementById("txtPickupTime").value == '__:__')
                $('#txtPickupTime').val("10:00");
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
            if (document.getElementById("txtReturnTime").value == '__:__')
                $('#txtReturnTime').val("10:00");

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
            if (document.getElementById("txtPickup").value == '__/__/____' && '<?php echo $_SESSION["PickupDate"]; ?>' == '')
                $('#txtPickup').val(rcmGetdate(startPickup + PickUpOffset));
            $('#txtReturn').datetimepicker({
                timepicker: false,
                mask: true,
                format: 'd/m/Y',
                formatDate: 'd/m/Y',
                scrollInput: false,
                closeOnDateSelect: true,
                minDate: rcmGetdate(startDropOff)
            });
            if (document.getElementById("txtReturn").value == '__/__/____' && '<?php echo $_SESSION["ReturnDate"]; ?>' == '')
                $('#txtReturn').val(rcmGetdate(startDropOff + DropOffOffset));
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
            }
            ;
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
<section id="rent-details" class="row cfx">
    <aside>
    
      <form class="booking_form"  autocomplete="off" action="<?php echo site_url().'/step3/'; ?>" id="frmStep2" name="frmStep2" method="POST">
        <h2>MAKE A BOOKING <small>/ GET A QUOTE</small></h2>
        <div>
            <label>Pickup Location</label>
            <select name="form-Pickup-Location" id="cmbPickup" cl></select>
            <div class="js-datepair cfx">
                <label>Pickup Date</label>
                <div class="alignleft">
                    <input name="form-Pickup-Date" readonly type="text" class="start" id="txtPickup"/>
                </div>
                <div class="alignright">
                    <input name="form-Pickup-Time" type="text" class="start" id="txtPickupTime"/>
                </div>
                <label>Return Location</label>
                <select name="form-Dropoff-Location" id="cmbDropOff"></select>
                <label>Return Date</label>
                <div class="alignleft">
                    <input name="form-Dropoff-Date" readonly type="text" class="end" id="txtReturn"/>
                </div>
                <div class="alignright">
                    <input name="form-Dropoff-Time" type="text" class="end" id="txtReturnTime"/>
                </div>
            </div>
             <div style="display:none;">
            <label>Category Type</label>
            <select name="form-Category-Type" id="cmbCatType"></select></div>
           <!--  <div class="r_box">
                <label>Age of Youngest Driver</label>
                <select id="cmbAge" name="form-Minimum-Age" onchange="getLocations();"></select>
            </div>-->
           <div class="r_box">

                <mark>Age of Youngest Driver</mark>
                <label><input type="radio" name="form-Minimum-Age1" value="4" <?php if($_SESSION['api']["Age"]=='4'){?> checked="checked" <?php }?> onclick="document.getElementById('cmbAge').value=this.value"><span>21-24</span></label>
                <label><input type="radio" name="form-Minimum-Age1" value="9" <?php if($_SESSION['api']["Age"]=='9'){?> checked="checked" <?php }?> onclick="document.getElementById('cmbAge').value=this.value"><span>25+</span></label>
                <input type='hidden' name="form-Minimum-Age"  id='cmbAge' value='<?php echo $_SESSION['api']["Age"];?>'>
            </div>
<!--            <div class="js-datepair cfx r_box">
                <label>Promo-Code (if any)</label>
                <input type="text" name="form-Promo-Code" class="form-Promo-Code form-control" id="txtPromoCode" autocomplete="off">
            </div>-->
           <div class="reset_quote"><p><strong>NEED A DIFFERENT QUOTE?</strong>Change any of the options above or   <a href="<?php echo site_url('/'); ?>">click to start again from the beginning'</a></p>
              <button type="button" class="btn btn-primary btn-xs btn_next" onclick="DoRefresh()">Continue!</button>
           
           </div>
         
            
            
            <?php /*
                if($step == 'step1'){
                    echo '<button class="btn_next" id="fat-btn">Next Step</button><table><tr><td>NEXT STEP</td><td>Select Your Car & Options</td></tr></table>';
                }else{
                    echo '<div class="reset_quote" id="fat-btn"><p><strong>NEED A DIFFERENT QUOTE?</strong>Change any of the options above or <a href="">click to start again from the beginning\'</a></p></div>';
                } */
            ?>
            <input type='hidden' name='choosetext' id='choosetext' value='Check the following entries:'>
            <input type="hidden" name='CategoryTypeID' id='CategoryTypeID' value='<?php echo $_SESSION['api']["CategoryTypeID"]; ?>'>
            <input type='hidden' name='PickupLocationID' id='PickupLocationID' value='<?php echo $_SESSION['api']["PickupLocationID"]; ?>'>
            <input type='hidden' name='DropOffLocationID' id='DropOffLocationID' value='<?php echo $_SESSION['api']["DropOffLocationID"]; ?>'>
            <input type='hidden' name='PickupDate' id='PickupDate' value='<?php echo $_SESSION['api']["PickupDate"]; ?>'>
            <input type='hidden' name='PickupTime' id='PickupTime' value='<?php echo $_SESSION['api']["PickupTime"]; ?>'>
            <input type='hidden' name='ReturnDate' id='ReturnDate' value='<?php echo $_SESSION['api']["ReturnDate"]; ?>'>
            <input type='hidden' name='ReturnTime' id='ReturnTime' value='<?php echo $_SESSION['api']["ReturnTime"]; ?>'>
            <input type='hidden' name='Age' id='Age' value='<?php echo $_SESSION['api']["Age"]; ?>'>
            <input type='hidden' name='PromoCode' id='PromoCode' value='<?php echo $_SESSION['api']["PromoCode"]; ?>'>
            <input type='hidden' name='RateID' id='RateID' value=''>
            <input type='hidden' name='CarSizeID' id='CarSizeID' value=''>
            <input type='hidden' name='refid' id='refid' value='<?php echo $_SESSION['api']["refid"]; ?>'>
        </div>
    </form>

        
        
    </aside>


    <article>
        <ol>
            <li>Booking Dates</li>
            <li class="act">SELECT CAR</li>
            <li >SELECT OPTIONS</li>
            <li>REVIEW &amp; BOOK</li>
             <li>Summary</li>
        </ol>
<h1><strong>Step 2</strong>Please Select Your Car</h1>
        <!-- STEP 2 -->
                <div class="row"><div class="col-sm-12 form-box"><p class="bg-error" id='displmsg'></p></div></div>

  <div class='form-box'>
        <div class="">
          <div class="col-sm-12 form-box" style="padding:0px;">
            <a name="results"></a>
            <div id="availablecars" class='col-sm-12 form-bottom step2_page'></div>
          </div>
        </div>
       <!--  <div class="row"><div class="col-sm-12">&nbsp;</div></div> -->


      </div>
  
        

    </article>
</section>
<?php get_footer(); ?>
