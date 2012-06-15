# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

 $('a.iframe').fancybox({
   'transitionIn'    :    'elastic',
   'transitionOut'    :    'elastic',
   'speedIn'        :    100,
   'speedOut'        :    200,
   'width':100,
   'height':100,
   'autoScale':'true',
   'overlayShow'    :    false
   });
 $("#iframe").fancybox();

 $('#issue_foreign_object_id').hide();
 $('label[for=issue_foreign_object_id], input#issue_foreign_object_id').hide();
 $('#issue_gmp_id').change ->
    gmp = $('#issue_gmp_id :selected').text()

    if gmp == 'Foreign Object'
      $('#issue_foreign_object_id').show();
      $('label[for=issue_foreign_object_id], input#issue_foreign_object_id').show();
      $('#issue_foreign_object_id').val('0');
    else
      $('#issue_foreign_object_id').hide();
      $('label[for=issue_foreign_object_id], input#issue_foreign_object_id').hide();
      $('#issue_foreign_object_id').val('17');