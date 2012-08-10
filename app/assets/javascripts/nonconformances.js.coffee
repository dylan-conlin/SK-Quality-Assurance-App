# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("a.iframe").fancybox(
    transitionIn: 'elastic'
    transitionOut: 'elastic'
    speedIn: 400
    speedOut: 200
    overlayShow: true
    overlayOpacity: 0.5
    overlayColor: '#333'
    changeSpeed: 100
    changeFade: 200
    hideOnContentClick: true
    titlePosition: 'over'
    onComplete: ->
      $("#fancybox-wrap").hover ->
        $("#fancybox-title").fadeIn()
      , ->
        $("#fancybox-title").fadeOut()
  )

  $(".collapse").collapse({
    toggle: false,
    parent: true
    });

  $('#nonconformance_component_name').autocomplete
      source: $('#nonconformance_component_name').data('autocomplete-source')
    



