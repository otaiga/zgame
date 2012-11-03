class Game < ActiveRecord::Base
  after_create :add_game_key

  attr_accessible :title, :start, :finish, :entries_close, :game_key

  belongs_to :user
  has_many :players, :dependent => :destroy

  validates_presence_of :title, :start, :finish, :entries_close
  validates_uniqueness_of :title

private

  def add_game_key
    self.game_key = generated_key
    self.save
  end

  def generated_key
    Digest::SHA1.hexdigest(Time.now.to_s + self.id.to_s)
  end
  
end
      