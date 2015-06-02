require 'rails_helper'

RSpec.describe Scorecard, type: :model do
  fixtures :courses
  fixtures :players
  fixtures :holes
  fixtures :rounds
  fixtures :clubs
  fixtures :played_holes
  fixtures :shots

  it "properly sets the number of mulligans taken during a hole" do
    round = Round.find(1)
    data = Scorecard.set_scorecard_hash(round)
    expect(data.first[:mulligans]).to eq(2)
  end
end
