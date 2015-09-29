<?php

/* BEGIN: Theme config params*/

define ('AJAXSIGN', FALSE);
define ('GOOGLEMAPS', TRUE);
define ('WPFOLDER', 'burswood/php');
define ('HOME_PAGE_ID', get_option('page_on_front'));
define ('BLOG_ID', get_option('page_for_posts'));
define ('POSTS_PER_PAGE', get_option('posts_per_page'));
if(class_exists('Woocommerce')) :
    define ('SHOP_ID', get_option('woocommerce_shop_page_id'));
    define ('ACCOUNT_ID', get_option('woocommerce_myaccount_page_id'));
endif;

/* END: Theme config params */

//Auto-install recommended plugins
require_once('installer/installer.php');

// Run pre-installed plugins
require_once('installer/themer.php');

// Custom shortcodes
require_once('shortcodes.php');

// uncomment if need CPT
//require_once('custom-cpt.php');

// register menus
register_nav_menus(array(
    'primary_menu' => 'Primary navigation',
    'top_menu' => 'Top menu'
));

// Custom images sizes
//add_image_size( 'example_name', '960', '540', true );

//excerpt custom
function gebid($post_id, $num){
    $the_post = get_post($post_id); //Gets post ID
    $the_excerpt = $the_post->post_content; //Gets post_content to be used as a basis for the excerpt
    $excerpt_length = $num; //Sets excerpt length by word count
    $the_excerpt = strip_tags(strip_shortcodes($the_excerpt)); //Strips tags and images
    $words = explode(' ', $the_excerpt, $excerpt_length + 1);
    if(count($words) > $excerpt_length) :
    array_pop($words);
    array_push($words, '...');
    $the_excerpt = implode(' ', $words);
    endif;
    $the_excerpt = '<p>' . $the_excerpt . '</p>';
    return $the_excerpt;
}

//Custom JS/Styles
function tt_add_jscss() {
    if (!is_admin()) {
        wp_deregister_script( 'jquery' );
    }

    wp_deregister_style( 'contact-form-7' );

    if(defined('QTRANS_INIT')) {
        wp_deregister_style('qtranslate-style');
    }

    if(defined('GOOGLEMAPS')) {
        wp_enqueue_script('googlemaps', '//maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false', array(), '', false);
    }

    wp_enqueue_script('jquery', get_template_directory_uri().'/js/jquery-1.9.1.js', array(), '', false);
    wp_enqueue_script('datepicker', get_template_directory_uri().'/js/datepair/bootstrap-datepicker.js', array('jquery'), '1.0', true);
    wp_enqueue_script('timepicker', get_template_directory_uri().'/js/datepair/jquery.timepicker.js', array('jquery'), '1.0', true);
    wp_enqueue_script('datepair', get_template_directory_uri().'/js/datepair/datepair.min.js', array('jquery'), '1.0', true);
    wp_enqueue_script('jquery.datepair', get_template_directory_uri().'/js/datepair/jquery.datepair.min.js', array('jquery'), '1.0', true);
    wp_enqueue_script('libs', get_template_directory_uri().'/js/lib.js', array('jquery'), '1.0', true);
    wp_enqueue_script('init', get_template_directory_uri().'/js/init.js', array('jquery'), '1.0', true);
    wp_enqueue_script('datetimepicker_js', get_template_directory_uri().'/js/jquery.datetimepicker.js', array('jquery'), '1.0', FALSE);
    if(is_page_template('template-step2.php')){
        wp_enqueue_script('form_validation_js', get_template_directory_uri().'/js/form_validation.js', array('jquery'), '1.0', FALSE);
    }
    wp_enqueue_script('rentalcarmanager', 'https://secure20.rentalcarmanager.com.au/api/3.0/main', array('jquery'), '3.0', FALSE);
    wp_enqueue_script('css3animateIt', get_template_directory_uri().'/js/css3animate-it.js', array('jquery'), '1.0', true);

    wp_enqueue_style('bootstarp_css', get_template_directory_uri() . '/assets/bootstrap/css/bootstrap.min.css' );
    wp_enqueue_style('font_awesome_css', get_template_directory_uri() . '/assets/font-awesome/css/font-awesome.min.css' );
    wp_enqueue_style('font_element_css', get_template_directory_uri() . '/assets/css/form-elements.css' );
    wp_enqueue_style('jquery.ui', get_template_directory_uri() . '/js/datepair/jquery-ui.css' );
    wp_enqueue_style('timepicker', get_template_directory_uri() . '/js/datepair/jquery.timepicker.css' );
    wp_enqueue_style('animations', get_template_directory_uri() . '/style/animations.min.css' );
    wp_enqueue_style('datepicker', get_template_directory_uri() . '/js/datepair/bootstrap-datepicker.css' );
    wp_enqueue_style('datetimepicker_css', get_template_directory_uri() . '/style/jquery.datetimepicker.css' );
    wp_enqueue_style('theme_default_style', get_stylesheet_uri() );
    wp_enqueue_style('scss', get_template_directory_uri() . '/style/style.scss');
}
add_action('wp_enqueue_scripts', 'tt_add_jscss');

