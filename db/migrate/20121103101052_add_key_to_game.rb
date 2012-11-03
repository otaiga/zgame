class AddKeyToGame < ActiveRecord::Migration
  def up
    add_column :games, :game_key, :string
  end

  def down
    remove_column :games, :game_key
  end

end
