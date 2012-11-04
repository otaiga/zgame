// Zgame Helpers module
Zgame.Helpers.NotificationHelper = (function() {
  var my = {};
  var playerHash = {};

  // callback function for handling push events
  my.notification = function(json_data) {
    apply_player_events(json_data);
  };

  // private methods

  apply_player_events = function(json_data) {
    $.each($('div#player_collection').data('players'),
        function(){playerHash[this.name] = this.state;});
    update_player(playerHash, json_data);
  };

  update_player = function(playerHash, json_data) {
    var name = json_data['name'];
    var name_state = json_data['status'];

    if (playerHash.hasOwnProperty(name)) {
      Zgame.Views.Player.updatePlayer(json_data);

    } else {
      Zgame.Views.Player.appendPlayer(json_data);
      playerHash[name] = name_state;
    }
  };

  return my;
})(); // automatically run this module
