(function() {
  var $;
  $ = jQuery;
  $(function() {
    ($("body")).attr("spellcheck", "false");
    return ($(".exercise")).each(function() {
      var $this, code, inputCode;
      $this = $(this);
      code = $this.find("section").html();
      $this.data("code", code);
      inputCode = code.replace(/\{\?\}/g, "<div contenteditable=\"true\">?</div>");
      return $this.find("section").html(inputCode);
    });
  });
}).call(this);
