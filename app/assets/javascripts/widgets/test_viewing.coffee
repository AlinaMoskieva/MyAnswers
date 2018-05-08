class TestViewing
  constructor: (el)->
    @el = el
    @$el =$(el)

    @buttons = $("input[name=commit]", @$el)

    @bindings()

  bindings: (el)->
    @buttons.addClass("disabled")

$ ->
  if $("#test_viewing").length > 0
    new TestViewing("#test_viewing")
