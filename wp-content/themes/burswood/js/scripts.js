
$(document).ready(function () {

  /*
  Fullscreen background
  */
  /*$.backstretch("assets/img/backgrounds/1.jpg");*/

  $('#top-navbar-1').on('shown.bs.collapse', function () {
    $.backstretch("resize");
  });
  $('#top-navbar-1').on('hidden.bs.collapse', function () {
    $.backstretch("resize");
  });

  /*
  Form validation
  */
  $('.registration-form input[type="text"], .registration-form textarea').on('focus', function () {
    $(this).removeClass('input-error');
  });

  $('.registration-form').on('submit', function (e) {

    $(this).find('input[type="text"], textarea').each(function () {
      if ($(this).val() == "") {
        e.preventDefault();
        $(this).addClass('input-error');
      }
      else {
        $(this).removeClass('input-error');
      }
    });

  });
	/* Code to change dynamic Logo*/
  var pathname = window.location.pathname; // Returns path only
  var url = window.location.href;     // Returns full URL
  url = url.toLowerCase();
  url = url.replace("ssl", "db");
  var pnt = url.indexOf("db") + 3;
  var rest = url.substring(0, url.indexOf("/", pnt) + 1);
  //document.getElementById("logo").src = rest + 'logo.gif';

});
