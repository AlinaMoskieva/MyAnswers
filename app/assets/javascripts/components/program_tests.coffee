class ProgramTests extends Components.Base
  refs:
    addTestLink: ".add-test"
    removeTestLink: ".remove-test"
    increaseSortIndexLink: ".increase-sort-index"
    decreaseSortIndexLink: ".decrease-sort-index"

  initialize: ->
    @programId = @$el.data("id")

  bindings: ->
    @$refs.addTestLink.on "click", @_addTest
    @$refs.removeTestLink.on "click", @_removeTest
    @$refs.increaseSortIndexLink.on "click", @_increaseSortIndex
    @$refs.decreaseSortIndexLink.on "click", @_decreaseSortIndex

  _addTest: (event) =>
    event.preventDefault()

    $.ajax
      url: @_createProgramTestsPath()
      type: "POST"
      dataType: "json"
      data:
        program_test:
          program_id: @programId
          test_id: @_testId(event)
      success: (response) =>
        $(".program-tests-list").html(JST["templates/tests_list"](tests: response))
        @_moveToBottom()
        @_refreshListeners()

  _removeTest: (event) =>
    event.preventDefault()

    $.ajax
      url: @_destroyProgramTestsPath()
      type: "DELETE"
      dataType: "json"
      data:
        program_test:
          program_id: @programId
          test_id: @_testId(event)
      success: (response) =>
        $(".program-tests-list").html(JST["templates/tests_list"](tests: response))
        @_refreshListeners()

  _increaseSortIndex: (event) =>
    event.preventDefault()
    @_updateSortIndex("+1")

  _decreaseSortIndex: (event) =>
    event.preventDefault()
    @_updateSortIndex("-1")

  _updateSortIndex: (step) =>
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

  _testId: (event) =>
    event.currentTarget.closest(".test-item").dataset["id"]

  _createProgramTestsPath: =>
    "/admin/program_tests.json"

  _destroyProgramTestsPath: =>
    "/admin/program_tests/#{@testId}.json"

  _moveToBottom: =>
    $("html, body").animate({ scrollTop: $(document).height() - $(window).height() });

  _refreshListeners: =>
    @_initRefs()
    @$refs.removeTestLink.on "click", @_removeTest

$ ->
  new ProgramTests($el) for $el in $(".program-tests")
