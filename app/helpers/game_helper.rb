module GameHelper
  def owner?(game)
    game.user == current_user
  end

  def is_user?(player)
    player.email == current_user.email 
  end
end