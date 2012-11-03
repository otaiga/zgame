class PlayersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @player = current_user.games.find(params[:game_id]).players.new
    @game_id = params[:game_id]
  end

end
