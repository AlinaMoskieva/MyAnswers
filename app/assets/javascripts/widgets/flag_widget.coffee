class FlagWidget
  constructor: (el)->
    @el = el
    @$el =$(el)

    @input = $(".flag__input", @$el)
    @variants = $(".answer_variant", @$el)
    @ids = [1, 2, 3, 4]

    @bindings()

  bindings: (el)->
    @input.val(900)
    $(".right_1, .right_2, .right_3, .right_4").on "click", @setAnswer

  setAnswer: (event)=>
    position = event.target.id
    val = @variants[position - 1].firstChild.nodeValue
    @input.val(val)
    @show_wrong_flags(position)

  show_wrong_flags: (id)=>
    index = @ids.indexOf(parseInt(id))
    @ids.splice(index, 1)

    for n in @ids
      $("#wrong_#{n}").show()
      $(".right_#{n}").hide()

$ ->
  if  $("#flags").length > 0
    new FlagWidget("#flags")
