class AddTokenToDevise < ActiveRecord::Migration
  def up
    add_column :users, :token_authenticatable, :string
  end

  def down
    remove_column :users, :token_authenticatable
  end

end
