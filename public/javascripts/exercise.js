(function() {
  var $;
  $ = jQuery;
  $(function() {
    $("body").attr("spellcheck", "false");
    return $.ajax({
      url: "/exercise/001.json",
      success: function(data) {
        var codeContainer, container, inputCode;
        container = $("body > section");
        container.html($("#exercise-tmpl").tmpl(data));
        codeContainer = container.find(".exercise section");
        codeContainer.data("code", data.code);
        inputCode = data.code.replace(/\{\?\}/g, "<div contenteditable=\"true\">?</div>");
        return codeContainer.html(inputCode);
      }
    });
  });
}).call(this);
