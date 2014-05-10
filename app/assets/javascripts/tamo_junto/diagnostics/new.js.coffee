TamoJunto.Diagnostics ?= {}

TamoJunto.Diagnostics.New =
  modules: -> []
  init: ->
    $('.js-themes-select input').on 'change', (event)->
      $input = $(event.currentTarget)
      $label = $input.parents('label')

      if $('.js-themes-select input:checked').length > 2
        return $input.removeAttr('checked')

      $label.toggleClass('checked')
