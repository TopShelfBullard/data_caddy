class Round < ActiveRecord::Base
  belongs_to :course
  belongs_to :player
  has_many :played_holes
end
