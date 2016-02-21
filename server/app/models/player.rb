class Player < ActiveRecord::Base
  has_and_belongs_to_many :channels, :uniq => true
  validates :number, presence: true, uniqueness: true

  # def fix_it
  #   @player = Player.channels.replace(Channel.where(:published =>  true).first)
    
  # end
end
