<?php 
    /* Template Name: step4 */
    session_start();
    if (!isset($_SESSION['api']['CategoryTypeID'])) $_SESSION['api']["CategoryTypeID"] = "";
    if (!isset($_SESSION['api']['PickupLocationID'])) $_SESSION['api']["PickupLocationID"] = "";
    if (!isset($_SESSION['api']['DropOffLocationID'])) $_SESSION['api']["DropOffLocationID"] = "";
    if (!isset($_SESSION['api']['PickupDate'])) $_SESSION['api']["PickupDate"] = "";
    if (!isset($_SESSION['api']['PickupTime'])) $_SESSION['api']["PickupTime"] = "";
    if (!isset($_SESSION['api']['ReturnDate'])) $_SESSION['api']["ReturnDate"] = "";
    if (!isset($_SESSION['api']['ReturnTime'])) $_SESSION['api']["ReturnTime"] = "";
    if (!isset($_SESSION['api']['Age'])) $_SESSION['api']["Age"] = "";
    if (!isset($_SESSION['api']['PromoCode'])) $_SESSION['api']["PromoCode"] = "";
    if (!isset($_SESSION['api']['refid'])) $_SESSION['api']["refid"] = "";
    if (!isset($_SESSION['api']['RateID'])) $_SESSION['api']["RateID"] = "";
    if (!isset($_SESSION['api']['CarSizeID'])) $_SESSION['api']["CarSizeID"] = "";

    if (!isset($_SESSION['api']['firstname'])) $_SESSION['api']["firstname"] = "";
    if (!isset($_SESSION['api']['lastname'])) $_SESSION['api']["lastname"] = "";
    if (!isset($_SESSION['api']['email'])) $_SESSION['api']["email"] = "";
    if (!isset($_SESSION['api']['phone'])) $_SESSION['api']["phone"] = "";
    if (!isset($_SESSION['api']['dob'])) $_SESSION['api']["dob"] = "";
    if (!isset($_SESSION['api']['license'])) $_SESSION['api']["license"] = "";
    if (!isset($_SESSION['api']['expire'])) $_SESSION['api']["expire"] = "";
    if (!isset($_SESSION['api']['address'])) $_SESSION['api']["address"] = "";
    if (!isset($_SESSION['api']['city'])) $_SESSION['api']["city"] = "";
    if (!isset($_SESSION['api']['postcode'])) $_SESSION['api']["postcode"] = "";
    if (!isset($_SESSION['api']['valoldcustomer'])) $_SESSION['api']["valoldcustomer"] = "";
    if (!isset($_SESSION['api']['valquote'])) $_SESSION['api']["valquote"] = "";
    if (!isset($_SESSION['api']['valbooking'])) $_SESSION['api']["valbooking"] = "";
    if (!isset($_SESSION['api']['selOptions'])) $_SESSION['api']["selOptions"] = "";
    if (!isset($_SESSION['api']['CustomerData'])) $_SESSION['api']["CustomerData"] = "";
    if (!isset($_SESSION['api']['ReservationRef'])) $_SESSION['api']["ReservationRef"] = "";
    if (!isset($_SESSION['api']['ReservationNo'])) $_SESSION['api']["ReservationNo"] = "";
    if (!isset($_SESSION['api']['BookingType'])) $_SESSION['api']["BookingType"] = "";

    if (isset($_POST["CategoryTypeID"])) $_SESSION['api']["CategoryTypeID"] = $_POST["CategoryTypeID"];
    if (isset($_POST["PickupLocationID"])) $_SESSION['api']["PickupLocationID"] = $_POST["PickupLocationID"];
    if (isset($_POST["DropOffLocationID"])) $_SESSION['api']["DropOffLocationID"] = $_POST["DropOffLocationID"];
    if (isset($_POST["PickupDate"])) $_SESSION['api']["PickupDate"] = $_POST["PickupDate"];
    if (isset($_POST["PickupTime"])) $_SESSION['api']["PickupTime"] = $_POST["PickupTime"];
    if (isset($_POST["ReturnDate"])) $_SESSION['api']["ReturnDate"] = $_POST["ReturnDate"];
    if (isset($_POST["ReturnTime"])) $_SESSION['api']["ReturnTime"] = $_POST["ReturnTime"];
    if (isset($_POST["Age"]))  $_SESSION['api']["Age"] = $_POST["Age"];
    if (isset($_POST["PromoCode"]))  $_SESSION['api']["PromoCode"] = $_POST["PromoCode"];
    if (isset($_POST["refid"]))  $_SESSION['api']["refid"] = $_POST["refid"];
    if (isset($_POST["RateID"]))  $_SESSION['api']["RateID"] = $_POST["RateID"];
    if (isset($_POST["CarSizeID"]))  $_SESSION['api']["CarSizeID"] = $_POST["CarSizeID"];

    if (isset($_POST["firstname"]))  $_SESSION['api']["firstname"] = $_POST["firstname"];
    if (isset($_POST["lastname"]))  $_SESSION['api']["lastname"] = $_POST["lastname"];
    if (isset($_POST["email"]))  $_SESSION['api']["email"] = $_POST["email"];
    if (isset($_POST["phone"]))  $_SESSION['api']["phone"] = $_POST["phone"];
    if (isset($_POST["dob"]))  $_SESSION['api']["dob"] = $_POST["dob"];
    if (isset($_POST["license"]))  $_SESSION['api']["license"] = $_POST["license"];
    if (isset($_POST["expire"]))  $_SESSION['api']["expire"] = $_POST["expire"];
    if (isset($_POST["address"]))  $_SESSION['api']["address"] = $_POST["address"];
    if (isset($_POST["city"]))  $_SESSION['api']["city"] = $_POST["city"];
    if (isset($_POST["postcode"]))  $_SESSION['api']["postcode"] = $_POST["postcode"];
    if (isset($_POST["valoldcustomer"]))  $_SESSION['api']["valoldcustomer"] = $_POST["valoldcustomer"];
    if (isset($_POST["valquote"]))  $_SESSION['api']["valquote"] = $_POST["valquote"];
    if (isset($_POST["valbooking"]))  $_SESSION['api']["valbooking"] = $_POST["valbooking"];
    if (isset($_POST["selOptions"]))  $_SESSION['api']["selOptions"] = $_POST["selOptions"];
    if (isset($_POST["CustomerData"]))  $_SESSION['api']["CustomerData"] = $_POST["CustomerData"];
    if (isset($_POST["ReservationRef"]))  $_SESSION['api']["ReservationRef"] = $_POST["ReservationRef"];
    if (isset($_POST["ReservationNo"]))  $_SESSION['api']["ReservationNo"] = $_POST["ReservationNo"];
    if (isset($_POST["BookingType"]))  $_SESSION['api']["BookingType"] = $_POST["BookingType"];
    get_header();  
