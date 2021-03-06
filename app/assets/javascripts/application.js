// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require custom
//= require rails-ujs
//= require semantic-ui
//= require jquery-ui/widgets/datepicker
//= require activestorage
//= require turbolinks
//= require_nested_form_fields
//= require sweetalert
//= require cable
//= require bootstrap.min
//= require popper.min
//= require bootstrap-popover-x
//= dataTables.bootstrap4.min
//= require jquery.dataTables.min
//= require_tree .

$(document).ready(function(){
    $( "#datepicker" ).datepicker();
  });
