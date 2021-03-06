class PlayersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @player = current_user.games.find(params[:game_id]).players.new
    @game_id = params[:game_id]
  end

  def create
    game = Game.find(params[:game_id])
    player = game.players.new(params[:player])
    if User.find_by_email(player.email) && player.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def caught
    player = Player.find_by_email(current_user.email)
    player.update_attributes(role: "zombie") if player
    respond_to do |format|
      format.js
      format.html {redirect_to game_path(params[:game_id])}
    end
  end

end
