class RadioWidget
  constructor: (el)->
    @el = el
    @$el =$(el)

    @answer_input = $("#user_answer_position_value", @$el)

    @bindings()

  bindings: (el)->
    $("#user_answer_answer_0, #user_answer_answer_1").on "change", @setAnswer

  setAnswer: (event)=>
    answer = event.target.nextSibling.innerHTML
    @answer_input.val(answer)

$ ->
  if  $("#radio_widget").length > 0
    new RadioWidget("#radio_widget")
