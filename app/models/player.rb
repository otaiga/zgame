class Player < ActiveRecord::Base
  attr_accessible :name, :email, :role, :user_id
  belongs_to :game

  validates_presence_of :email
end