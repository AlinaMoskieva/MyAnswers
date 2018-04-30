class TestSortIndex extends Components.Base
  refs:
    increaseLink: ".js-increase-sort-index-link"
    decreaseLink: ".js-decrease-sort-index-link"

  config:
    sortIndexUrl: "/tests/:test_id/sort_index.json"

  initialize: ->
    @testId = @$el.data("id")

  bindings: ->
    @$refs.increaseLink.click @_increaseIndex
    @$refs.decreaseLink.click @_decreaseIndex

  _increaseIndex: (event) =>
    event.preventDefault()
    @_updateTestSortIndex("+1")

  _decreaseIndex: (event) =>
    event.preventDefault()
    @_updateTestSortIndex("-1")

  _updateTestSortIndex: (step) =>
    $.ajax
      url: @config.sortIndexUrl.replace(":test_id", @testId)
      type: "PATCH"
      dataType: "json"
      data:
        test:
          step: step
      statusCode:
        200:
          if step == "+1" then @_changeOrderOfThisTestAndNextOne else @_changeOrderOfThisTestAndPreviousOne

  _changeOrderOfThisTestAndNextOne: =>

  _changeOrderOfThisTestAndPreviousOne: =>


$ ->
  new TestSortIndex($el) for $el in $(".js-test-sort-index")
