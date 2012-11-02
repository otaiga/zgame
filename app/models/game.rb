class Game < ActiveRecord::Base
  attr_accessible :title, :start, :finish, :entries_close

  belongs_to :user
  has_many :players
  
end
      