<?php 
    /* Template Name: Order */ 
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
<section id="rent-details" class="row cfx">
    <aside>
        <?php booking_form(); ?>
        <div class="checked-car">
            <div class="bg_title">SUZUKI ALTO</div>
            <figure>
                <img alt="" src="<?php echo theme('images/tmp/car-img.jpg'); ?>">
            </figure>
            <div class="price">
                <mark><sup>$</sup>25</mark>
                <div class="pd">
                    <strong>Per Day</strong>
                    <span>(For 4 Days)</span>
                </div>
            </div>
            <table>
                <td>4 days @ $25AUD (per day)</td>
                <td><a href="#">change car</a></td>
            </table>
        </div>
        <div class="checked-options">
            <div class="bg_title">EXTRA OPTIONS</div>
            <ul>
                <li>Baby Capsule x 2 @ $5 a day</li>
                <li>Baby Seat x 2 @ $3 a day</li>
            </ul>
            <table>
                <td></td>
                <td><a href="#">change options</a></td>
            </table>
        </div>

    </aside>
    <article>
        <ol>
            <li>Booking Dates</li>
            <li class="act">SELECT CAR</li>
            <li>SELECT OPTIONS</li>
            <li>REVIEW &amp; BOOK</li>
        </ol>

        <!-- STEP 2 -->
        <h1><strong>Step 2</strong> Please Select Your Car</h1>

        <div class="list-cars">
           <?php for($i = 0;$i < 3; $i++) { ?>
            <div>
                <h3><strong>SUZUKI ALTO</strong> An economical city car, 4.8lt/100km</h3>
                <div class="info cfx">
                    <figure class="alignleft">
                        <img src="<?php echo theme('images/tmp/car-img.jpg'); ?>" alt="" />
                    </figure>
                    <div>
                        <ul>
                            <li>Best Value</li>
                            <li>Low Fuel Consumption</li>
                            <li>Electronic Stability Control</li>
                            <li>Australia's "Greenest" Car</li>
                        </ul>
                    </div>
                    <div class="price">
                        <mark><sup>$</sup>25</mark>
                        <div class="pd">
                            <strong>Per Day</strong>
                            <span>(For 4 Days)</span>
                        </div>
                    </div>
                </div>
                <div class="action">
                    <div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <i class="icon-m"></i>
                                        <i class="icon-m"></i>
                                        <i class="icon-m"></i>
                                    </td>
                                    <td>
                                        <i class="icon-l"></i>
                                        <i class="icon-l"></i>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <a href="#" class="button sl">SELECT CAR</a>
                        </div>
                        <div>
                            <a href="#" class="button gray">Details...</a>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>

        <!-- STEP 3 -->
        <h1><strong>Step 3</strong> Please Select Your Options</h1>

        <div class="options">
            <h3>Select Any Extra Options You Would Like to Have With Your Vehicle</h3>

            <div class="extras">
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>Description</th>
                        <th>PRICE</th>
                        <th class="qt">QTY</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Baby Capsule</td>
                        <td>$5 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Baby Seat</td>
                        <td>$3 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Baby Stroller (lightweight)</td>
                        <td>$1 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Booster Seat</td>
                        <td>$3 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Deck Chairs</td>
                        <td>$1 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Driver Under 25@ $5.00/day</td>
                        <td>$5 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>DVD Player (Portable)</td>
                        <td>$5 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Extra Driver</td>
                        <td>$2 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>Extra Windscreen &amp; Tyre Cover</td>
                        <td>$3 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>GPS Navigation System</td>
                        <td>$5 a day</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>34 Litre Cooler (Esky)</td>
                        <td>$7.50 fixed</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="exbox"><input type="checkbox" /><span></span></label></td>
                        <td>45 Litre Cooler (Esky)</td>
                        <td>$10 fixed</td>
                        <td>
                            <span class="qt-change mn">-</span>
                            <input type="number">
                            <span class="qt-change pl">+</span>
                        </td>
                    </tr>

                </tbody>
            </table>
            </div>

            <h3 class="dark">Select to reduce your liability</h3>
            <div class="extras">
                <label class="radio-box"><input type="radio" name="rl" /><span><strong>PREMIUM COVER</strong> - Collision Damage Waiver Reduced To $300@ $9/day</span></label>
                <label class="radio-box"><input type="radio" name="rl" /><span><strong>SUPREME COVER</strong> - Collision Damage Waiver Reduced To Nil@ $12/day</span></label>
                <label class="radio-box"><input type="radio" name="rl" /><span><strong>STANDARD COVER</strong> - Collision Damage Responsibility $2000</span></label>
            </div>

            <h3 class="dark">Select Kms Option</h3>
            <div class="extras">
                <label class="radio-box"><input type="radio" name="kms" /><span>200 Kms free per day, additional per Kms $0.25</span></label>
            </div>
        </div>

        <!-- STEP 4 -->
        <h1><strong>Step 3</strong> Review &amp; Book</h1>

        <h3 class="dark">Confirm Quote &amp; Enter Personal Information</h3>

        <div class="confirm">
            <div class="bc">
                <table>
                    <tr>
                        <td>Pickup Location:</td>
                        <td>*Burswood Perth Depot</td>
                    </tr>
                    <tr>
                        <td>Pickup Date Time:</td>
                        <td>Sunday, 7/Jun/2015 09:00</td>
                    </tr>
                    <tr>
                        <td>Return Location:</td>
                        <td>*Burswood Perth Depot</td>
                    </tr>
                    <tr>
                        <td>Return Date Time:</td>
                        <td>Wednesday, 10/Jun/2015 09:00</td>
                    </tr>
                    <tr>
                        <td>Vehicle Type:</td>
                        <td>Suzuki Alto</td>
                    </tr>
                </table>
            </div>
            <div class="incart">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <strong>Standard Rates</strong><br />
                                200 Kms free per day,<br />
                                additional per Kms $0.25
                            </td>
                            <td>3 Days @ AU$31.00</td>
                            <td>$93.00</td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Baby Capsule</strong>
                            </td>
                            <td>Daily at $3.00</td>
                            <td>$9.00</td>
                        </tr>
                        <tr>
                            <td>
                                <strong>STANDARD COVER</strong> - Collision Damage Responsibility $2000
                            </td>
                            <td>Daily at $0.00</td>
                            <td>$0.00</td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Stamp Duty Recovery Fee</strong>
                            </td>
                            <td></td>
                            <td>$1.12</td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Vehicle Rego and Admin Fee</strong>
                            </td>
                            <td></td>
                            <td>$7.44</td>
                        </tr>
                        <tr>
                            <td>
                                <strong>GST</strong>
                            </td>
                            <td></td>
                            <td>$10.94</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">Total Estimate of Charges</td>
                            <td>$AU121.50</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <h3 class="dark">Ree-nterl Information</h3>
            <form class="checkout-form">
                <div class="cfx">
                    <div class="alignleft"><label>First Name:</label><input type="text" name="f_name" /></div>
                    <div class="alignright"><label>Last Name:</label><input type="text" name="l_name" /></div>
                </div>
                <div class="cfx">
                    <label>*DOB:</label>
                    <input type="text" name="dob" />
                </div>
                <div class="cfx">
                    <div class="alignleft"><label>*License No:</label><input type="text" name="license" /></div>
                    <div class="alignright"><label>*Expiry Date:</label><input type="text" name="expiry" /></div>
                </div>
                <div class="cfx">
                    <label>* Address:</label>
                    <div class="alignleft"><input type="text" name="address" placeholder="Address" /></div>
                    <div class="alignright"><input type="text" name="city" placeholder="City" /></div>
                    <div class="clear"></div>
                    <div class="alignleft"><input type="text" name="state" placeholder="State/Province" /></div>
                    <div class="alignright"><input type="text" name="zip" placeholder="Postcode/ZIP" /></div>
                    <div class="clear"></div>
                    <input type="text" name="country" placeholder="Country of Residence" />
                </div>
                <div class="cfx">
                    <label>Email Address:</label>
                    <input type="text" name="email" />
                </div>
                <div class="cfx">
                    <label>Phone Numbers</label>
                    <input type="text" placeholder="*Phone (incl area code)" />
                    <input type="text" placeholder="*Mobile Phone No." />
                </div>
                <div class="cfx">
                    <div class="alignleft"><label>Arrival FLT:</label><input type="text" name="arrival" /></div>
                    <div class="alignright"><label>Departure FLT:</label><input type="text" name="depature" /></div>
                </div>
                <label>Additional Details:</label>
                <textarea name="details"></textarea>

                <a href="#" class="button gray">back</a>
                <a href="#" class="button sl">REQUEST BOOKING</a>
                <a href="#" class="button sl">EMAIL QUOTE</a>

            </form>
        </div>

    </article>
</section>
<?php get_footer(); ?>
