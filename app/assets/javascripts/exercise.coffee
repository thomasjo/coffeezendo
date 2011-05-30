$ = jQuery
$ ->
  ($ "body").attr("spellcheck", "false")

  $.ajax
    url: "/exercise/001.json"
    success: (data) ->
      container = ($ "body > section")
      container.html ($ "#exercise-tmpl").tmpl(data)

      codeContainer = container.find(".exercise section")
      codeContainer.data("code", data.code)
      inputCode = data.code.replace(/\{\?\}/g, "<div contenteditable=\"true\">?</div>")
      codeContainer.html(inputCode)