$bar = array(
    'name'          => 'Blog Sidebar',
    'id'            => 'blogbar',
    'description'   => 'Sidebar for news section',
    'before_widget' => '<div class="widget cfx %2$s">',
    'after_widget'  => '</div>',
    'before_title'  => '<div class="widgettitle">',
    'after_title'   => '</div>'
);
register_sidebar($bar);

if( function_exists('acf_add_options_page') ) {
    acf_add_options_page(array(
        'page_title' => 'Theme Settings',
        'menu_title' => 'Theme Settings',
        'menu_slug' => 'acf-theme-settings',
        'capability' => 'edit_posts',
        'redirect' => false
    ));
    acf_add_options_sub_page(array(
        'page_title' => 'Booking',
        'menu_title' => 'Booking',
        'parent_slug' => 'acf-theme-settings',
    ));
}

//custom ajax-admin.php rewrite
function new_ajax_admin_url() {
    add_rewrite_rule('a/(.*)$','wp-admin/admin-ajax.php/$1','top');
}
add_action('init', 'new_ajax_admin_url', 10, 0);

function get_alt($id){
    $c_alt = get_post_meta($id, '_wp_attachment_image_alt', true);
    $c_tit = get_the_title($id);
    return $c_alt?$c_alt:$c_tit;
}

function tree_children($absolute = false, $page_id = 0) {
    global $post;
    $childlist = get_pages('child_of='.$post->ID);
    $children = '';
    if($post->post_parent) {
        $ancestors = get_post_ancestors($post->ID);
        $reverse = array_reverse($ancestors);
        $abs = $reverse[0];
        $children .= '<ul class="submenu">';
        $children .= wp_list_pages("title_li=&child_of=".$abs."&echo=0&sort_column=menu_order");
        $children .= '</ul>';
        echo $children;
    } elseif($childlist) {
        echo '<ul class="submenu">' . wp_list_pages("title_li=&child_of=".$post->ID."&echo=0&sort_column=menu_order") . '</ul>';
    }
}

function cats($pid){
    $post_categories = wp_get_post_categories($pid);
    $cats = '';
    $co = count($post_categories); $i = 1;
    foreach($post_categories as $c){
        $cat = get_category($c);
        $cats .= '<a href="'.get_category_link($cat->term_id).'">'.$cat->name.'</a>' .($i++ != $co?'<span>,</span> ':'');
    }
    return $cats;
}

function remove_footer_admin () {
    echo 'Powered by <a href="http://www.wordpress.org" target="_blank">WordPress</a> | Theme Developer <a href="http://frontend.im" target="_blank">Tusko Trush</a>';
}
add_filter('admin_footer_text', 'remove_footer_admin');

function booking_form($step = FALSE){
    session_start();
?>
<form class="booking_form" autocomplete="off" action="<?php echo site_url().'/step2/'; ?>" id="frmStep1" method="POST">
        <h2>MAKE A BOOKING <small>/ GET A QUOTE</small></h2>
        <div>
            <label>Pickup Location</label>
            <select name="form-Pickup-Location" id="cmbPickup"></select>
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
            <select name="form-Category-Type" id="cmbCatType"></select> 
            </div>
            <!-- <div class="r_box">
                <label>Age of Youngest Driver</label>
                <select id="cmbAge" name="form-Minimum-Age" onchange="getLocations();"></select>
            </div> -->
            <div class="r_box">
                <mark>Age of Youngest Driver</mark>
                <label><input type="radio" name="form-Minimum-Age1" checked="checked" value="4" onclick="document.getElementById('cmbAge').value=this.value"><span>21-24</span></label>
                <label><input type="radio" name="form-Minimum-Age1" value="9" onclick="document.getElementById('cmbAge').value=this.value"><span>25+</span></label>
                <input type='hidden' name="form-Minimum-Age"  id='cmbAge' value='4'>
            </div>

            <!--<div class="js-datepair cfx r_box">
                <label>Promo-Code (if any)</label>
                <input type="text" name="form-Promo-Code" class="form-Promo-Code form-control" id="txtPromoCode" autocomplete="off">
            </div>-->
            <?php 
                if($step == 'step1'){
                    echo '<button class="btn_next" id="fat-btn">Next Step</button><table><tr><td>NEXT STEP</td><td>Select Your Car & Options</td></tr></table>';
                }else{
                    echo '<div class="reset_quote" id="fat-btn"><p><strong>NEED A DIFFERENT QUOTE?</strong>Change any of the options above or <a href="">click to start again from the beginning\'</a></p></div>';
                } 
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
    
    
<?php }
