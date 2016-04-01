# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#city_province_id', (evt) ->
    selected = $("#city_province_id option:selected")
    $.ajax 'update_cities',
      type: 'GET'
      dataType: 'script'
      data: {
        province_id: selected.val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("Blad w trakcie pobierania miast: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Pobrano miasta dla "+selected.text())

$(document).ready ->
  $(document).bind 'ajaxError', 'form#new_city', (event, jqxhr, settings, exception) ->
    $(event.data).render_form_errors $.parseJSON(jqxhr.responseText)
    return
  return
  
(($) ->
  $.fn.modal_success = ->
    @modal 'hide'
    @find('form input[type="text"]').val ''
    @clear_previous_errors()
    return

  $.fn.render_form_errors = (errors) ->
    $form = this
    @clear_previous_errors()
    $model = @data('model')
    $.each errors, (field, messages) ->
      $input = $('input[name="' + model + '[' + field + ']"]')
      $input.closest('.form-group').addClass('has-error').find('.help-block').html messages.join(' & ')
      return
    return

  $.fn.clear_previous_errors = ->
    $('.form-group.has-error', this).each ->
      $('.help-block', $(this)).html ''
      $(this).removeClass 'has-error'
      return
    return

  return
) jQuery

@show = ->
    console.log "show"
    "" # TODO: cos z klasa hide by trzeba dodac o ile jest
    
@hide = ->
    console.log "hide"
    ""