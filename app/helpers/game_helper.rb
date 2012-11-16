module GameHelper
  def owner?(game)
    game.user == current_user
  end

  def is_user?(player)
    player.email == current_user.email 
  end

  def game_data(invite)
    Game.find(invite.game_id)

    #rescue if no id found.
    rescue ActiveRecord::RecordNotFound => e
    invite.destroy
    nil
  end

  def get_user_name(user_id)
    User.find(user_id).username
  end
end