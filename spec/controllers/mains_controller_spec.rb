require 'spec_helper'

describe MainsController do

  it "should redirect to games_path if signed in" do
    sign_in given_user
    get :index
    response.should redirect_to games_path
  end

  it "should show index if not signed in" do
    get :index
    response.should be_success  
  end

end
