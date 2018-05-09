class CalculatorWidget
  constructor: (el)->
    @el = el
    @$el =$(el)

    @input = $(".calculator__input", @$el)
    @clearButton = $("#del_all", @$el)
    @delButton = $("#del", @$el)

    @bindings()

  bindings: (el)->
    $("#1, #2, #3, #4, #5, #6, #7, #8, #9, #0").on "click", @updateInput
    @delButton.on "click", @removeLastDigit
    @clearButton.on "click", @clearInput

  updateInput: (event)=>
    value = event.target.id
    prev_value = @input.val()
    @input.val(prev_value.concat(value))


  removeLastDigit: (event)=>
    value = @input.val().slice(0, -1)
    @input.val(value)

  clearInput: (event)=>
    @input.val("")

$ ->
  if $("#calculator_widget").length > 0
    new CalculatorWidget("#calculator_widget")
