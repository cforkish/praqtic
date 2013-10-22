# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  window.initAddFields()
  window.initRemoveFields()
  $('.chzn-select').chosen()

window.initAddFields = () ->
  $('.add_fields').on 'click', (event) ->
    newID = $('#next_answer_id').val()
    $('#next_answer_id').val(parseInt(newID)+1)
    regexp = new RegExp($(this).data('id'), 'g')
    $('#answers').append($(this).data('fields').replace(regexp, newID))
    window.initRemoveFields()
    event.preventDefault()

window.initRemoveFields = () ->
  $('.remove_field').on 'click', (event) ->
    $(this).parents('.answer').remove()
    event.preventDefault()
