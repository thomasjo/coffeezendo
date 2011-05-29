$ = jQuery
$ ->
  ($ "body").attr("spellcheck", "false")
  ($ ".exercise").each ->
    $this = ($ this)
    code = $this.find("section").html()
    $this.data("code", code)
    inputCode = code.replace(/\{\?\}/g, "<div contenteditable=\"true\">?</div>")
    $this.find("section").html(inputCode)

