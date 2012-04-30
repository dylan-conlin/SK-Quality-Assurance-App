# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("#example").popover({placement:'top'})
  $('#prettytable').dataTable({
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
  });
  $.extend( $.fn.dataTableExt.oStdClasses, {
      "sSortAsc": "header headerSortDown",
      "sSortDesc": "header headerSortUp",
      "sSortable": "header"
  } );
