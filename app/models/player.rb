class Player < ActiveRecord::Base
  attr_accessible :name, :email, :role

  belongs_to :game
end