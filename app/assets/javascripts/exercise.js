(function() {
  var $;
  $ = jQuery;
  $(function() {
    var code, inputCode;
    code = ($(".exercise")).html();
    inputCode = code.replace(/\{BLANK\}/g, "<span contenteditable>BLANK</span>");
    return ($(".koan")).html(inputCode);
  });
}).call(this);
