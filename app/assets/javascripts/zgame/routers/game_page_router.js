Zgame.Routers.GamePage = Backbone.Router.extend({

  routes: {
    '': 'show'
  },

  initialize: function() {
    this.collection = new Zgame.Collections.Players;
    this.collection.reset( $('#player_collection').data('players') );
  },

  show: function() {
    var players_index_view = new Zgame.Views.PlayersIndex({ collection: this.collection });
    $('#players').replaceWith(players_index_view.render().el);
  },

});