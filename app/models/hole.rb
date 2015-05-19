class Hole < ActiveRecord::Base
  belongs_to :course
  has_many :played_holes
end
