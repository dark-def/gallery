# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  jQuery("#fader img:gt(0)").hide()
  setInterval (->
    jQuery("#fader :first-child").fadeTo(500, 0).hide().next("img").fadeTo(500, 1).end().appendTo "#fader"
  ), 5000