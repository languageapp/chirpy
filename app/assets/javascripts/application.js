// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require chat
//= require private_pub
//= require turbolinks
//= require_tree .
//= require angular

$(document).ready(function(){

  $('.flags').mouseenter(function(){
    $(this).css('opacity', 0.5);
  });
  $('.flags').mouseleave(function(){
    $(this).css('opacity', 1);
  });

  $('.flags').click(function(){
    console.log($(this).attr('id'));
  });
});


var app = angular.module('chirpy', []);

app.controller('LanguageFilterController', function() {

  this.test = "Hello, world.";

  this.selectedLanguage = "Spanish";

});








