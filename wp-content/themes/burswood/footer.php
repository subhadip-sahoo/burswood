<div class="footix"></div>
</div>
<footer>
    <div class="row cfx"><?php the_field('footer', 'option'); ?></div>
</footer>
<script src="<?php echo get_template_directory_uri();?>/js/bootstrap.min.js"></script>
<script src="<?php echo get_template_directory_uri();?>/js/jquery.backstretch.min.js"></script>
<script src="<?php echo get_template_directory_uri();?>/js/retina-1.1.0.min.js"></script>
<script src="<?php echo get_template_directory_uri();?>/js/scripts.js"></script>
<script src="<?php echo get_template_directory_uri();?>/js/run_prettify.js"></script>
<link href="<?php echo get_template_directory_uri();?>/style/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<script src="<?php echo get_template_directory_uri();?>/js/bootstrap-dialog.min.js"></script>
<?php wp_footer(); ?>
<script type="text/javascript">
    /*
    (function($){
        $(function(){
            $('input[type=radio][name=age]').change(function(){
                if($(this).is(':checked')){
                    var driverAgeRadio = $(this).val();
                    $('select#cmbAge option').each(function(){
                        if($(this).attr('value') == driverAgeRadio){
                            $(this).siblings().removeAttr('selected');
                            $(this).attr('selected', 'selected');
                        }
                    });
                }
            });
        });
    })(jQuery);
    */
</script>
</body>
</html>
<?php //ob_end_flush() ?>
