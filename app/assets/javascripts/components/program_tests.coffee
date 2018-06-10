class ProgramTests extends Components.Base
  refs:
    addTestLink: ".add-test"
    removeTestLink: ".remove-test"
    increaseSortIndexLink: ".increase-sort-index"
    decreaseSortIndexLink: ".decrease-sort-index"
    dayNumberInput: ".day-number"
    successMessage: ".success-message"

  initialize: ->
    @programId = @$el.data("id")

  bindings: ->
    @$refs.addTestLink.on "click", @_addTest
    @$refs.removeTestLink.on "click", @_removeTest
    @$refs.increaseSortIndexLink.on "click", @_increaseSortIndex
    @$refs.decreaseSortIndexLink.on "click", @_decreaseSortIndex
    @$refs.dayNumberInput.on "input", $.debounce(@_saveDayNumber, 300)

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
        $(".program-tests-list").html(JST["templates/tests"](tests: response))
        @_moveToBottom()
        @_refreshListeners()
        @_showSuccessMessage()

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
        $(".program-tests-list").html(JST["templates/tests"](tests: response))
        @_refreshListeners()
        @_showSuccessMessage()

  _saveDayNumber: (event) =>
    $.ajax
      url: @_updateProgramTestPath(event)
      type: "PATCH"
      dataType: "json"
      data:
        program_test:
          day_number: event.currentTarget.value
          program_id: @programId
      success: (response) =>
        @_showSuccessMessage()

  _increaseSortIndex: (event) =>
    event.preventDefault()
    @_updateSortIndex("+1")

  _decreaseSortIndex: (event) =>
    event.preventDefault()
    @_updateSortIndex("-1")

  _updateSortIndex: (step) =>
    $.ajax
      url: @_updateProgramTestPath(event)
      type: "PATCH"
      dataType: "json"
      data:
        program_test:
          step: step
          program_id: @programId
      success: (response) =>
        $(".program-tests-list").html(JST["templates/tests"](
          tests: response
        ))
        @_refreshListeners()
        @_showSuccessMessage()

  _testId: (event) =>
    event.currentTarget.closest(".test-item").dataset["id"]

  _programTestId: (event) =>
    event.currentTarget.closest(".test-item").dataset["programTestId"]

  _updateProgramTestPath: (event) =>
    "/admin/program_tests/#{@_programTestId(event)}.json"

  _createProgramTestsPath: =>
    "/admin/program_tests.json"

  _destroyProgramTestsPath: =>
    "/admin/program_tests/#{@testId}.json"

  _moveToBottom: =>
    $("html, body").animate({ scrollTop: $(document).height() - $(window).height() });

  _showSuccessMessage: =>
    @$refs.successMessage.removeClass("hidden").delay(1000).queue((next) ->
        $(this).addClass("hidden");
        next();
    );

  _refreshListeners: =>
    @_initRefs()
    @$refs.removeTestLink.on "click", @_removeTest
    @$refs.increaseSortIndexLink.on "click", @_increaseSortIndex
    @$refs.decreaseSortIndexLink.on "click", @_decreaseSortIndex
    @$refs.dayNumberInput.on "input", $.debounce(@_saveDayNumber, 300)

$ ->
  new ProgramTests($el) for $el in $(".program-tests")
