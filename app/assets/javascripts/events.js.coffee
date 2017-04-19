$ ->
  $(".showEventDetailsBtn").on "click", (event) ->
    $(this).find("span").toggleClass("glyphicon-plus-sign").toggleClass("glyphicon-minus-sign")
