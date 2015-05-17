class PlayedHole < ActiveRecord::Base
  belongs_to :hole
  belongs_to :round
  belongs_to :player
  has_many :shots
end
