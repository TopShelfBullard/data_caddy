class Club < ActiveRecord::Base
  has_many :shots
  has_many :played_holes
end
