class GamesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @games = Game.find_all_by_user_participation(current_user.email)
    @invites = current_user.invites
  end

  def show
    if params[:game_key]
      @game = Game.find_by_game_key(params[:game_key])
    else
      @game = current_user.games.find(params[:id])
    end
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
    #remove all invites to users for this game
    Invite.remove_all_invites_for_game(@game.id)
    if @game.destroy
      redirect_to root_path, :notice => "Game Deleted"
    else
      redirect_to root_path, :notice => "Oops, something went wrong"
    end
  end
  
end
