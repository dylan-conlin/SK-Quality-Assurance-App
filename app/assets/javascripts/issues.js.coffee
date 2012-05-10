# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

 $("a.iframe").fancybox({
    'transitionIn'    :    'elastic',
    'transitionOut'    :    'elastic',
    'speedIn'        :    100,
    'speedOut'        :    200,
    'overlayShow'    :    false
  });

  $("#iframe").fancybox();

