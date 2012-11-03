require 'spec_helper'

describe Game do

  it "should be able to create a game" do
    game = given_user.games.new(title: "test_game", start: DateTime.now, finish: DateTime.now, entries_close: DateTime.now)
    game.save.should == true
  end

  it "should not be able to create a game if invalid" do
    game = given_user.games.new(title: "", start: nil, finish: DateTime.now, entries_close: DateTime.now)
    game.save.should == false
    game.errors.full_messages.should == ["Title can't be blank", "Start can't be blank"]
  end

  it "should be able to destroy a game" do
    game = given_game(given_user)
    game.reload
    expect { game.destroy }.to change(Game, :count).by(-1)
  end

  it "should destroy players if game is destroyed" do
    game = given_game(given_user)
    game.players.create!(name: "test_user", email: "test_user@example.com")
    expect { game.destroy }.to change(Player, :count).by(-1)
  end

  it "should be unique titles" do
    game = given_game(given_user)
    game.reload
    game2 = given_user.games.new(title: game.title, start: DateTime.now, finish: DateTime.now, entries_close: DateTime.now)
    game2.save.should == false
    game2.errors.full_messages.should == ["Title has already been taken"]
  end

  it "should generate a key for the game" do
    game = given_game(given_user)
    game.game_key.should_not == nil
  end

end
