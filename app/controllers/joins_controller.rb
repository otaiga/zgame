class JoinsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @game = Game.find_by_game_key(params[:game_key])
    redirect_to root_path unless @game
    @player = @game.players.build
  end

end
