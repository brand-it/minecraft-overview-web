// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Also not this file is also only to be called on the map rendering page. There is no point in loading all the 
// JS on a page that is not needed.
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
//= require underscore.js
//= require backbone.js
//= require bootstrap.js
//= require_tree .

$(document).ready(function(){
    overviewer.util.initialize();
});