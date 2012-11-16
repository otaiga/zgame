class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :role, :default => "unknown"
      t.integer :game_id, :default => nil
      #Player is a user so will have a user ID.
      t.integer :user_id, :default => nil
      
      t.timestamps
    end
  end
end
