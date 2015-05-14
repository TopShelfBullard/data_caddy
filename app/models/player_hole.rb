class PlayerHole < ActiveRecord::Base
  belongs_to :player
  belongs_to :hole
end
