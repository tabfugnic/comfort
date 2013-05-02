# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class Topic
  contstructor: ->

  adjustPriorityMeter: ->
    cIndex = 100 - parseInt($("#comfort-index").val())
    iIndex = parseInt($("#interest-index").val())
    pIndex = (cIndex + iIndex) / 2
    $("#priority-meter").attr("value", pIndex)
    $("#priority-index").text pIndex


  adjustComfortMeter: ->
    $("#comfort-meter").attr("value", parseInt($("#comfort-index").val()))

  adjustInterestMeter: ->
    $("#interest-meter").attr("value", parseInt($("#interest-index").val()))

  trackIndex: =>
    $("#interest-index, #comfort-index").on "change", (event) =>
      this.adjustComfortMeter()
      this.adjustInterestMeter()
      this.adjustPriorityMeter()

window.Topic = Topic
