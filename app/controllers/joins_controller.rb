class JoinsController < ApplicationController

  def new
    @game = Game.find_by_game_key(params[:game_key])
    redirect_to root_path unless @game
  end

end
