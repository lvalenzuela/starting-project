# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#slider-range").slider
    range: true
    min: 0
    max: 500
    values: [75, 300]
    slide: (event, ui) ->
      $(".slider-label-left").text  ui.values[0]
      $(".slider-label-right").text ui.values[1]
    change: (event, ui) ->
      $('#search_form').submit()
      

  $(".slider-label-left").text  $("#slider-range").slider("values", 0)
  $(".slider-label-right").text $("#slider-range").slider("values", 1)
  