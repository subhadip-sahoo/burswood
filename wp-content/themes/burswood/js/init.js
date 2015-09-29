/*jslint browser: true, white: true, vars: true, plusplus: true, regexp: true, indent: 4, maxerr: 50 */
/*global $, jQuery, FastClick*/
$ = jQuery;
var hash = window.location.hash;
var supportsTouch = false;
if (window.hasOwnProperty('ontouchstart') || window.navigator.msPointerEnabled) { supportsTouch = true; }
var TouchClickEvent = supportsTouch ? 'touchstart' : 'click';
function footer(e){
    "use strict";
    $('.footix').height($('footer').outerHeight());
}
function ww(){
    'use strict';
    return document.body.clientWidth;
}
$(document).ready(function () {
    "use strict";
    $(this).on('click', '.wpcf7-not-valid-tip', function(){
        $(this).prev().trigger('focus');
        $(this).fadeOut(500,function(){
            $(this).remove();
        });
    });

    // initialize input widgets first
    $('.js-datepair .time').timepicker({
        'showDuration': true,
        'timeFormat': 'g:ia'
    });

    $('.js-datepair .date').datepicker({
        'format': 'dd M, yyyy',
        'autoclose': true
    });

    // initialize datepair
    $('.js-datepair').datepair();

    $('.booking_form select').selbel();

    //extra options logic
    $('.exbox input[type="checkbox"]').on('change', function(){
        var num = $(this).closest('tr').find('input[type="number"]');
        if (this.checked) {
            num.val('1').focus();
        } else {
            num.val('').blur();
        }
    });
    $('.extras input[type="number"]').on('change keyup', function(){
        var input = $(this).closest('tr').find('.exbox input'),
            val = $(this).val();
        if (val === '0') {
            input.prop('checked', false);
            $(this).val('');
        } else {
            input.prop('checked', true);
        }
    });
    $(document).delegate('.extras span.qt-change', 'click', function(){
        var t = $(this),
            input = t.parent().find('input'),
            val = Number(input.val());
        if(t.hasClass('pl')) {
            parseInt(input.val(val + 1), 1);
            input.trigger('change');
        } else if(t.hasClass('mn') && val.length !== '' && val > 0) {
            parseInt(input.val(val - 1), 1);
            input.trigger('change');
        }
    });

});

$(window).load(function(){
    "use strict";
    footer();
    FastClick.attach(document.body);
//    equalHeight('.content > *');
});
$(window).bind('orientationchange resize', function(){
    "use strict";
    footer();
//    $('.content > *').removeAttr('style');
});
$(window).resizeEnd(function(){
    "use strict";
//    equalHeight('.content > *');
});
