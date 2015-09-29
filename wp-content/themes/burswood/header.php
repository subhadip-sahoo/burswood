<?php
    header('Expires: '.gmdate('D, d M Y H:i:s \G\M\T', time() + 3600));
    header('Content-Type: text/html; charset=utf-8');
    header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
    header('X-UA-Compatible: IE=Edge,chrome=1');
    //ob_start('ob_html_compress');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php seo_title(); ?></title>
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="True"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <?php wp_head(); ?>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head>
<body <?php body_class(); ?> data-ajax="<?php echo site_url('/a/'); ?>">
<div id="wrap">
    <header>
        <div class="row cfx">
            <a href="<?php echo site_url('/'); ?>" class="logo"></a>
            <div class="topbar">
                <nav class="frst-nav cfx">
                    <?php wp_nav_menu(array('container' => false, 'items_wrap' => '<ul id="%1$s">%3$s</ul>', 'theme_location'  => 'top_menu')); ?>
                    <?php if(get_field('phone', 'option')) : ?>
                    <a href="tel:+<?php echo str_replace( array('-', ' ', '_'), '', get_field('phone', 'option') ); ?>" class="phone"><span>Free call</span><?php the_field('phone', 'option'); ?></a>
                    <?php endif; ?>
                </nav>
                <nav class="cfx">
                    <?php wp_nav_menu(array('container' => false, 'items_wrap' => '<ul id="%1$s">%3$s</ul>', 'theme_location'  => 'primary_menu')); ?>
                </nav>
            </div>
        </div>
    </header>
