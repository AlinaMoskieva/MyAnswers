class YesNoWidget
  constructor: (el)->
    @el = el
    @$el =$(el)

    @hidden_input = $("#user_answer_answer", @$el)
    @form = $("form", @$el)

    @bindings()

  bindings: (el)->
    $("#yes_button, #no_button").on "click", @setAnswer

  setAnswer: (event)=>
    event.preventDefault()

    @hidden_input.val(event.target.value)
    @form.submit()

$ ->
  if  $("#yes_no_widget").length > 0
    new YesNoWidget("#yes_no_widget")
