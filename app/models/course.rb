class Course < ActiveRecord::Base
  has_many :rounds
  has_many :holes
end
