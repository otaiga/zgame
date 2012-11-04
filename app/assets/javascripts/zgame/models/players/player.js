Zgame.Models.Player = function(json_data){
  var my = {};

  initialize = function(json_data){
    my.state = json_data["status"];
    my.name = json_data["name"];
    my.id = json_data["player_id"];
  };
  
  initialize(json_data);
  return my;
};