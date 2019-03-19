function copyToClipboard(text) {
  var id           = document.querySelector('[id^="link_short_url"]').id;
  var element      = document.getElementById(id);
  element.disabled = false;
  element.select();
  document.execCommand("copy");
  element.disabled = true;
}

function init() {
  var text = $('input[id^="link_short_url"]').val();
  var template = '<span><code class="copy-btn copy-btn-xs copy-btn-success" title="Copy short url" onmousedown="event.preventDefault();" onclick="copyToClipboard(' + text + ')"><i class="fa fa-clipboard"></i>copy</code></span>';
  
  $( document ).on('turbolinks:load', function() {
    document.querySelector(".buttons").innerHTML = template;
  })
}

init();