?>
<script type="text/javascript" language="javascript">
    //paste this code under head tag or in a seperate js file.
    // Wait for window load
    $(window).load(function () {
      // Animate loader off screen
      $(".se-pre-con").fadeOut("slow");
    });
</script>
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
    	document.getElementById("lblResNo").innerHTML = "Booking Reference Number:<strong>" + document.getElementById("ReservationNo").value + "</strong>";

      var ifrm = document.getElementById("frmAuric");
      ifrm.contentWindow.document.write("<center><img src='<?php echo get_template_directory_uri(); ?>/images/Loading_White.gif' alt='Loading....'><br/>Loading...</center>");
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
    });

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
      ifrm.src = "<?php echo get_template_directory_uri() ?>/lock.htm";
    }

    function gotoConfirmation() {
      document.getElementById("frmStep4").submit();
    }

    var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
    var eventer = window[eventMethod];
    var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";

    // Listen to message from child window needed for vault page
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
<div class="top-content">

    <div class="inner-bg">
      <div class="container">
      <div class="row">
          <div class="col-sm-12" id="rent-details">
             <article>
        <ol>
            <li>Booking Dates</li>
            <li>SELECT CAR</li>
            <li class="act">SELECT OPTIONS</li>
            <li>REVIEW &amp; BOOK</li>
        </ol>
            </article>
            
            
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <div id="progress-bar">
              <div id="progress-bar-steps">
                <div class="progress-bar-step done">
                    <a href="<?php echo home_url(); ?>">
                  <div class="step_number">1</div>
                  <div class="step_name">Request</div>
                </a>
                </div>
                <div class="progress-bar-step done">
                <a href="<?php echo site_url(); ?>/step2">
                  <div class="step_number">2</div>
                  <div class="step_name">Select</div>
                </a>
                </div>
                <div class="progress-bar-step done">
                  <div class="step_number">3</div>
                  <div class="step_name">Extras</div>
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
                          <img src="<?php echo get_template_directory_uri(); ?>/images/padlock.png" width="32" height="32" />
                        </td>
                        <td style="width: 80%; text-align: center" nowrap="nowrap">
                          <span id="lblHeaderTxt">Secure Credit Card Payment</span>
                        </td>
                        <td style="padding-left: 5px; text-align: right;" id="td_Card">
                          <img src="<?php echo get_template_directory_uri(); ?>/images/visa_mastercard.jpg" width="100" height="32" />
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
                          <img src="<?php echo get_template_directory_uri(); ?>/images/Loading_White.gif" alt="Confirming" />
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
                          <img src='<?php echo get_template_directory_uri(); ?>/images/Auric.png' /><br />
                          Secured by www.auricsystems.com<br />
                          Auric Systems is a Level 1 PCI DSS Validated Service Provider.
                        </td>
                        <td style="padding-left: 5px; vertical-align: bottom; text-align: right;">
                          <img src="<?php echo get_template_directory_uri(); ?>/images/pci_dss.png" />
                        </td>
                      </tr>
                    </table>
                      </div>
                </div>
            </div>
          </div>
        </div>
        <div class="row"><div class="col-sm-12">&nbsp;</div></div>

        <form id="frmStep4" name="frmStep4" action="<?php echo site_url(); ?>/step4" method="post">
          <input type='hidden' name='CategoryTypeID' id='CategoryTypeID' value='<?php echo $_SESSION['api']["CategoryTypeID"]; ?>'>
          <input type='hidden' name='PickupLocationID' id='PickupLocationID' value='<?php echo $_SESSION['api']["PickupLocationID"]; ?>'>
          <input type='hidden' name='DropOffLocationID' id='DropOffLocationID' value='<?php echo $_SESSION['api']["DropOffLocationID"]; ?>'>
          <input type='hidden' name='PickupDate' id='PickupDate' value='<?php echo $_SESSION['api']["PickupDate"]; ?>'>
          <input type='hidden' name='PickupTime' id='PickupTime' value='<?php echo $_SESSION['api']["PickupTime"]; ?>'>
          <input type='hidden' name='ReturnDate' id='ReturnDate' value='<?php echo $_SESSION['api']["ReturnDate"]; ?>'>
          <input type='hidden' name='ReturnTime' id='ReturnTime' value='<?php echo $_SESSION['api']["ReturnTime"]; ?>'>
          <input type='hidden' name='Age' id='Age' value='<?php echo $_SESSION['api']["Age"]; ?>'>
          <input type='hidden' name='RateID' id='RateID' value='<?php echo $_SESSION['api']["RateID"]; ?>'>
          <input type='hidden' name='CarSizeID' id='CarSizeID' value='<?php echo $_SESSION['api']["CarSizeID"]; ?>'>
          <input type='hidden' name='choosetext' id='choosetext' value='Check the following entries:'>
          <input type='hidden' name='valoldcustomer' id='valoldcustomer' value='<?php echo $_SESSION['api']["valoldcustomer"]; ?>'>
          <input type='hidden' name='valquote' id='valquote' value='<?php echo $_SESSION['api']["valquote"]; ?>'>
          <input type='hidden' name='valbooking' id='valbooking' value='<?php echo $_SESSION['api']["valbooking"]; ?>'>
          <input type='hidden' name='selOptions' id='selOptions' value='<?php echo $_SESSION['api']["selOptions"]; ?>'>
          <input type='hidden' name='CustomerData' id='CustomerData' value='<?php echo $_SESSION['api']["CustomerData"]; ?>'>
          <input type='hidden' name='Insurance' id='Insurance' value='<?php echo $_SESSION['api']["Insurance"]; ?>'>
          <input type='hidden' name='ExtraKmOut' id='ExtraKmOut' value='<?php echo $_SESSION['api']["ExtraKmOut"]; ?>'>
          <input type='hidden' name='ReservationRef' id='ReservationRef' value='<?php echo $_SESSION['api']["ReservationRef"]; ?>'>
          <input type='hidden' name='ReservationNo' id='ReservationNo' value='<?php echo $_SESSION['api']["ReservationNo"]; ?>'>
          <input type='hidden' name='BookingType' id='BookingType' value='<?php echo $_SESSION['api']["BookingType"]; ?>'>
          <input type='hidden' name='refid' id='refid' value='<?php echo $_SESSION['api']["refid"]; ?>'>
        </form>
      </div>
    </div>
  </div>
  </div>
<?php get_footer(); ?>
