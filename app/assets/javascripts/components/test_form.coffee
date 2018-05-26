class TestForm extends Components.Base
  refs:
    complexityInput: "#test_complexity"
    widgetInput: ".test-question__widget"

  initialize: ->
    @testId = @$el.data("id")

  bindings: ->
    @$refs.complexityInput.on "change", @_saveComplexity
    @$refs.widgetInput.on "change", @_saveWidget

  _saveComplexity: (event) =>
    $.ajax
      url: @_testPath()
      type: "PATCH"
      dataType: "json"
      data:
        test:
          complexity: @$refs.complexityInput["0"].value

  _saveWidget: (event) =>
    @testQuestionId = event.currentTarget.closest(".js-test-question").dataset["id"]
    $.ajax
      url: @_testQuestionPath()
      type: "PATCH"
      dataType: "json"
      data:
        test_question:
          widget_id: event.currentTarget.value

  _testPath: =>
    "/tests/#{@testId}.json"

  _testQuestionPath: =>
    "/admin/test_questions/#{@testQuestionId}.json"

$ ->
  new TestForm($el) for $el in $(".js-test-form")
