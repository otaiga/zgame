Zgame.Views.Player = (function() {
  var my = {};

  my.updatePlayer = function(json_data) {
    var name = json_data['name'];
    var state = json_data['status'];
    var id = json_data['player_id'];

    player = Zgame.Models.Player(json_data);

    var mytemplate = JST['zgame/templates/players/player'](player);
    $('ul#players > li#'+ id).remove();
    $('ul#players').append(mytemplate);

  };

  my.appendPlayer = function(json_data) {
    var name = json_data['name'];
    var state = json_data['status'];
    var player_id = json_data['id'];

    player = Zgame.Models.Player(json_data); 

    var mytemplate = JST['zgame/templates/players/player'](player);
    $('ul#players').append(mytemplate);
  };

  return my;
})();