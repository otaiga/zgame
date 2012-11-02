class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :start
      t.datetime :finish
      t.datetime :entries_close
      t.integer :user_id, :default => nil
      
      t.timestamps
    end
  end
end
