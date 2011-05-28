$ = jQuery

$ ->
  ($ "body").attr("spellcheck", "false")
  code = ($ ".exercise").html()
  inputCode = code.replace(/\{BLANK\}/g, "<div contenteditable=\"true\">BLANK</div>")
  ($ ".exercise").html(inputCode)

