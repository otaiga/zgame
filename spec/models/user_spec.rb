require 'spec_helper'

describe User do
  
  it "should be able to create a user" do
    user = User.new(email: "test_user@example.com", password: "password")
    user.save.should == true
  end

  it "should be able to destroy a user" do
    user = given_user
    expect { user.destroy }.to change(User, :count).by(-1)
  end

end
