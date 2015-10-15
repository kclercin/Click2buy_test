window.fadeOutFlash = ->
  $("#ajax-flash .alerts").show('slide', {}, 400)
  $("#ajax-flash .alerts").delay(2000).hide('slide', {}, 400)
