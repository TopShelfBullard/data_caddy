class Shot < ActiveRecord::Base
  belongs_to :played_hole
  belongs_to :club
end
