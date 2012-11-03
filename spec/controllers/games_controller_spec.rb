require 'spec_helper'

describe GamesController do

  describe "as signed in" do
    before(:each) do
      sign_in given_user

    end

    it "should be able to get index" do
      get :index
      response.should be_success
    end

    it "should be able to show a game" do
      get :show, :id => (given_game(given_user))
      response.should be_success
    end

    it "should be able to get new" do
      get :new
      response.should be_success
    end

    it "should be able to create a new game" do
      post :create, :game => {title: "user_game", start: DateTime.now, finish: DateTime.now, entries_close: DateTime.now}
      response.should redirect_to root_path
      given_user.reload
      given_user.games.count.should == 1
    end

    it "should be able to destroy a created game" do
      delete :destroy, :id => given_game(given_user).id
      response.should redirect_to root_path
      given_user.games.count.should == 0
    end

  end

  describe "not signed in" do

    it "should not be able to access index" do
      get :index
      response.should redirect_to new_user_session_path
    end

    it "should not be able to access show page" do
      get :show, :id => (given_game(given_user))
      response.should redirect_to new_user_session_path
    end

    it "should not be able to access new" do
      get :new
      response.should redirect_to new_user_session_path
    end

    it "should be able to create a new game" do
      post :create, :game => {title: "user_game", start: DateTime.now, finish: DateTime.now, entries_close: DateTime.now}
      response.should redirect_to new_user_session_path
      given_user.reload
      given_user.games.count.should == 0
    end

    it "should be able to destroy a created game" do
      delete :destroy, :id => given_game(given_user).id
      response.should redirect_to new_user_session_path
      given_user.games.count.should == 1
    end
  end

end
