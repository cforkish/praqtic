# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  window.initAddField('answer')
  window.initAddField('lesson')
  $('.chzn-select').chosen()

window.initAddField = (fieldType) ->
  triggerClass = '.add_' + fieldType
  $(triggerClass).on 'click', { fieldType: fieldType }, (event) ->
    counterID = '#next_id_' + event.data.fieldType
    containerID = '#container_' + event.data.fieldType

    newID = $(event.data.counterID).val()
    $(counterID).val(parseInt(newID)+1)
    regexp = new RegExp($(this).children('a').data('id'), 'g')
    $(containerID).append($(this).children('a').data('fields').replace(regexp, newID))
    window.initRemoveFields(fieldType)
    event.preventDefault()

window.initRemoveFields = (fieldType) ->
  triggerClass = '.remove_' + fieldType
  $(triggerClass).on 'click', { fieldType: fieldType }, (event) ->
    containerClass = '.' + event.data.fieldType
    $(this).parents(containerClass).remove()
    event.preventDefault()
