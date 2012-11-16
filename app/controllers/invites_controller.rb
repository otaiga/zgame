class InvitesController < ApplicationController

  def create
    invited_user = User.find_by_username(params[:player_username])
    @invite = invited_user.invites.new(from_user_id: current_user.id, game_id: params[:game_id])
    if @invite.save
      redirect_to root_path
    else
      redirect_to game_player_path(params[:game_id])
    end
  end

  def update
    invite = current_user.invites.find(params[:id])
    game = Game.find(invite.game_id)
    player = game.players.new(name: current_user.username, email: current_user.email, user_id: current_user.id)
    if player.save
      invite.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end
