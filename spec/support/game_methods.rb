def given_game(user)
  @game ||= user.games.create!(title: "test_game", start: DateTime.now, finish: DateTime.now, entries_close: DateTime.now)
end