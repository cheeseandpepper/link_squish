$( document ).on('turbolinks:load', function() {
  setTimeout(function(){
    $('.alert').fadeOut();
  }, 2000);
})