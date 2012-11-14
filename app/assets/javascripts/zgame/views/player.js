Zgame.Views.Player = Backbone.View.extend({
  tagName: 'li',
  template: JST['zgame/templates/players/player'],

  initialize: function() {
    this.model.on('change', this.render, this);
  },

  render: function() {
    var attributes = this.model.toJSON();
    this.$el.html(this.template( attributes ));
    return this;
  },
  
});