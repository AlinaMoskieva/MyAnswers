class TestSortIndex extends Components.Base
  refs:
    testsContainer: ".js-tests"
    increaseLink: ".js-increase-sort-index-link"
    decreaseLink: ".js-decrease-sort-index-link"

  config:
    sortIndexUrl: "/admin/tests/:test_id/sort_index.json"

  bindings: ->
    @$refs.increaseLink.click @_increaseIndex
    @$refs.decreaseLink.click @_decreaseIndex

  _increaseIndex: (event) =>
    event.preventDefault()
    @testId = event.currentTarget.parentNode.parentNode.dataset["id"]
    @_updateTestSortIndex("+1")

  _decreaseIndex: (event) =>
    event.preventDefault()
    @testId = event.currentTarget.parentNode.parentNode.dataset["id"]
    @_updateTestSortIndex("-1")

  _updateTestSortIndex: (step) =>
    $.ajax
      url: @config.sortIndexUrl.replace(":test_id", @testId)
      type: "PATCH"
      dataType: "json"
      data:
        test:
          step: step
      success: (response) =>
        $(".js-tests").html(JST["templates/tests"](
          tests: response
        ))
        new TestSortIndex($el) for $el in $(".js-tests")

$ ->
  new TestSortIndex($el) for $el in $(".js-tests")
