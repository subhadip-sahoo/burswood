<?php get_header(); ?>
<section class="content row cfx">
    <article>
        <h1><?php the_title(); ?></h1>
        <?php if ( have_posts() ) : while ( have_posts() ) : the_post(); the_content(); endwhile; endif; ?>
    </article>
    <aside>
        <?php booking_form('step1'); ?>
        <?php if($widgets = get_field('widgets')):
            foreach($widgets as $wi) {
                $layout = $wi['acf_fc_layout'];
                echo '<div class="' . $layout . ' cfx">';
                if($layout == 'video') {
                    echo '<div class="fullframe">' . $wi['video'] . '</div>';
                } else if($layout == 'text_button') {
                    echo '<h3>' . $wi['title'] . '</h3><a href="' . $wi['button_link'] . '" class="button gray alignright">' . $wi['button_text'] . '</a>';
                } else if($layout == 'custom_content') {
                    echo ($wi['widget_title']?'<div class="t">' . $wi['widget_title'] . '</div>':'') . $wi['content'];
                }
                echo '</div>';
            }
        endif; ?>
    </aside>
</section>
<?php get_footer(); ?>
