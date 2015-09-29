<%


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
   If (Trim(Request.Form("form-Promo-Code")) <> "") Then tst("PromoCode") = Request.Form("form-Promo-Code")

   If (Trim(Request.Form("RateID")) <> "") Then tst("RateID") = Request.Form("RateID")
   If (Trim(Request.Form("CarSizeID")) <> "") Then tst("CarSizeID") = Request.Form("CarSizeID")
   If (Trim(Request.Form("valoldcustomer")) <> "") Then tst("valoldcustomer") = Request.Form("valoldcustomer")
   If (Trim(Request.Form("valquote")) <> "") Then tst("valquote") = Request.Form("valquote")
   If (Trim(Request.Form("valbooking")) <> "") Then tst("valbooking") = Request.Form("valbooking")
   If (Trim(Request.Form("selOptions")) <> "") Then tst("selOptions") = Request.Form("selOptions")
   If (Trim(Request.Form("CustomerData")) <> "") Then tst("CustomerData") = Request.Form("CustomerData")
   If (Trim(Request.Form("ReservationRef")) <> "") Then tst("ReservationRef") = Request.Form("ReservationRef")
   If (Trim(Request.Form("BookingType")) <> "") Then tst("BookingType") = Request.Form("BookingType")

   If Not IsNumeric(tst("valoldcustomer")) Then tst("valoldcustomer") = 0
   If Not IsNumeric(tst("valquote")) Then tst("valquote") = 0
   If Not IsNumeric(tst("valbooking")) Then tst("valbooking") = 0

   Session(tst("Key")) = tst
  If ((Request.Form("PickupLocationID") = "") And (Request.Form("DropOffLocationID") = "")) Then Response.Redirect("Step2.aspx")

 'if Session(tst("Key"))="" Then Response.Redirect("Step2.aspx")

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <link type="text/css" href="assets/css/Extra.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="include/jquery.datetimepicker.css" />
   <script src="include/jquery.js"></script>

    <script type="text/javascript" language="javascript">
      //paste this code under head tag or in a seperate js file.
      // Wait for window load
      $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
      });
  </script>


   <script src="include/form_validation.js"></script>
   <script src="include/jquery.datetimepicker.js"></script>
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
       //alert(arrOptionalExtras);
       //document.getElementById("dvblnkbtn").style.display = "none";
       document.getElementById("dvbtn").style.display = "none";

       document.getElementById("btnBooking").style.display = "none";
       document.getElementById("btnQuote").style.display = "none";
       document.getElementById("bookedbefore").style.display = "none";
       document.getElementById("databeforecheck").style.display = "none";

       if (document.getElementById("valquote").value == 0) {
         document.getElementById("displquote").style.display = "none";
       } else {
         document.getElementById("displquote").style.display = "";
         document.getElementById("bookedbefore").style.display = "";
         if (document.getElementById("valbooking").value == 0)
           document.getElementById("btnQuote").style.display = "";
       }

       if (document.getElementById("valbooking").value == 0) {
         document.getElementById("displbook").style.display = "none";
       } else {
         //document.getElementById("dvblnkbtn").style.display = "";
         document.getElementById("dvbtn").style.display = "";

         document.getElementById("displbook").style.display = "";
         document.getElementById("btnBooking").style.display = "";
         document.getElementById("btnQuote").style.display = "none";
         document.getElementById("bookedbefore").style.display = "";
       }

       oAPI.OnReadyStep3(DisplStep3);
       oAPI.OnReadyGetUser(SetupCustomer);
       oAPI.GetStep3(
            document.getElementById("CategoryTypeID").value,
            document.getElementById("PickupLocationID").value,
            document.getElementById("PickupDate").value,
            document.getElementById("PickupTime").value,
            document.getElementById("DropOffLocationID").value,
            document.getElementById("ReturnDate").value,
            document.getElementById("ReturnTime").value,
            document.getElementById("Age").value,
            document.getElementById("CarSizeID").value,
        document.getElementById("PromoCode").value,
            getDetails
         )

      /*
       if (window.history && window.history.pushState) {
         window.history.pushState('forward', null, './Nstep3.aspx');
         $(window).on('popstate', function () {
           //document.getElementById("btnBack").style.borderColor = "red";
           //debugger;
           $('#Imhere').addClass('Addborder');
           alert("Please use 'Choose a Car' link instead of browser's back function.");

           $('#Imhere').click(function (e) { window.history.back(); });

         });
       }*/
     })

     function DisplStep3() {
       var out = "";
       var qtyItem = "";
       var LocAvailable = true;
       var LocAvailableMsg = oAPI.CheckLocationAvailable();
       if (LocAvailableMsg != '') LocAvailable = false;
       LocID = document.getElementById("PickupLocationID").value;
       Age = oAPI.GetAge(document.getElementById("Age").value);

       document.getElementById("displmsg").innerHTML = LocAvailableMsg;

       oAPI.LoadRentalSource(document.getElementById("foundus"), document.getElementById("foundus").value);
       oAPI.LoadAreaOfUse(document.getElementById("areaofuse"), document.getElementById("areaofuse").value, LocID, "Select area of usage");
       oAPI.LoadCountries(document.getElementById("issuedin"), document.getElementById("issuedin").value);
       oAPI.LoadCountries(document.getElementById("country"), document.getElementById("country").value);

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
         numofdays = rcmAvailableCars[i]["numofdays"];
         //out = out + "<div class='col1'>";
         //out = out + "<div class='table4'><div class='row'>";
         out = out + "<div class='row' style='background-color:#FFFFFF;border-radius:5px;'>"
         out = out + "<div class='col-sm-4 text-center  vehicleThumbnail'>"
         out = out + "<div class='row'><div class='col-sm-12'><img class='img-responsive' src='" + rcmAvailableCars[i]["imagename"] + "' alt='' class='car-img' /></div></div>";
         out = out + "<div class='row'><div class='col-sm-12'><i class='fa fa-child fa-2'></i>x" + rcmAvailableCars[i]["noadults"];
         out = out + "&nbsp;&nbsp;<i class='fa fa-child'></i>x" + rcmAvailableCars[i]["nochildren"];
         out = out + "&nbsp;&nbsp;<i class='fa fa-briefcase fa-2'></i>x" + rcmAvailableCars[i]["nolargecase"];
         out = out + "&nbsp;&nbsp;<i class='fa fa-briefcase'></i>x" + rcmAvailableCars[i]["nosmallcase"] + "</div></div>";
         out = out + "</div>";
         out = out + "<div class='col-sm-7'>"
         //out = out + "<div class='cell'>";
         //out = out + "<div class='table1'>";
         //out = out + "<div class='row'><div class='cell'>Description</div><div class='cell'>:</div><div class='cell'>" + rcmAvailableCars[i]["webdesc"] + "</div></div>";
         out = out + "<div class='row'><div class='col-xs-4 text-right' id='divPickup'><strong>Description : </strong></div><div class='col-xs-8 text-left'>" + rcmAvailableCars[i]["webdesc"] + "</div></div>";
         out = out + "<div class='row'><div class='col-xs-4 text-right' id='divPickup'><strong>Pickup Location : </strong></div><div class='col-xs-8 text-left'>" + rcmLocationFees[0]["location"] + "</div></div>";
         out = out + "<div class='row'><div class='col-xs-4 text-right' id='divReturn'><strong>Pickup Date & Time : </strong></div><div class='col-xs-8 text-left'>" + rcmLocationFees[0]["dwname"] + " " + rcmLocationFees[0]["locdate"] + " " + rcmLocationFees[0]["loctime"] + "</div></div>";
         out = out + "<div class='row'><div class='col-xs-4 text-right' id='divPickup'><strong>Return Location : </strong></div><div class='col-xs-8 text-left'>" + rcmLocationFees[1]["location"] + "</div></div>";
         out = out + "<div class='row'><div class='col-xs-4 text-right' id='divPickup'><strong>Return Date & Time : </strong></div><div class='col-xs-8 text-left'>" + rcmLocationFees[1]["dwname"] + " " + rcmLocationFees[1]["locdate"] + " " + rcmLocationFees[1]["loctime"] + "</div></div>";
         out = out + "<div class='row'><div class='col-xs-4 text-right' id='divDriver'><strong>Youngest Driver : </strong></div><div class='col-xs-8 text-left'>" + Age + " Years</div></div>";
         //out = out + "<div class='row'><div class='col-sm-3 text-right' id='divDesc'><h5>Desc : </h5></div><div class='col-sm-9 text-left'>" + rcmAvailableCars[i]["webdesc"] + "</div></div>";
         //out = out + "<div class='row'><div class='col-sm-3 text-right' id='divDesc'><h5>Total : </h5></div><div class='col-sm-9 text-left red'>$" + subtotal + "</div></div>";

         out = out + "</div>";
         out = out + "</div>";
         out = out + "<div class='row'><div class=col-sm-12'>&nbsp;</div></div>";



         out = out + "<div class='row'>"
         out = out + "<div class='col-sm-4' style='background-color:#FFFFFF;border-radius:5px;'>";

         // FreeDays
         if (rcmAvailableCars[i]["freedays"] > 0) {
           subtotal = subtotal - parseFloat(rcmAvailableCars[i]["avgrate"]) * parseFloat(rcmAvailableCars[i]["freedays"]);
         }
         //out = out + "<div class='row'>";
         if (rcmAvailableCars[i]["numofdays"] > 0) {
           out = out + "<div class='row'><div class='col-sm-12'><h4>Daily rate:</h4></div></div>";
         } else {
           out = out + "<div class='row'><div class='col-sm-12'><h4>Hourly rate:</h4></div></div>";
         }
         //out = out + "<div class='row'><div class='col-sm-12'>";

         out = out + "<div class='row'>";
         if (rcmAvailableCars[i]["numofdays"] > 0) {
           out = out + "<div class='col-xs-8 text-left'>" + rcmAvailableCars[i]["numofdays"] + " days @ $" + parseFloat(rcmAvailableCars[i]["avgrate"]).toFixed(2) + "</div><div class='col-xs-4 text-right'><label id='baserate'>" + parseFloat(parseFloat(rcmAvailableCars[i]["avgrate"]) * parseFloat(rcmAvailableCars[i]["numofdays"])).toFixed(2) + "</label></div>";
         } else {
           out = out + "<div class='col-xs-8 text-left'>" + rcmAvailableCars[i]["numofhours"] + " hours]" + "</div><div class='col-xs-4 text-right'><label id='baserate'>" + parseFloat(rcmAvailableCars[i]["totrate"]).toFixed(2) + "</label></div>";
         }
         out = out + "</div>";
         // Relocation Fees
         if (rcmAvailableCars[i]["relocfee"] > 0) {
              if (rcmAvailableCars[i]["relocdaysnocharge"]==0 || (rcmAvailableCars[i]["relocdaysnocharge"] > 0 && parseFloat(rcmAvailableCars[i]["relocdaysnocharge"]) > parseFloat(rcmAvailableCars[i]["numofdays"]))) {
             out = out + "<div class='row'><div class='col-xs-8 text-left'>Relocation Fee</div><div class='col-xs-4 text-right'><label id='relocfee'>" + parseFloat(rcmAvailableCars[i]["relocfee"]).toFixed(2) + "</label></div></div>";
             subtotal = parseFloat(subtotal) + parseFloat(rcmAvailableCars[i]["relocfee"]);
           }
         }

         // unattendedfee and afterhourfees
         for (j in rcmLocationFees) {
           if (rcmLocationFees[j]["unattendedfee"] > 0) {
             out = out + "<div class='row'><div class='col-xs-8 text-left'>Unattended Dropoff Fee [" + rcmLocationFees[j]["location"] + "]</div><div class='col-xs-4 text-right'><label id='LocationFees" + rcmLocationFees[j]["loctypeid"] + "'>" + parseFloat(rcmLocationFees[j]["unattendedfee"]).toFixed(2) + "</label></div></div>";
             subtotal = parseFloat(subtotal) + parseFloat(rcmLocationFees[j]["unattendedfee"]);
           }
           if (rcmLocationFees[j]["afterhourfee"] > 0) {
             out = out + "<div class='row'><div class='col-xs-8 text-left'>Afterhour Fee [" + rcmLocationFees[j]["location"] + "]</div><div class='col-xs-4 text-right'><label id='LocationFees" + rcmLocationFees[j]["loctypeid"] + "'>" + parseFloat(rcmLocationFees[j]["afterhourfee"]).toFixed(2) + "</label></div></div>";
             subtotal = parseFloat(subtotal) + parseFloat(rcmLocationFees[j]["afterhourfee"]);
           }
         }

         // Mandatory Extra Fees
         basetotal = parseFloat(subtotal);
         //alert("basetotal:" + basetotal);
         out = out + "<div class='row'><div class='col-sm-12'><h4>Extra Fees:</h4></div></div>";
         for (j in rcmMandatoryFees) {
           if ((rcmMandatoryFees[j]["locationid"] == LocID || rcmMandatoryFees[j]["locationid"] == "0") && (rcmMandatoryFees[j]["vehiclesizeid"] == SizeID || rcmMandatoryFees[j]["vehiclesizeid"] == "0")) {
             if (rcmMandatoryFees[j]["type"] == "Daily") {
               out = out + "<div class='row'><div class='col-xs-8 text-left'><span class='glyphicon glyphicon-plus-sign'></span>&nbsp;" + rcmMandatoryFees[j]["name"] + " @ $" + parseFloat(rcmMandatoryFees[j]["fees"]).toFixed(2) + " Per Day</div><div class='col-xs-4 text-right'><label id='MandatoryFees" + rcmMandatoryFees[j]["id"] + "'>" + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"])).toFixed(2) + "</label></div></div>";
               //if (rcmMandatoryFees[j]["gst"] == "True") gsttotal = parseFloat(gsttotal) + (numofdays * parseFloat(rcmMandatoryFees[j]["fees"]));
             } else if (rcmMandatoryFees[j]["type"] == "Percentage") {
               out = out + "<div class='row'><div class='col-xs-8 text-left'><span class='glyphicon glyphicon-plus-sign'></span>&nbsp;" + rcmMandatoryFees[j]["name"] + "</div><div class='col-xs-4 text-right'><label id='MandatoryFees" + rcmMandatoryFees[j]["id"] + "'>" + (parseFloat(subtotal) * parseFloat(rcmMandatoryFees[j]["fees"]) / 100).toFixed(2) + "</label></div></div>";
             } else {
               out = out + "<div class='row'><div class='col-xs-8 text-left'><span class='glyphicon glyphicon-plus-sign'></span>&nbsp;" + rcmMandatoryFees[j]["name"] + "</div><div class='col-xs-4 text-right'><label id='MandatoryFees" + rcmMandatoryFees[j]["id"] + "'>" + parseFloat(rcmMandatoryFees[j]["fees"]).toFixed(2) + "</label></div></div>";
             }
           }
         }

         // Total Optional Extras 
         //out = out + "<div class='row'><div class='col-sm-12'><h4>Optional Extras:</h4></div></div>";
         out = out + "<div class='row'><div class='col-xs-8 text-left'><span class='glyphicon glyphicon-plus-sign'></span>Total Optional Extras</div><div class='col-xs-4 text-right'><label id='TotOptionalExtras'>0.00</label></div></div>";

         //Discounts
         out = out + "<div class='row'><div class='col-sm-12'><h4>Discounts:</h4></div></div>";
         if (rcmAvailableCars[i]["totaldiscount"] > 0) {
           out = out + "<div class='row'><div class='col-xs-8 text-left'><span class='glyphicon glyphicon-minus'></span>&nbsp;Total Discounts</div><div class='col-xs-4 text-right'><label id='totaldiscount'>" + parseFloat(rcmAvailableCars[i]["totaldiscount"]).toFixed(2) + "</label></div></div>";
         } else {
           out = out + "<div class='row'><div class='col-xs-8 text-left'>No Discounts</div><div class='col-xs-4 text-right'><label id='totaldiscount'>0.00</label></div></div>";
         }
         if (rcmAvailableCars[i]["freedays"] > 0) {
           out = out + "<div class='row'><div class='col-xs-8 text-left'><span class='red'>You qualify for " + rcmAvailableCars[i]["freedays"] + " Free day(s) special</span></div><div class='col-xs-4 text-right'><label id='freedays'>" + (parseFloat(rcmAvailableCars[i]["avgrate"]) * parseFloat(rcmAvailableCars[i]["freedays"])).toFixed(2) + "</label></div></div>";
         }

         if (rcmTaxInclusive == false) {
           out = out + "<div class='row'><div class='col-sm-12 text-right'><small>GST: <label id='displGST'>##.##</label></small></div></div>";
           out = out + "<div class='row'><div class='col-xs-6 text-left'><h4>Total: </h4></div><div class='col-xs-6 text-right'><h4><label id='displTot'>###.##</label></h4></div></div>";
       } else {
           out = out + "<div class='row'><div class='col-xs-6 text-left'><h4>Total: </h4></div><div class='col-xs-6 text-right'><h4><label id='displTot'>###.##</label></h4></div></div>";
           out = out + "<div class='row'><div class='col-sm-12 text-right'><span>(Inc. GST: <label id='displGST'>##.##</label>)</span></div></div>";
         }

         out = out + "</div>";
        
         //Optional Extras
         out = out + "<div class='col-sm-8 dashboard-panel-8  pull-right' style='background-color:#FFFFFF;border-radius:5px;'>";
         out = out + "<div class='row'><div class='col-sm-12'><h4>Optional Extras:</h4></div></div>";

         for (j in rcmOptionalFees) {
           if ((rcmOptionalFees[j]["locationid"] == LocID || rcmOptionalFees[j]["locationid"] == "0") && (rcmOptionalFees[j]["vehiclesizeid"] == SizeID || rcmOptionalFees[j]["vehiclesizeid"] == "0")) {
             qtyItem = "";
             if (rcmOptionalFees[j]["qtyapply"] == "True") {
               qtyItem = " QTY required <input type='text' class='' size='3' maxlength='2' name='qtyOptionalExtras" + rcmOptionalFees[j]["id"] + "' id='qtyOptionalExtras" + rcmOptionalFees[j]["id"] + "' value='1' class='qtyitem' onchange='calcTotal()'  style='width:65px'  placeholder='01' required maxlength='2'/> ";
             }
             if (rcmOptionalFees[j]["type"] == "Daily") {
               out = out + "<div class='row'><div class='col-xs-7 text-left'><input type='checkbox' class='squaredFour' name='OptionalExtras' id='OptionalExtras" + rcmOptionalFees[j]["id"] + "' value='" + rcmOptionalFees[j]["id"] + "' onchange='calcTotal()'> &nbsp;" + rcmOptionalFees[j]["name"] + " @ $" + parseFloat(rcmOptionalFees[j]["fees"]).toFixed(2) + " Per Day. </div><div class='col-xs-3 text-left'>" + qtyItem + "</div><div class='col-xs-2 text-right'><label id='OptionalFees" + rcmOptionalFees[j]["id"] + "' class='off'>" + (numofdays * parseFloat(rcmOptionalFees[j]["fees"])).toFixed(2) + "</label></div></div>";
             } else if (rcmOptionalFees[j]["type"] == "Percentage") {
               out = out + "<div class='row'><div class='col-xs-7 text-left'><input type='checkbox' class='squaredFour' name='OptionalExtras' id='OptionalExtras" + rcmOptionalFees[j]["id"] + "' value='" + rcmOptionalFees[j]["id"] + "' onchange='calcTotal()'> &nbsp;" + rcmOptionalFees[j]["name"] + "</div><div class='col-xs-3 text-left'>" + qtyItem + "</div><div class='col-sm-2 text-right'><label id='OptionalFees" + rcmOptionalFees[j]["id"] + "' class='off'>" + (subtotal * parseFloat(rcmOptionalFees[j]["fees"]) / 100).toFixed(2) + "</label></div></div>";
             } else {
               out = out + "<div class='row'><div class='col-xs-7 text-left'><input type='checkbox' class='squaredFour' name='OptionalExtras' id='OptionalExtras" + rcmOptionalFees[j]["id"] + "' value='" + rcmOptionalFees[j]["id"] + "' onchange='calcTotal()'> &nbsp;" + rcmOptionalFees[j]["name"] + "</div><div class='col-xs-3 text-left'>" + qtyItem + "</div><div class='col-sm-2 text-right'><label id='OptionalFees" + rcmOptionalFees[j]["id"] + "' class='off'>" + parseFloat(rcmOptionalFees[j]["fees"]).toFixed(2) + "</label></div></div>";
             }
           }
         }


         //Insurance
         var InsuranceOut = "";
         var InsuranceCnt = 0;
         var chkStr;
         var OnOff;
         for (j in rcmInsuranceOptions) {
           if ((rcmInsuranceOptions[j]["locationid"] == "0" || rcmInsuranceOptions[j]["locationid"] == LocID) && (rcmInsuranceOptions[j]["vehiclesizeid"] == "0" || rcmInsuranceOptions[j]["vehiclesizeid"] == SizeID) && (rcmInsuranceOptions[j]["fromage"] == "0" || rcmInsuranceOptions[j]["fromage"] <= Age) && (rcmInsuranceOptions[j]["toage"] == "0" || rcmInsuranceOptions[j]["toage"] >= Age)) {
             InsuranceCnt++;
             chkStr = "";
             OnOff = "off";
             if (rcmInsuranceOptions[j]["default"] == "True") {
               chkStr = " checked";
               OnOff = "on";
             }
             if (rcmInsuranceOptions[j]["type"] == "Daily") {
               InsuranceOut = InsuranceOut + "<div class='row'><div class='col-xs-10 text-left'><input type='radio' name='Insurance' id='Insurance" + rcmInsuranceOptions[j]["id"] + "' value='" + rcmInsuranceOptions[j]["id"] + "' onchange='calcTotal()'" + chkStr + "> &nbsp;" + rcmInsuranceOptions[j]["name"] + " @ $" + parseFloat(rcmInsuranceOptions[j]["fees"]).toFixed(2) + " Per Day</div><div class='col-xs-2 text-right'><label id='InsuranceOptions" + rcmInsuranceOptions[j]["id"] + "' class='" + OnOff + "'>" + (numofdays * parseFloat(rcmInsuranceOptions[j]["fees"])).toFixed(2) + "</label></div></div>";
             } else if (rcmInsuranceOptions[j]["type"] == "Percentage") {
               InsuranceOut = InsuranceOut + "<div class='row'><div class='col-xs-10 text-left'><input type='radio' name='Insurance' id='Insurance" + rcmInsuranceOptions[j]["id"] + "' value='" + rcmInsuranceOptions[j]["id"] + "' onchange='calcTotal()'" + chkStr + "> &nbsp;" + rcmInsuranceOptions[j]["name"] + "</div><div class='col-xs-2 text-right'><label id='InsuranceOptions" + rcmInsuranceOptions[j]["id"] + "' class='" + OnOff + "'>" + (subtotal * parseFloat(rcmInsuranceOptions[j]["fees"]) / 100).toFixed(2) + "</label></div></div>";
             } else {
               InsuranceOut = InsuranceOut + "<div class='row'><div class='col-xs-10 text-left'><input type='radio' name='Insurance' id='Insurance" + rcmInsuranceOptions[j]["id"] + "' value='" + rcmInsuranceOptions[j]["id"] + "' onchange='calcTotal()'" + chkStr + "> &nbsp;" + rcmInsuranceOptions[j]["name"] + "</div><div class='col-xs-2 text-right'><label id='InsuranceOptions" + rcmInsuranceOptions[j]["id"] + "' class='" + OnOff + "'>" + parseFloat(rcmInsuranceOptions[j]["fees"]).toFixed(2) + "</label></div></div>";
             }
           }
         }
         if (InsuranceOut.length > 0) {
           //InsuranceOut = "<div class='row'><div class='col-sm-10 text-left'><input type='radio' name='Insurance' id='Insurance0' value='0' onchange='calcTotal()'>&nbsp; No Insurance** (Excess $6500)</div><div class='col-sm-2 text-right'><label id='InsuranceOptions0'>0.00</label></div></div>" + InsuranceOut;
           //out = out + "<div class='table2'>";
           out = out + "<div class='row'><div class='col-sm-12 text-left'><h5>Insurance Options:</h5></div></div>";
           //out = out + "<div class='row'><div class='col-sm-6 text-left'>";
           out = out + InsuranceOut;
           //out = out + "</div></div></div></div>";
         }

         //ExtraKm
         var ExtraKmOut = "";
         var ExtraKmOutCnt = 0;
         /*var chkDefault = false;
         var chkStr = "";
         var OnOff = "off";*/
         for (j in rcmKmCharges) {
           if ((rcmKmCharges[j]["locationid"] == "0" || rcmKmCharges[j]["locationid"] == LocID) && (rcmKmCharges[j]["vehiclesizeid"] == "0" || rcmKmCharges[j]["vehiclesizeid"] == SizeID) && (rcmKmCharges[j]["fromday"] == "0" || rcmKmCharges[j]["fromday"] <= numofdays) && (rcmKmCharges[j]["today"] == "0" || rcmKmCharges[j]["today"] >= numofdays)) {
             ExtraKmOutCnt++;
             chkStr = "";
             OnOff = "off";
             if (rcmKmCharges[j]["defaultkm"] == "True") {
               //chkDefault = true;
               chkStr = " checked";
               OnOff = "on";
             }
             if (rcmKmCharges[j]["dailyrate"] > 0) {
               ExtraKmOut = ExtraKmOut + "<div class='row'><div class='col-xs-10 text-left'><input type='radio' name='ExtraKmOut' id='ExtraKmOut" + rcmKmCharges[j]["id"] + "' value='" + rcmKmCharges[j]["id"] + "' onchange='calcTotal()'" + chkStr + "> &nbsp;" + rcmKmCharges[j]["kmsfree"] + " Kms/Day, Additional " + parseFloat(rcmKmCharges[j]["addkmsfee"]).toFixed(2) + " per Kms - @ $" + parseFloat(rcmKmCharges[j]["dailyrate"]).toFixed(2) + " Per Day</div><div class='col-xs-2 text-right'><label id='KmCharges" + rcmKmCharges[j]["id"] + "' class='" + OnOff + "'>" + (numofdays * parseFloat(rcmKmCharges[j]["dailyrate"])).toFixed(2) + "</label></div></div>";
             } else {
               ExtraKmOut = ExtraKmOut + "<div class='row'><div class='col-sm-12 text-left'><input type='radio' name='ExtraKmOut' id='ExtraKmOut" + rcmKmCharges[j]["id"] + "' value='" + rcmKmCharges[j]["id"] + "' onchange='calcTotal()'" + chkStr + "> &nbsp;" + rcmKmCharges[j]["kmsfree"] + " Kms/Day, Additional " + parseFloat(rcmKmCharges[j]["addkmsfee"]).toFixed(2) + " per Kms</div></div>";
             }
           }
         }
         if (ExtraKmOutCnt > 0) {
           //ExtraKmOut = "<div class='row'><div class='col-sm-10 text-left'><input type='radio' name='ExtraKmOut' id='ExtraKmOut0' value='0' onchange='calcTotal()'>&nbsp; No Extra Kms**</div><div class='col-sm-2 text-right'><label id='KmCharges0'>0.00</label></div></div>" + ExtraKmOut;
           out = out + "<div class='table2'>";
           out = out + "<div class='row'><div class='col-sm-12 text-left'><h5>Km/Mileage Options</h5></div></div>";
           out = out + ExtraKmOut;
         }
         

         out = out + "</div>";//Optional Extras

         out = out + "</div>";//class ROW
       }
       document.getElementById("carsdetails").innerHTML = out;

       frmvalidator = new formValidator('frmStep3');
       // conditional validation based on document.getElementById('valoldcustomer').value==1
       frmvalidator.addValidation('chkDBO', 'Date of Birth', true, 'dd/mm/yyyy', "document.getElementById('valoldcustomer').value==1", 'Please enter a valid date for birth date');
       frmvalidator.addValidation('chkemail', 'Email', true, 'email', "document.getElementById('valoldcustomer').value==1", 'Please enter valid email');

       // conditional validation based on document.getElementById('valquote').value==1
       frmvalidator.addValidation('firstname', 'First Name', true, 'text', "document.getElementById('valquote').value==1", 'Please enter first name for quote');
       frmvalidator.addValidation('lastname', 'Last Name', true, 'text', "document.getElementById('valquote').value==1", 'Please enter last name for quote');
       frmvalidator.addValidation('email', 'Email', true, 'email', "document.getElementById('valquote').value==1", 'Please enter valid email for quote');

       // conditional validation based on document.getElementById('valbooking').value==1
       frmvalidator.addValidation('phone', 'Phone', true, 'number', "document.getElementById('valbooking').value==1", 'Please enter a valid Phone number');
       frmvalidator.addValidation('dob', 'DOB', false, 'dd/mm/yyyy', "document.getElementById('valbooking').value==1", 'Please enter a valid date for DOB');
       frmvalidator.addValidation('expire', 'Expire Date', false, 'dd/mm/yyyy', "document.getElementById('valbooking').value==1", 'Please enter a valid date for License Expire Date');
       //frmvalidator.addValidation('txtNoOfTravellers', 'No. of Travellers', true, 'number', "document.getElementById('valbooking').value==1", 'Please enter valid No. of Travellers');
       frmvalidator.addValidation('notraveling', 'No. of Travellers', true, 'number', "document.getElementById('valbooking').value==1", 'Please enter valid No. of Travellers');
       if (rcmLocationFees[0]["flightnoreqd"] == "True") {
         frmvalidator.addValidation('txtFlightNo', 'Flight Number', true, 'text', "document.getElementById('valbooking').value==1", 'Please enter a valid Flight Number.');
       };
       calcTotal();

     }
     function ShowAlert() {
       alert(rcmAlert);
     }
     function SetupCustomer() {
       if (rcmUserData.length > 0) {
         var expdate = rcmUserData[0]["licenseexpiry"];
         expdate = expdate.replace(/([\s])*([\d^\d])*:([\d^\d])*:([\d^\d])*([\s])*(am|pm)*/gi, "");
         document.getElementById("firstname").value = rcmUserData[0]["firstname"];
         document.getElementById("lastname").value = rcmUserData[0]["lastname"];
         document.getElementById("address").value = rcmUserData[0]["address"];
         document.getElementById("postcode").value = rcmUserData[0]["postcode"];
         document.getElementById("city").value = rcmUserData[0]["city"];
         document.getElementById("email").value = rcmUserData[0]["email"];
         document.getElementById("phone").value = rcmUserData[0]["phone"];
         document.getElementById("dob").value = rcmUserData[0]["dob"];
         document.getElementById("license").value = rcmUserData[0]["license"];
         document.getElementById("expire").value = expdate
         $("#country").val(rcmUserData[0]["countryid"]);
         $("select#issuedin option").each(function () { this.selected = (this.text == rcmUserData[0]["licenseissued"]); });
       } else {
         //alert("No records found!");
         BootstrapDialog.show({
           type: BootstrapDialog.TYPE_WARNING,
           title: 'Sorry: ',
           buttons: [{
             label: 'Close',
             cssClass: 'btn-danger',
             action: function (dialogItself) {
               dialogItself.close();
             }
           }],
           draggable: true,
           message: "No records found!"
         });
       }
     }
     function booknow() {
       //document.getElementById("dvblnkbtn").style.display = "";
       document.getElementById("dvbtn").style.display = "";

       document.getElementById("displquote").style.display = "";
       document.getElementById("displbook").style.display = "";
       document.getElementById("bookedbefore").style.display = "";
       document.getElementById("btnBooking").style.display = "";
       document.getElementById("btnQuote").style.display = "none";
       document.getElementById("dvForBooking").style.display = "";
       document.getElementById("dvFlightNoRequired").style.display = "none";
       if (rcmLocationFees[0]["flightnoreqd"] == "True") {
         document.getElementById("dvFlightNoRequired").style.display = "";
       };

      //
       window.location.href = "#quotebooking";
     }
     function emailquote() {
       //debugger;
       //alert("emailquote:" + document.getElementById("displquote").style.display);
       //document.getElementById("dvblnkbtn").style.display = "";
       document.getElementById("dvbtn").style.display = "";
       document.getElementById("dvForBooking").style.display = "none"; 
       document.getElementById("displbook").style.display = "none";
       document.getElementById("displquote").style.display = "";
       document.getElementById("bookedbefore").style.display = "";
       document.getElementById("btnBooking").style.display = "none";
       document.getElementById("btnQuote").style.display = "";
       window.location.href = "#quotebooking";
       // Save New Values
     }
     function oldcustomer() {
       if (document.getElementById("databeforecheck").style.display == "")
         document.getElementById("databeforecheck").style.display = "none";
       else
         document.getElementById("databeforecheck").style.display = "";
     }

     function checkcustomer() {
       document.getElementById("valoldcustomer").value = 1;
       document.getElementById("valquote").value = 0;
       document.getElementById("valbooking").value = 0;
       if (frmvalidator.Validate(document.getElementById("frmStep3"))) {
         var EmailChk = document.getElementById("chkemail").value;
         var DOBChk = document.getElementById("chkDBO").value;
         if (DOBChk != "" && EmailChk != "") {
           oAPI.GetUser(DOBChk, EmailChk);
         } else {
           //alert("Enter Last name and Email before trying to check");
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
             message: "Enter Last name and Email before trying to check"
           });
         }
       }
     }
     function submitQuote() {
       document.getElementById("valoldcustomer").value = 0;
       document.getElementById("valquote").value = 1;
       document.getElementById("valbooking").value = 0;
       doSubmit(1);
     }
     function submitBooking() {
       document.getElementById("valoldcustomer").value = 0;
       document.getElementById("valquote").value = 1;
       document.getElementById("valbooking").value = 1;
       doSubmit(2);
     }
     function doSubmit(BookingType) {
       //debugger;
       // First validate form entries
       if (frmvalidator.Validate(document.getElementById("frmStep3"))) {
         //Hide buttons so user can's press twice
         //document.getElementById("dvblnkbtn").style.display = "none";
         document.getElementById("dvbtn").style.display = "none";

         document.getElementById("btnBooking").style.display = "none";
         document.getElementById("btnQuote").style.display = "none";
         document.getElementById("BookingType").value = BookingType;

         oAPI.OnBookingDone(GoToStep4);
         // Before making API call 'MakeBooking' make sure that next items are set within the API
         // - Optional Items, 
         //  - Customer Data, 
         // - Insurance, 
         // - Extra KM 
         // -  and Transmission Type (Default set to 0 --> No Preference)
         //
         oAPI.SetCustomerData(
               document.getElementById("firstname").value,
               document.getElementById("lastname").value,
               document.getElementById("email").value,
               document.getElementById("phone").value,
               '', //Mobile
               document.getElementById("dob").value,
               document.getElementById("license").value,
               document.getElementById("issuedin").value, // Issued in country ID
               document.getElementById("expire").value,
               document.getElementById("address").value,
               document.getElementById("city").value,
               document.getElementById("txtState").value,         //State 
               document.getElementById("postcode").value,
               document.getElementById("country").value,
               '', //Fax
               document.getElementById("foundus").value,
          '', // Remarks
               document.getElementById("notraveling").value, // '2',No traveling
               document.getElementById("txtFlightNo").value, //'TG624', flight no in
               '', // TG625 flightout
               document.getElementById("txtCollectionPoint").value, // city collection point
               '', // airport retpoint
               document.getElementById("areaofuse").value      // area of use
            );
         //oAPI.SetState("QLD"); //QLD
         //oAPI.SetTransmission(1);
         // By not setting transmission type preference the system assumes --> No Preference
         oAPI.SetTransmission(document.getElementById("ddlTransmission").value);
         //oAPI.SetAreaOfUse(124);


         oAPI.MakeBooking(
               document.getElementById("CategoryTypeID").value,
               document.getElementById("PickupLocationID").value,
               document.getElementById("PickupDate").value,
               document.getElementById("PickupTime").value,
               document.getElementById("DropOffLocationID").value,
               document.getElementById("ReturnDate").value,
               document.getElementById("ReturnTime").value,
               document.getElementById("Age").value,
               document.getElementById("CarSizeID").value,
               BookingType
            );
         if (oAPI.CheckCustomerDataOK() == false) {
           if (BookingType == 2)
             document.getElementById("btnBooking").style.display = "";
           else
             document.getElementById("btnQuote").style.display = "";
         }
         // Get data in JSON format to pass it to next form step 4
         document.getElementById("selOptions").value = oAPI.GetOptionalItems();
         document.getElementById("CustomerData").value = oAPI.GetCustomerData();
       }
     }
     /*
     function GoToStep4() {
     document.getElementById("ReservationRef").value = oAPI.ReservationRef();
     document.getElementById("frmStep3").submit();
     }
     */
     function GoToStep4() {
       document.getElementById("ReservationRef").value = oAPI.ReservationRef();
       document.getElementById("ReservationNo").value = oAPI.ReservationNo();

       // In case of quote directly go to confirmation page --> step 5
       if (document.getElementById("BookingType").value == 1) document.getElementById("frmStep3").action = "step5.aspx";
       document.getElementById("frmStep3").submit();
     }

     function calcTotal() {
       var chkid = "";
       var qtyid = "";
       var calcTotal = parseFloat(basetotal);
       var calcGst = calcTotal;
       var calcStampDuty = calcTotal;
       var calcTotOptExt = 0.0;
       var ItemVal = 0.0;
       var ItemObj;
       var qtyItems = 1;

       if (rcmTaxInclusive == false) {
         calcGst = parseFloat(calcGst) * (1.0 + oAPI.GetTax());
       }
       //alert("GST Rate=" + oAPI.GetTax() + ", Stampduty=" + oAPI.GetStateTax());
       oAPI.ClearOptionalItems();
       for (j in rcmOptionalFees) {
         ItemVal = 0.0;
         qtyItems = 1;
         chkid = "OptionalExtras" + rcmOptionalFees[j]["id"];
         qtyid = "qtyOptionalExtras" + rcmOptionalFees[j]["id"];
         if (document.getElementById(qtyid)) qtyItems = parseInt(document.getElementById(qtyid).value);
         if (rcmOptionalFees[j]["type"] == "Daily") {
           ItemVal = (parseFloat(numofdays) * parseFloat(rcmOptionalFees[j]["fees"]));
         } else if (rcmOptionalFees[j]["type"] == "Percentage") {
           ItemVal = (parseFloat(calcTotal) * parseFloat(rcmOptionalFees[j]["fees"]) / 100);
         } else {
           ItemVal = parseFloat(rcmOptionalFees[j]["fees"]);
         }
         if (parseFloat(rcmOptionalFees[j]["maxprice"]) > 0 && ItemVal > parseFloat(rcmOptionalFees[j]["maxprice"])) ItemVal = parseFloat(rcmOptionalFees[j]["maxprice"]);
         ItemVal = ItemVal * qtyItems;
         if (document.getElementById("OptionalFees" + rcmOptionalFees[j]["id"])) {
           document.getElementById("OptionalFees" + rcmOptionalFees[j]["id"]).className = "off";
           document.getElementById("OptionalFees" + rcmOptionalFees[j]["id"]).innerHTML = parseFloat(ItemVal).toFixed(2);
         }
         if (document.getElementById(chkid) && document.getElementById(chkid).checked) {
           oAPI.AddToOptionalItems(parseInt(rcmOptionalFees[j]["id"]), qtyItems);
           document.getElementById("OptionalFees" + rcmOptionalFees[j]["id"]).className = "on";
           if (rcmTaxInclusive == false) {
             calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
             if (rcmOptionalFees[j]["gst"] == "True") calcGst = parseFloat(calcGst) + (parseFloat(ItemVal) * (1.0 + oAPI.GetTax()));
           } else {
             calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
             if (rcmOptionalFees[j]["gst"] == "True") calcGst = parseFloat(calcGst) + parseFloat(ItemVal);
           }
           calcTotOptExt = parseFloat(calcTotOptExt) + parseFloat(ItemVal);
         }
       }
       // reset value for Insurance
       oAPI.SetInsurance(0);
       for (j in rcmInsuranceOptions) {
         ItemVal = 0.0;
         chkid = "Insurance" + rcmInsuranceOptions[j]["id"];
         if (document.getElementById("InsuranceOptions" + rcmInsuranceOptions[j]["id"])) document.getElementById("InsuranceOptions" + rcmInsuranceOptions[j]["id"]).className = "off";
         if (document.getElementById("Insurance0") && document.getElementById("Insurance0").checked)
           document.getElementById("InsuranceOptions0").className = "on";
         else if (document.getElementById("Insurance0"))
           document.getElementById("InsuranceOptions0").className = "off";

         if (rcmInsuranceOptions[j]["type"] == "Daily") {
           ItemVal = (parseFloat(numofdays) * parseFloat(rcmInsuranceOptions[j]["fees"]));
         } else if (rcmInsuranceOptions[j]["type"] == "Percentage") {
           ItemVal = (parseFloat(calcTotal) * parseFloat(rcmInsuranceOptions[j]["fees"]) / 100);
         } else {
           ItemVal = parseFloat(rcmInsuranceOptions[j]["fees"]);
         }
         if (parseFloat(rcmInsuranceOptions[j]["maxprice"]) > 0 && ItemVal > parseFloat(rcmInsuranceOptions[j]["maxprice"])) ItemVal = parseFloat(rcmInsuranceOptions[j]["maxprice"]);
         if (document.getElementById(chkid) && document.getElementById(chkid).checked) {
           document.getElementById("InsuranceOptions" + rcmInsuranceOptions[j]["id"]).className = "on";
           oAPI.SetInsurance(rcmInsuranceOptions[j]["id"]);
           if (rcmTaxInclusive == false) {
             calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
             if (rcmInsuranceOptions[j]["gst"] == "True") calcGst = parseFloat(calcGst) + (parseFloat(ItemVal) * (1.0 + oAPI.GetTax()));
           } else {
             calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
             if (rcmInsuranceOptions[j]["gst"] == "True") calcGst = parseFloat(calcGst) + parseFloat(ItemVal);
           }
           calcTotOptExt = parseFloat(calcTotOptExt) + parseFloat(ItemVal);
         }
       }
       // reset value for ExtraKms
       oAPI.SetExtraKms(0);
       for (j in rcmKmCharges) {
         ItemVal = 0.0;
         chkid = "ExtraKmOut" + rcmKmCharges[j]["id"];
         //KmCharges
         if (document.getElementById("KmCharges" + rcmKmCharges[j]["id"])) document.getElementById("KmCharges" + rcmKmCharges[j]["id"]).className = "off";
         if (document.getElementById("ExtraKmOut0") && document.getElementById("ExtraKmOut0").checked)
           document.getElementById("KmCharges0").className = "on";
         else if (document.getElementById("ExtraKmOut0"))
           document.getElementById("KmCharges0").className = "off";
         if (document.getElementById(chkid) && document.getElementById(chkid).checked) {
           oAPI.SetExtraKms(rcmKmCharges[j]["id"]);
           if (rcmKmCharges[j]["dailyrate"] > 0) {
             ItemVal = (numofdays * parseFloat(rcmKmCharges[j]["dailyrate"])).toFixed(2);
           }
           if (document.getElementById("KmCharges" + rcmKmCharges[j]["id"])) document.getElementById("KmCharges" + rcmKmCharges[j]["id"]).className = "on";
         }
         if (parseFloat(rcmKmCharges[j]["maxprice"]) > 0 && ItemVal > parseFloat(rcmKmCharges[j]["maxprice"])) ItemVal = parseFloat(rcmKmCharges[j]["maxprice"]);

         if (rcmTaxInclusive == false) {
           calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
           calcGst = parseFloat(calcGst) + parseFloat(ItemVal);
         } else {
           calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
           calcGst = parseFloat(calcGst) + parseFloat(ItemVal);
         }
         calcTotOptExt = parseFloat(calcTotOptExt) + parseFloat(ItemVal);
       }
       for (j in rcmMandatoryFees) {
         ItemVal = 0.0;
         OldVal = 0.0;
         if ((rcmMandatoryFees[j]["locationid"] == LocID || rcmMandatoryFees[j]["locationid"] == "0") && (rcmMandatoryFees[j]["vehiclesizeid"] == SizeID || rcmMandatoryFees[j]["vehiclesizeid"] == "0")) {
           if (rcmMandatoryFees[j]["type"] == "Daily") {
             ItemVal = (numofdays * parseFloat(rcmMandatoryFees[j]["fees"]));
           } else if (rcmMandatoryFees[j]["type"] == "Percentage") {
             // We need to be able to update this item
             ItemObj = document.getElementById("MandatoryFees" + rcmMandatoryFees[j]["id"]);
             ItemVal = parseFloat(calcTotal) * parseFloat(rcmMandatoryFees[j]["fees"]) / 100;
             ItemObj.innerHTML = ItemVal.toFixed(2);
           } else {
             ItemVal = parseFloat(rcmMandatoryFees[j]["fees"]);
           }
           if (parseFloat(rcmMandatoryFees[j]["maxprice"]) > 0 && ItemVal > parseFloat(rcmMandatoryFees[j]["maxprice"])) ItemVal = parseFloat(rcmMandatoryFees[j]["maxprice"]);
           if (rcmTaxInclusive == false) {
             calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
             if (rcmMandatoryFees[j]["gst"] == "True") calcGst = parseFloat(calcGst) + (parseFloat(ItemVal) * (1.0 + oAPI.GetTax()));
           } else {
             calcTotal = parseFloat(calcTotal) + parseFloat(ItemVal);
             if (rcmMandatoryFees[j]["gst"] == "True") calcGst = parseFloat(calcGst) + ItemVal;
           }
         }
       }
       //alert(JSON.stringify(rcmSelOptionalFees));

       //alert("Total: " + calcTotal + ", GSTtot: " + calcGst);
       if (document.getElementById("displTot")) {
         if (rcmTaxInclusive == false) {
           document.getElementById("displTot").innerHTML = (parseFloat(calcTotal) + (parseFloat(calcGst) - parseFloat(calcGst) / (1.0 + oAPI.GetTax()))).toFixed(2);
           document.getElementById("displGST").innerHTML = (parseFloat(calcGst) - parseFloat(calcGst) / (1.0 + oAPI.GetTax())).toFixed(2);
         } else {
           document.getElementById("displTot").innerHTML = parseFloat(calcTotal).toFixed(2);
           document.getElementById("displGST").innerHTML = (parseFloat(calcGst) - parseFloat(calcGst) / (1.0 + oAPI.GetTax())).toFixed(2);
         }
         document.getElementById("TotOptionalExtras").innerHTML = parseFloat(calcTotOptExt).toFixed(2);
         //$("#displGST").effect("highlight", { color: "#ff0000" }, 3000);
       }
     }
   </script>
  <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>--%>

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
      <script src="//oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="//oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
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
        <form id="frmStep3" name="frmStep3" action="Step4.aspx" method="post">
        <div class="row">
          <div class="col-sm-12">
            <div id="progress-bar">
              <div id="progress-bar-steps"><a href="Index.aspx">
                <div class="progress-bar-step done">
                  <!--<div class="progress-bar-step done">-->
                  <div class="step_number">1</div>
                  <div class="step_name">Create request</div>
                </div></a>
                <div class="progress-bar-step done" id="Imhere"><a href="Step2.aspx">
                  <div class="step_number">2</div>
                  <div class="step_name">Choose a car</div></a>
                </div>
                <div class="progress-bar-step current">
                  <div class="step_number">3</div>
                  <div class="step_name">Choose extras</div>
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
        <div class="row"><div class="col-sm-12 form-box"><p class="bg-error" id='displmsg'></p></div></div>
        <div class="row">
          <div class="col-sm-12 form-box">
            <div id="carsdetails" class='col-sm-12 form-bottom'></div>
          </div>
        </div>
        <%--<div class="row"><div class="col-sm-12">&nbsp;</div></div>--%>
        <div class="row" style="padding-top:3px;">
          <div class="col-sm-12 form-box">

            <div class="col-sm-12" style="background-color: white;border-radius:5px; padding-top:5px; padding-bottom:5px;">
              <div class="row">
                <div class='col-sm-12  text-center'>
                  <a class='btn btn-link-small' role="button" onclick='javascript:emailquote();'>Email Quote</a>&nbsp;&nbsp;<a  class='btn btn-link-small' onclick='booknow()'>Make a Booking</a>
                </div>
            </div>
          </div>
        </div>
        </div>
        <div class='row' style="padding-top:3px;">
          <div class="col-sm-12  form-box">
            <div id="bookedbefore" class="form-bottom" style="display: none;background-color: white;border-radius:0px; padding-top:5px; padding-bottom:5px;">
                <div class='row'>
                  <div class='col-sm-12 title'><a href="javascript:oldcustomer()">Already a Customer ? (<span class="red">click here</span>)</a></div>
                </div>
                <div class='row' style='background-color: white;border-radius:5px;'>
                  <div class='col-sm-12'>
                    <div id="databeforecheck">
                      <div class="col-sm-12 pull-left">
                      <div class="row">
                            <div class="col-sm-5 pull-left">
                            <label class="control-label  text-danger"><strong>Your DOB :</strong></label>
                            <input type="text" placeholder="Date of Birth * (dd/mm/yyyy)" class="form-chkDBO input-mini" name="chkDBO" id="chkDBO" maxlength="20" value='' />
                            </div>
                            <div class="col-sm-6 pull-left">
                            <label class="control-label text-danger"><strong>Your Email :</strong></label>
                            <input type="text" placeholder="Enter your email.." class="form-chkemail input-mini" value="mrinalsworld@gmail.com" name="chkemail" id="chkemail" maxlength="" value='' />
                            <a class='btn btn-link-small' onclick='checkcustomer()'>Check</a>
                            </div>
                      </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            </div></div>

                  <div class="row" style="padding-top:3px;">
          <div class="col-sm-12 form-box">

            <div id="displquote" class="form-bottom" style="display:none;background-color: white;border-radius:0px;">
                <div class='row' style='background-color: white;border-radius:5px;'>
                  <div class='col-sm-12 title'><a name="quotebooking">Contact Details:</a> <label class="control-label">&nbsp;&nbsp;&nbsp;(Fields marked </label><label class="control-label  text-danger">&nbsp;red &nbsp;</label><label class="control-label">indicates required field )</label></div>
                </div>
                <div class='row'>
                  <div class='col-sm-12'>
                      <div class="row">
                        <div class="col-sm-6 pull-left">
                        <div class="col-sm-6 pull-left"><label class="control-label  text-danger">First Name :</label></div>
                        <div class="col-sm-6 pull-left">
                        <input type="text" placeholder="First Name..." class="form-firstname  input-mini" name="firstname" id="firstname" maxlength="20" value='<%=tst("firstname")%>' />
                        </div>
                        </div>
                        <div class="col-sm-6 pull-left">
                        <div class="col-sm-6 pull-left"><label class="control-label  text-danger">Last Name :</label></div>
                        <div class="col-sm-6 pull-left">
                        <input type="text" placeholder="Last Name..."  class="form-lastname  input-mini"  name="lastname" id="lastname" maxlength="20" value='<%=tst("lastname")%>' />
                        </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-6 pull-left">
                        <div class="col-sm-6 pull-left"><label class="control-label  text-danger">Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></div>
                        <div class="col-sm-6 pull-left">
                        <input type="text" placeholder="Enter Your Email..."  class="form-email input-mini" name="email" id="email" maxlength="50" value='<%=tst("email")%>' />
                        </div>
                        </div>
                        <div class="col-sm-6 pull-left">
                        <div class="col-sm-6 pull-left"><label class="control-label  text-danger">Phone :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></div>
                        <div class="col-sm-6 pull-left">
                        <input type="text" placeholder="Enter Your Phone..."  class="form-phone input-mini" name="phone" id="phone" maxlength="15" value='<%=tst("phone")%>' /></div>
                        </div>
                      </div>

                      <div class="row" id="dvForBooking">
                        <div class="col-sm-6 pull-left">
                        <div class="col-sm-6 pull-left">
                        <label class="control-label  text-danger">Traveller(Nos.) :</label>
                        </div>
                        <div class="col-sm-6 pull-left">
                        <select name="notraveling" id="notraveling"  class="form-notraveling form-control input-mini">
                                                                              <option value="" selected disabled>No. of People Travelling:..</option>
                                                                              <option value="1">1</option>
                                                                              <option value="2">2</option>
                                                                              <option value="3">3</option>
                                                                              <option value="4">4</option>
                                                                              <option value="5">5</option>
                                                                              <option value="6">6+</option>
                                                        </select>

                        </div>
                        </div>
                        <div class="col-sm-6 pull-left"  id="dvFlightNoRequired">
                        <div class="col-sm-6 pull-left">
                        <label class="control-label  text-danger">Flight No. :</label>
                        </div>
                        <div class="col-sm-6 pull-left">
                        <input type="text" placeholder="Flight No..." class="form-phone input-mini" name="txtFlightNo" id="txtFlightNo" maxlength="15" value='<%=tst("txtFlightNo")%>' /></div>
                        </div>
                      </div>

                  </div>
                </div>
            </div>
          </div>
        </div>
        
        <div class='row' style="padding-top:2px;">
          <div class="col-sm-12  form-box">
            <div id="displbook" class="form-bottom" style="display: none;background-color: white;border-radius:0px;padding-top:5px; padding-bottom:5px;">
                <div class='row'>
                  <div class='col-sm-12 title'><a >Extra Details (optional):</a></div>
                </div>
                <div class='row'>
                  <div class='col-sm-12'>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">DOB (dd/mm/yyyy) :</label></div>
                        <div class="col-sm-6"><input type="text" placeholder="Enter Your DOB (dd/mm/yyyy)"  class="form-dob form-control" name="dob" id="dob" size="14" value='<%=tst("dob")%>' /></div>
                      </div>
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">License No :</label></div>
                        <div class="col-sm-6"><input type="text" placeholder="License No..." class="form-license form-control" name="license" id="license" maxlength="15" value='<%=tst("license")%>' /></div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">License Issue Country :</label></div>
                        <div class="col-sm-6">
                          <select name="issuedin"  class="form-issuedin form-control"  id="issuedin">
                            <option value="" disabled selected>License Issue Country</option>
                          </select>
                        </div>  
                      </div>
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">License Expiry :</label></div>
                        <div class="col-sm-6"><input type="text" placeholder="License Expiry (dd/mm/yyyy)" class="form-expire form-control col-sm-6" name="expire" id="expire" size="10" value='<%=tst("expire")%>' /></div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">Address :</label></div>
                        <div class="col-sm-6"><input type="text" placeholder="Address..." class="form-address form-control col-sm-6" name="address" id="address" maxlength="50" value='<%=tst("address")%>' /></div>
                      </div>
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">City :</label></div>
                        <div class="col-sm-6"><input type="text" placeholder="City..." class="form-city form-control col-sm-6" name="city" id="city" size="20" maxlength="20" value='<%=tst("city")%>' /></div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">State :</label></div>
                        <div class="col-sm-6"><input type="text" placeholder="State..." class="form-state form-control col-sm-6" name="txtState" id="txtState" maxlength="15" value='<%=tst("txtState")%>' /></div>
                      </div>
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">Postcode/ZIP :</label></div>
                        <div class="col-sm-6"><input type="text" placeholder="Postcode/ZIP..." class="form-postcode form-control col-sm-6" name="postcode" id="postcode" maxlength="10" value='<%=tst("postcode")%>' /></div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">country :</label></div>
                        <div class="col-sm-6"><select name="country" id="country" class="form-country form-control col-sm-6">
                            <option value="" disabled selected>Country of Residence</option>
                          </select></div>
                        </div>
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">Found Us Where? :</label></div>
                        <div class="col-sm-6"><select class="form-country form-control col-sm-6" name="foundus" id="foundus">
                          <%--<option value="" disabled selected>Found Us Where?</option>--%>
                          </select></div>
                        </div>
                    </div>

                    
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">Area of Use? :</label></div>
                          <div class="col-sm-6"><select name="areaofuse" id="areaofuse"  class="form-country form-control col-sm-6"></select></div>
                        </div>
                    </div>
                    

                    <div class="row">
                        <div class="col-sm-6">
                        <div class="col-sm-6"><label class="control-label">Transmission :</label></div>
                        <div class="col-sm-6">
                          <select name="ddlTransmission"  class="form-transmission form-control"  id="ddlTransmission">
                            <option value="0" selected>No Preference</option>
                            <option value="1" >Auto</option>
                            <option value="2" >Manual</option>
                          </select>
                        </div>  
                      </div>
                      <div class="col-sm-6 pull-left">
                        <div class="col-sm-6 pull-left">
                        <label class="control-label">Collection Point :</label>
                        </div>
                        <div class="col-sm-6 pull-left">
                        <input type="text" placeholder="Collection Point..."  class="form-Collection-Point input-mini" name="txtCollectionPoint" id="txtCollectionPoint" maxlength="50" value='<%=tst("txtCollectionPoint")%>' /></div>
                        </div>


                    </div>
                  </div>
                </div>
            </div>
          </div>
        </div>

        <div class="row" id="dvbtn" style="padding-top:3px;">
          <div class="col-sm-12 form-box">
            <div class="col-sm-12" style="background-color: white;border-radius:5px; padding-top:5px; padding-bottom:5px;">
              <div class="row">
                <div class='col-sm-12  text-center'>
                  <a class='btn btn-link-small' onclick='submitBooking()' id="btnBooking">Book Now</a>&nbsp;
                  <a class='btn btn-link-small' onclick='submitQuote()' id="btnQuote">Get a Quote</a>
                </div>
            </div>
          </div>
        </div>
        </div>        


        <input type='hidden' name='CategoryTypeID' id='CategoryTypeID' value='<%=tst("CategoryTypeID")%>'>
        <input type='hidden' name='PickupLocationID' id='PickupLocationID' value='<%=tst("PickupLocationID")%>'>
        <input type='hidden' name='DropOffLocationID' id='DropOffLocationID' value='<%=tst("DropOffLocationID")%>'>
        <input type='hidden' name='PickupDate' id='PickupDate' value='<%=tst("PickupDate")%>'>
        <input type='hidden' name='PickupTime' id='PickupTime' value='<%=tst("PickupTime")%>'>
        <input type='hidden' name='ReturnDate' id='ReturnDate' value='<%=tst("ReturnDate")%>'>
        <input type='hidden' name='ReturnTime' id='ReturnTime' value='<%=tst("ReturnTime")%>'>
        <input type='hidden' name='Age' id='Age' value='<%=tst("Age")%>'>
        <input type='hidden' name='PromoCode' id='PromoCode' value='<%=tst("PromoCode")%>'>
        <input type='hidden' name='RateID' id='RateID' value='<%=tst("RateID")%>'>
        <input type='hidden' name='CarSizeID' id='CarSizeID' value='<%=tst("CarSizeID")%>'>
        <input type='hidden' name='choosetext' id='choosetext' value='Check the following entries:'>
        <input type='hidden' name='valoldcustomer' id='valoldcustomer' value='<%=tst("valoldcustomer")%>'>
        <input type='hidden' name='valquote' id='valquote' value='<%=tst("valquote")%>'>
        <input type='hidden' name='valbooking' id='valbooking' value='<%=tst("valbooking")%>'>
        <input type='hidden' name='selOptions' id='selOptions' value='<%=tst("selOptions")%>'>
        <input type='hidden' name='CustomerData' id='CustomerData' value='<%=tst("CustomerData")%>'>
        <input type='hidden' name='ReservationRef' id='ReservationRef' value='<%=tst("ReservationRef")%>'>
        <input type='hidden' name='ReservationNo' id='ReservationNo' value='<%=tst("ReservationNo")%>'>
        <input type='hidden' name='BookingType' id='BookingType' value='<%=tst("BookingType")%>'>

        </form>
        <div class='row'>
          <div class="col-sm-12">

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
</body>
</html>
