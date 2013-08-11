// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap/alert
//= require bootstrap.min
//= require jquery.onecarousel.min
//= require jquery.prettyPhoto
//= require jquery.fitvids
//= require jquery-fileupload
//= require taiwan_city_dists_helper
//= require tag-it

function dismissAlertAfterTime(timespan) {
  $('.alert').each(function(i, e) {
    if($(e).find('.close').length > 0) setTimeout(function() {
     $(e).alert('close');
    }, timespan);
  });
}

function insertAutoDismissAlert(notice_message) {
  $(notice_message).insertBefore(".container .content");
  dismissAlertAfterTime(3000);
}

dismissAlertAfterTime(3000);