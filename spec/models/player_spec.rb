require 'spec_helper'

describe Player do
  it "should be able to create a player" do
    player = given_game(given_user).players.new(name: "test_user", email: "test_user@example.com")
    player.save.should == true
  end

  it "should be able to destroy a player" do
    player = given_player(given_game(given_user))
    expect { player.destroy }.to change(Player, :count).by(-1)
  end

  it "should be able to create an invalid player" do
    player = given_game(given_user).players.new(name: "test_user", email: "")
    player.save.should == false
    player.errors.full_messages.should == ["Email can't be blank"]
  end
  
end
