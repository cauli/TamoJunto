TamoJunto.Users ?= {}

TamoJunto.Users.Show =
  modules: -> []
  init: ->
    $('#welcome-modal').foundation('reveal', 'open')

