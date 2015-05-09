class Shot < ActiveRecord::Base
  belongs_to :round
  belongs_to :hole
  belongs_to :club
end
