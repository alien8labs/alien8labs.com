$(document).ready(function() {
  $(window).infinitescroll({
    url: '/articles',
    triggerAt: 300,
    appendTo: 'div#main'
  });

  $('div#main').bind('infinitescroll.beforesend', function() {
    $('#articles-loading').slideDown(700);
  });

  $('div#main').bind('infinitescroll.finish', function() {
    $('#articles-loading').slideUp(700);
  });

  $('div#main').bind('infinitescroll.maxreached', function() {
    $('#articles-loading').remove();
  });
});
