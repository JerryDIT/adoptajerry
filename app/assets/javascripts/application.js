// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require modernizr-history
//= require modernizr-svg
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.expander
//= require jquery-addrule
//
//= require sugar
//= require bootstrap
//= require turbolinks
//
//= require moment
//
//= require angular
//= require ngstorage
//= require angular-bootstrap
//= require angular-local-storage
//= require angular-cache
//= require angular-sanitize
//= require angular-timeline
//= require angular-moment
//= require angular-translate
//= require angular-translate-loader-static-files
//= require angular-filter
//= require angular-http-auth
//= require humps
//= require textAngular-rangy
//= require textAngular
//= require ng-file-upload
//= require angular-growl-v2
//
//= require angular-rails-templates
//= require_tree ../templates
//
// apiCheck must appear before formly
//= require api-check
//= require angular-formly
//= require angular-formly-templates-bootstrap
//
//= require app/init
//= require_tree ./app
//=
//= require smooth-anchor-scrolling

function loginViaEmail() {
  navigator.id.get(function(assertion) {
    if (assertion) {
      $('input[name=assertion]').val(assertion);
      $('#browser_id_form').submit();
    } else {
      window.location = "#{failure_path}"
    }
  });
}

$(function() {
  $('#browser_id_form button').click(function() {
    loginViaEmail();
    return false;
  });
});
