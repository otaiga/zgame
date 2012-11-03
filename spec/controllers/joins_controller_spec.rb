require 'spec_helper'

describe JoinsController do

  it "should be able to access a game via key" do
    get :new, :game_key => given_game(given_user).game_key
    response.should be_success
  end

end
