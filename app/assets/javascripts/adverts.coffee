# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(document).bind 'ajaxError', 'form#new_person', (event, jqxhr, settings, exception) ->
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