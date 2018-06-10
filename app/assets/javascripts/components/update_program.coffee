class UpdateProgram extends Components.Base
  refs:
    nameInput: "#program_name"
    daysNumberInput: "#program_days_number"
    executionInput: "#program_execution"
    successMessage: ".success-message"

  initialize: ->
    @programId = @$el.data("id")

  bindings: ->
    @$refs.nameInput.on "input", $.debounce(@_saveData, 300)
    @$refs.daysNumberInput.on "input", $.debounce(@_saveData, 300)
    @$refs.executionInput.on "input", $.debounce(@_saveData, 300)

  _saveData: (event) =>
    $.ajax
      url: @_updateProgramPath()
      type: "PATCH"
      dataType: "json"
      data:
        program:
          name: @$refs.nameInput.val()
          days_number: @$refs.daysNumberInput.val()
          execution: @$refs.executionInput.val()
      success: (response) =>
        @_showSuccessMessage()

  _updateProgramPath: =>
    "/admin/programs/#{@programId}.json"

  _showSuccessMessage: =>
    @$refs.successMessage.removeClass("hidden").delay(1000).queue((next) ->
        $(this).addClass("hidden");
        next();
    );

$ ->
  new UpdateProgram($el) for $el in $(".program-form")
