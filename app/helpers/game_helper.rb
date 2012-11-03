module GameHelper
  def owner?(game)
    game.user == current_user
  end
end