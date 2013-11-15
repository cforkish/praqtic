$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'

  # widen panel divs
  $('.container-panel-div-down').width($('.container-panel-div-down').width() + 62)

  # turn whole table rows into links
  $('tr.tr-url').on 'click', (event) ->
    if event.target == event.currentTarget
      window.location = $(this).attr("url")