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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require tinymce
//= require masonry/jquery.masonry
//= require easy-emoji
//= require emoji-normal
//= require_tree .



$('textarea').textcomplete([{
    match: /(^|\b)(\w{2,})$/,
    search: function (term, callback) {
        var words = ['google', 'facebook', 'github', 'microsoft', 'yahoo'];
        callback($.map(words, function (word) {
            return word.indexOf(term) === 0 ? word : null;
        }));
    },
    replace: function (word) {
        return word + ' ';
    }
}]);

$(window).scroll(function(){

  var scroll = $(window).scrollTop();

  if (scroll > 0 ) {
    $('.footer').addClass('scrolled');
  }

  if (scroll <= 0 ) {
    $('.footer').removeClass('scrolled');
 }

});



