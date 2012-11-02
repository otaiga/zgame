class GamesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @games = current_user.games
  end

  def show
    @game = current_user.games.find(params[:id])
    redirect_to root_path unless @game
  end

  def new
    @game = current_user.games.new
  end

  def create
    @game = current_user.games.new(params[:game])
    if @game.save
      redirect_to root_path, :notice => "New Game Created"
    else
      flash[:alert] = "Oops, something went wrong"
      render :new
    end
  end

  def destroy
    @game = current_user.games.find(params[:id])
    if @game.destroy
      redirect_to root_path, :notice => "Game Deleted"
    else
      redirect_to root_path, :notice => "Oops, something went wrong"
    end
  end
  
end
