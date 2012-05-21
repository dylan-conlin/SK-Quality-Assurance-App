# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

 $("a.iframe").fancybox({
    'transitionIn'    :    'elastic',
    'transitionOut'    :    'elastic',
    'speedIn'        :    500,
    'speedOut'        :    500,
    'width':100,
    'height':100,

    'autoScale':'true',
    'overlayShow'    :    false
  });

 $("#iframe").fancybox();


