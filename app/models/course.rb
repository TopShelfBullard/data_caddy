class Course < ActiveRecord::Base
  has_many :rounds
  has_many :holes
  has_many :course_players
end
