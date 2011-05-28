(function() {
  var $;
  $ = jQuery;
  $(function() {
    var code, inputCode;
    ($("body")).attr("spellcheck", "false");
    code = ($(".exercise")).html();
    inputCode = code.replace(/\{BLANK\}/g, "<div contenteditable=\"true\">BLANK</div>");
    return ($(".exercise")).html(inputCode);
  });
}).call(this);
