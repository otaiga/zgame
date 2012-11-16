class InvitesController < ApplicationController

  def create
    invited_user = User.find_by_username(params[:player_username])
    invited_user.invites.new(from_user_id: current_user.id, game_id: )
  end
end
