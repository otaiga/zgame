def given_player(game)
  game.players.create!(name: "test_user", email: "test_user@example.com")
end