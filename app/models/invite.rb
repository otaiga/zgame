class Invite < ActiveRecord::Base
  attr_accessible :from_user_id, :game_id

private

  def self.remove_all_invites_for_game(game_id)
    self.where(game_id: game_id).destroy_all
  end

end
