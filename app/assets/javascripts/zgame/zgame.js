// Arrange page specific javascript
// http://stackoverflow.com/questions/3437585/best-way-to-add-page-specific-javascript-in-a-rails-3-app
window.Zgame = {
  Views: {},
  Models: {},
  Collections: {},
  Routers: {},
  init: function() {
    Zgame.App = new Zgame.Routers.GamePage;
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Zgame.init();
});
