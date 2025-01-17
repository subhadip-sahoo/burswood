<?php
/**
 * Options Page
 *
 * @package   Quick_Featured_Images_Admin
 * @author    Martin Stehle <m.stehle@gmx.de>
 * @license   GPL-2.0+
 * @link      http://wordpress.org/plugins/quick-featured-images/
 * @copyright 2014 
 */

$qfi_tools_instance    = Quick_Featured_Images_Tools::get_instance();
$qfi_defaults_instance = Quick_Featured_Images_Defaults::get_instance();
$qfi_settings_instance = Quick_Featured_Images_Settings::get_instance();
?>

<h3><?php _e( 'Manage featured images in a quick way', $this->plugin_slug ); ?></h3>
<p><?php echo $this->get_page_description(); ?></p>
<ul>
<?php
	/** 
	 * Bulk Edit Page Item
	 *
	 */
?>
	<li>
		<h4><?php echo $qfi_tools_instance->get_page_headline(); ?></h4>
<?php
if ( current_user_can( $qfi_tools_instance->get_required_user_cap() ) ) {
	printf( 
		'		<p><a href="%s"><span class="dashicons dashicons-admin-tools"></span><br />%s</a></p>',
		admin_url( sprintf( 'admin.php?page=%s', $qfi_tools_instance->get_page_slug() ) ),
		$qfi_tools_instance->get_page_description()
	);
} else {
?>
		<p><span class="dashicons dashicons-admin-tools"></span><br /><?php echo $qfi_tools_instance->get_page_description(); ?></p>
<?php
}
?>
	</li>
<?php
	/** 
	 * Presets Page Item
	 *
	 */
?>
	<li>
		<h4><?php echo $qfi_defaults_instance->get_page_headline(); ?></h4>
<?php
if ( current_user_can( $qfi_defaults_instance->get_required_user_cap() ) ) {
	printf( 
		'						<p><a href="%s"><span class="dashicons dashicons-images-alt"></span><br />%s</a></p>',
		admin_url( sprintf( 'admin.php?page=%s', $qfi_defaults_instance->get_page_slug() ) ),
		$qfi_defaults_instance->get_page_description()
	);
} else {
?>
		<p><span class="dashicons dashicons-admin-defaults"></span><br /><?php echo $qfi_defaults_instance->get_page_description(); ?></p>
<?php
}
?>
	</li>
<?php
	/** 
	 * Image Columns Page Item
	 *
	 */
?>
	<li>
		<h4><?php echo $qfi_settings_instance->get_page_headline(); ?></h4>
<?php
if ( current_user_can( $qfi_settings_instance->get_required_user_cap() ) ) {
	printf( 
		'						<p><a href="%s"><span class="dashicons dashicons-admin-settings"></span><br />%s</a></p>', 	
		admin_url( sprintf( 'admin.php?page=%s', $qfi_settings_instance->get_page_slug() ) ), 
		$qfi_settings_instance->get_page_description() 
	);
} else {
?>
		<p><span class="dashicons dashicons-admin-settings"></span><br /><?php echo $qfi_settings_instance->get_page_description(); ?></p>
<?php
}
?>
	</li>
	<li>
		<h4><?php _e( 'The premium version', $this->plugin_slug ); ?></h4>
		<p><a href="http://www.quickfeaturedimages.com<?php _e( '/', $this->plugin_slug ); ?>"><img alt="Quick Featured Images Pro" src="<?php echo plugin_dir_url( dirname( dirname( __FILE__ ) ) ); ?>admin/assets/images/logo_qfi_pro.gif" style="width:100%;height:auto;"></a></p>
		<p><?php _e( 'Are you looking for more options and more filters?', $this->plugin_slug ); ?> <?php _e( 'Get the premium version', $this->plugin_slug ); ?> <a href="http://www.quickfeaturedimages.com<?php _e( '/', $this->plugin_slug ); ?>">Quick Featured Images Pro</a>.</p>
	</li>
</ul>

