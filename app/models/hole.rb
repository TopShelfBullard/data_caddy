class Hole < ActiveRecord::Base
  belongs_to :course
  has_many :player_holes
end
