Zgame.Views.PlayersIndex = Backbone.View.extend({
  tagName: 'ul',
  id: 'players',

  render: function() {
    this.collection.forEach(this.addOne, this);
    return this;
  },

  addOne: function(player) {
    var playerView = new Zgame.Views.Player({ model: player });
    console.log(player);
    this.$el.append(playerView.render().el);
  },

});
