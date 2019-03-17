App.cable.subscriptions.create(
  {channel: "LinksChannel"},
  {
    received: function(json) {
      // update input field on edit page
      $('#link_hits-' + json.id).val(json.hits)

      // update table on index page
      $('table').find('#link_hits-' + json.id).text(json.hits)
    }
  }
)


