// Arrange page specific javascript
// http://stackoverflow.com/questions/3437585/best-way-to-add-page-specific-javascript-in-a-rails-3-app
window.Zgame = {
  Helpers: {},
  Views: {},
  Models: {},
  init: function() {
  }
};

$(document).ready(function(){
  Zgame.init();
});