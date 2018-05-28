# Allow switching between tabs. 
$ -> 
  $(document).on "page:change", ->
    # Activate first tab on page load. Don't know which tabs available, since users have different rights.
    $(".tab:first").addClass("active")
    $("#" + $(".tab.active").text().trim().toLowerCase() + "-panel").removeClass("hidden")

    # Each time a tab is clicked, make active and show corresponding content.
    $(".tab").on "click", (event) ->
      $(".tab").removeClass("active")
      $(this).addClass("active")

      $(".admin-panel").addClass("hidden")
      $("#" + $(this).text().trim().toLowerCase() + "-panel").removeClass("hidden")
