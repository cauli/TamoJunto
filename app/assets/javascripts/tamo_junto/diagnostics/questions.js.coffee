TamoJunto.Diagnostics ?= {}

TamoJunto.Diagnostics.Questions =
  modules: -> []
  init: ->
    $('.js-answer-inputs input').on 'change', (event)->
      $input = $(event.currentTarget)
      $label = $input.parents('label')

      for other_input in $("input[name='#{$input.attr('name')}']")
        $(other_input).parents('label').removeClass('checked')

      $label.addClass('checked')
