class Shot < ActiveRecord::Base
  belongs_to :round
  belongs_to :played_hole
  belongs_to :club
  has_one :lie
  has_one :result
end
