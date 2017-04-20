$ ->
  $(document).on "page:change", ->
    $(".show-event-details-btn").on "click", (event) ->
      $(this).find("span").toggleClass("glyphicon-plus-sign").toggleClass("glyphicon-minus-sign")
      $($(this).data("target")).slideToggle(400, "swing")
