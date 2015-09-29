<?php 
session_start();
if(!isset($_SESSION['api'])){
    $_SESSION['api'] = array(
        'CategoryTypeID' => '',
        'PickupLocationID' => '',
        'DropOffLocationID' => '',
        'PickupDate' => '',
        'PickupTime' => '',
        'ReturnDate' => '',
        'ReturnTime' => '',
        'Age' => '',
        'refid' => '',
        'PromoCode' => '',
        'RateID' => '',
        'CarSizeID' => '',
        'valoldcustomer' => '',
        'valquote' => '',
        'valbooking' => '',
        'selOptions' => '',
        'CustomerData' => '',
        'Insurance' => '',
        'ExtraKmOut' => '',
        'ReservationRef' => '',
        'ReservationNo' => '',
        'BookingType' => '',
        'firstname' => '',
        'lastname' => '',
        'email' => '',
        'phone' => ''
    );
}
get_header();
$thumb = wp_get_attachment_image_src( get_post_thumbnail_id($post->ID), 'full' );
$src = $thumb['0'];
?>
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
        oAPI.LoadCategoryType(document.getElementById("cmbCatType"), '<?php echo $_SESSION['api']["CategoryTypeID"]; ?>');
        //oAPI.LoadAgeList(document.getElementById("cmbAge"), '<?php echo $_SESSION['api']["Age"]; ?>');
        oAPI.LoadLocationsList(document.getElementById("cmbPickup"), document.getElementById("cmbDropOff"), document.getElementById("cmbAge"), '<?php echo $_SESSION['api']["PickupLocationID"]; ?>', '<?php echo $_SESSION['api']["DropOffLocationID"]; ?>');

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
      $('#txtPickupTime').val('<?php echo $_SESSION['api']["PickupTime"]; ?>' == '' ? "10:00" : '<?php echo $_SESSION['api']["PickupTime"]; ?>');
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
      $('#txtReturnTime').val('<?php echo $_SESSION['api']["ReturnTime"]; ?>' == '' ? "10:00" : '<?php echo $_SESSION['api']["ReturnTime"]; ?>');
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
      $('#txtPickup').val('<?php echo $_SESSION['api']["PickupDate"]; ?>' == '' ? rcmGetdate(startPickup + PickUpOffset) : '<?php echo $_SESSION['api']["PickupDate"]; ?>');
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
        $('#txtReturn').val('<?php echo $_SESSION['api']["ReturnDate"]; ?>' == '' ? rcmGetdate(startDropOff + DropOffOffset) : '<?php echo $_SESSION['api']["ReturnDate"]; ?>');
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
<div class="bnnr">
    <div class="row cfx">
        <div class="form_row">
            <?php booking_form('step1'); ?>
        </div>
        <article>
            <h1><?php the_field('title'); ?></h1>
            <?php if($features = get_field('features')) : ?>
            <ul class="features">
            <?php foreach($features as $fe){
                echo '<li>' . $fe['row'] . '</li>';
            } ?>
            </ul>
            <?php endif; ?>

            <?php if($cars = get_field('cars')) : ?>
            <div class="cars">
            <?php foreach($cars as $car){ ?>
                <a href="<?php echo $car['link']; ?>" style="top: <?php echo $car['position_top']; ?>px; left: <?php echo $car['position_left']; ?>px;">
                    <img src="<?php echo $car['image']; ?>" alt="Burswood Car Rentals" />
                </a>
            <?php } ?>
            </div>
            <?php endif; ?>
            <?php if(get_field('quote')) echo '<h5>' . get_field('quote'). '</h5>'; ?>
        </article>
    </div>
</div>
<?php if($services = get_field('services')) : ?>
<div class="services row cfx">
    <div>
    <?php foreach($services as $serv){
        $output = ''; ?>
        <div<?php echo $serv['background']?' class="with-bg" style="background-image: url('.$serv['background'].')"':''; ?>>
            <?php if(!$serv['content']) {
                $output .= '<div class="wr cfx">';
                $output .= $serv['link']?'<a href="'.$serv['link'].'">':'';
                $output .= $serv['icon']?'<img src="' . $serv['icon'] . '" alt="' . $serv['title'] . '" />':'';
                $output .= $serv['title']?'<span>' . $serv['title'] . '</span>':'';
                $output .= $serv['link']?'</a>':'';
                $output .= '</div>';
            } else {
                $output .= '<div class="wr cfx">' . $serv['content'] . '</div>';
            }
            echo $output;
            ?>
        </div>
    <?php } ?>
    </div>
</div>
<?php endif; ?>
<div class="homecontent row cfx">
    <article>
        <div style="background-image: url(<?php echo $src; ?>)"></div>
        <?php if ( have_posts() ) : while ( have_posts() ) : the_post();
            the_content();
        endwhile; endif; ?>
    </article>
    <aside>
        <?php if($custom_sidebar = get_field('custom_sidebar')):
        foreach($custom_sidebar as $cs){ ?>
        <div>
            <?php echo $cs['title']?'<h3>' . $cs['title'] . '</h3>':''; ?>
            <div class="<?php echo $cs['background_position']; ?>" style="background-image: url(<?php echo $cs['background_image']; ?>)"><?php echo $cs['content']; ?></div>
        </div>
        <?php }
        endif; ?>
    </aside>
    <div class="clear"></div>
    <?php
    $map = get_field('map');
    $contact = get_field('contact_info'); ?>
    <div class="contact-info cfx">
        <?php echo $map?'<div class="map_wrap alignleft">'.do_shortcode('[googlemap height="275px" coordinates="' . $map['lat'] . ', ' . $map['lng'] . '" infobox="' . $map['address'] . '"]').'</div>':''; ?>
        <?php echo $contact?'<div>' . $contact . '</div>':''; ?>
    </div>
    <?php if($reviews = get_field('testimonials')):
    $item = $reviews[rand(0, count($reviews) - 1)];

    $rating = $item['stars'];

    $newrating =  $rating - floor($rating);
    $rating = floor($rating);
    $rating_res = '';
    for ($i = 1; $i <= $rating; $i++) {
        $rating_res .= '<i class="icon-star"></i>';
        if($i == $rating) {
            if($newrating > 0.25 && $newrating <= 0.75 ) {
                $rating_res .= "<i class='icon-star half'></i>";
            } elseif($newrating > 0.75) {
                $rating_res .= "<i class='icon-star'></i>";
            }
        }
    } ?>
    <div class="rand-review">
        <div class="t">Testimonial</div>
        <hr />
        <blockquote><?php echo $rating_res; ?><?php echo $item['content']; ?><cite><?php echo $item['author']; ?></cite></blockquote>

    </div>
    <?php endif; ?>
</div>
<?php get_footer(); ?>
