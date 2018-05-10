class TestForm extends Components.Base
  refs:
    complexityInput: "#test_complexity"

  config:
    testUrl: "/tests/:test_id.json"

  initialize: ->
    @testId = @$el.data("id")

  bindings: ->
    @$refs.complexityInput.on "change", @_saveComplexity

  _saveComplexity: (event) =>
    $.ajax
      url: @config.testUrl.replace(":test_id", @testId)
      type: "PATCH"
      dataType: "json"
      data:
        test:
          complexity: @$refs.complexityInput["0"].value

$ ->
  new TestForm($el) for $el in $(".js-test-form")
