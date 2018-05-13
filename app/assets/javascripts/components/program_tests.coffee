class ProgramTests extends Components.Base
  refs:
    addTestLink: ".add-test"

  initialize: ->
    @programId = @$el.data("id")
    # console.log(@$refs.addTestLink)

  bindings: ->
    @$refs.addTestLink.on "click", @_addTest

  _addTest: (event) =>
    console.log("Hi")
    event.preventDefault()
    @testId = event.currentTarget.closest(".test-item").dataset["id"]

    $.ajax
      url: @_programTestsPath()
      type: "POST"
      dataType: "json"
      data:
        program_test:
          program_id: @programId
          test_id: @testId
      success: (response) =>
        $(".program-tests-list").html(JST["templates/tests_list"](tests: response))


  _programTestsPath: =>
    "/admin/program_tests.json"

$ ->
  new ProgramTests($el) for $el in $(".program-tests")
