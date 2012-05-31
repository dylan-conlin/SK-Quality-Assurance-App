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

 # show/hide foreign objects dropdown based
 # on which GMP is selected

 $('#foreign_object_field').hide(); 
 $('#gmp_select').change ->
     gmp = $('#gmp_select :selected').text()

     if gmp == 'Foreign Object'
     	$('#foreign_object_field').show();
     	$('#foreign_object_field').text('Blood');
     else
        $('#foreign_object_field').hide();










