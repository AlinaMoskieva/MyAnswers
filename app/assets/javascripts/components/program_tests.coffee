class ProgramTests extends Components.Base
  refs:
    addTestLink: ".add-test"
    removeTestLink: ".remove-test"

  initialize: ->
    @programId = @$el.data("id")

  bindings: ->
    @$refs.addTestLink.on "click", @_addTest
    @$refs.removeTestLink.on "click", @_removeTest

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
        # @_initNewJSClass()

  _removeTest: (event) =>
    event.preventDefault()

    $.ajax
      url: @_destroyPprogramTestsPath()
      type: "DELETE"
      dataType: "json"
      data:
        program_test:
          program_id: @programId
          test_id: @_testId(event)
      success: (response) =>
        $(".program-tests-list").html(JST["templates/tests_list"](tests: response))
        # @_initNewJSClass()

  _testId: (event) =>
    event.currentTarget.closest(".test-item").dataset["id"]

  _createProgramTestsPath: =>
    "/admin/program_tests.json"

  _destroyPprogramTestsPath: =>
    "/admin/program_tests/#{@testId}.json"

  _moveToBottom: =>
    $("html, body").animate({ scrollTop: $(document).height() - $(window).height() });

  _initNewJSClass: =>
    new ProgramTests($el) for $el in $(".program-tests")

$ ->
  new ProgramTests($el) for $el in $(".program-tests")
