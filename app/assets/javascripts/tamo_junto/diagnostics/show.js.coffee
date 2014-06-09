TamoJunto.Diagnostics ?= {}

TamoJunto.Diagnostics.Show =
  modules: -> []
  init: ->
    $('#see-more').on 'click', (event)->
      $('.more').toggleClass('hide')
      $("html, body").animate({ scrollTop: $(document).height()-$(window).height() })
      return false

