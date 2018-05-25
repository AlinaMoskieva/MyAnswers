class UnitQuestions extends Components.Base
  refs:
    unitInput: "#test_unit_id"
    unitQuestions: ".unit-quiestions"

  bindings: ->
    @$refs.unitInput.on "change", @_showUnitQuestions

  _showUnitQuestions: (event) =>
    $.ajax
      url: @_unitPath()
      type: "GET"
      dataType: "json"
      success: (response) =>
        console.log(response.questions)
        @$refs.unitQuestions.html(JST["templates/unit_questions"](questions: response.questions))

  _unitPath: =>
    "/admin/units/#{@_unitId()}.json"

  _unitId: =>
    @$refs.unitInput.val()

$ ->
  new UnitQuestions($el) for $el in $(".js-test-form")
