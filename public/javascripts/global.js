$(document).ready(function() {
  $('a[href=#header]').click(function(){
    $('html, body').animate({scrollTop:0}, 'slow');
    return false;
  });
});
