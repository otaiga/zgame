require 'spec_helper'

describe PlayersController do

  describe "as signed in" do
    before(:each) do
      sign_in given_user
    end

    it "should be able to access new" do
      get :new, :game_id => given_game(given_user).id
      response.should be_success
    end

  end

  describe "not signed in" do

    it "should not be able to access the new page" do
      get :new, :game_id => given_game(given_user).id
      response.should redirect_to new_user_session_path
    end
  end

end
