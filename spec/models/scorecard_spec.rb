require 'rails_helper'

RSpec.describe Scorecard, type: :model do

  it "properly sets the number of mulligans taken during a hole" do
    round = Round.create()
    hole = Hole.create(number: 3)
    played_hole = PlayedHole.create(hole_id: hole.id, round_id: round.id)

    Shot.create(played_hole_id: played_hole.id, number: 1, mulligan: true)
    Shot.create(played_hole_id: played_hole.id, number: 2, drop: true)
    Shot.create(played_hole_id: played_hole.id, number: 3, practice: true)
    Shot.create(played_hole_id: played_hole.id, number: 4, mulligan: true, green:true)
    Shot.create(played_hole_id: played_hole.id, number: 5, drop: true, green:true)
    Shot.create(played_hole_id: played_hole.id, number: 6, practice: true)

    data = Scorecard.set_scorecard_hash(round)
    expect(data.first[:mulligans]).to eq(2)
  end

  it "properly sets the number of drops taken during a hole" do
    round = Round.create()
    hole = Hole.create(number: 3)
    played_hole = PlayedHole.create(hole_id: hole.id, round_id: round.id)

    Shot.create(played_hole_id: played_hole.id, number: 1, mulligan: true)
    Shot.create(played_hole_id: played_hole.id, number: 2, drop: true)
    Shot.create(played_hole_id: played_hole.id, number: 3, practice: true)
    Shot.create(played_hole_id: played_hole.id, number: 4, mulligan: true, green:true)
    Shot.create(played_hole_id: played_hole.id, number: 5, drop: true, green:true)
    Shot.create(played_hole_id: played_hole.id, number: 6, practice: true)

    data = Scorecard.set_scorecard_hash(round)
    expect(data.first[:drops]).to eq(2)
  end

  it "properly sets the number of practice shots taken during a hole" do
    round = Round.create()
    hole = Hole.create(number: 3)
    played_hole = PlayedHole.create(hole_id: hole.id, round_id: round.id)

    Shot.create(played_hole_id: played_hole.id, number: 1, mulligan: true)
    Shot.create(played_hole_id: played_hole.id, number: 2, drop: true)
    Shot.create(played_hole_id: played_hole.id, number: 3, practice: true)
    Shot.create(played_hole_id: played_hole.id, number: 4, mulligan: true, green:true)
    Shot.create(played_hole_id: played_hole.id, number: 5, drop: true, green:true)
    Shot.create(played_hole_id: played_hole.id, number: 6, practice: true)

    data = Scorecard.set_scorecard_hash(round)
    expect(data.first[:practice_shots]).to eq(2)
  end

  it "properly sets the number of putts taken during a hole" do
    round = Round.create()
    hole = Hole.create(number: 3)
    played_hole = PlayedHole.create(hole_id: hole.id, round_id: round.id)

    Shot.create(played_hole_id: played_hole.id, number: 1, mulligan: true)
    Shot.create(played_hole_id: played_hole.id, number: 2, drop: true)
    Shot.create(played_hole_id: played_hole.id, number: 3, practice: true)
    Shot.create(played_hole_id: played_hole.id, number: 4, mulligan: true, green: true)
    Shot.create(played_hole_id: played_hole.id, number: 5, drop: true, green:true)
    Shot.create(played_hole_id: played_hole.id, number: 6, practice: true)
    played_hole.shots.each do |ms|
      puts ms.inspect
      puts "_"
    end
    data = Scorecard.set_scorecard_hash(round)
    expect(data.first[:putts]).to eq(2)
  end

  it "properly sets the score for a hole" do
    round = Round.create()
    hole = Hole.create(number: 3)
    played_hole = PlayedHole.create(hole_id: hole.id, round_id: round.id)

    Shot.create(played_hole_id: played_hole.id, number: 1, mulligan: true)
    Shot.create(played_hole_id: played_hole.id, number: 2, drop: true)
    Shot.create(played_hole_id: played_hole.id, number: 3, practice: true)
    Shot.create(played_hole_id: played_hole.id, number: 4, mulligan: true)
    Shot.create(played_hole_id: played_hole.id, number: 5, drop: true)
    Shot.create(played_hole_id: played_hole.id, number: 6, practice: true)

    data = Scorecard.set_scorecard_hash(round)
    expect(data.first[:score]).to eq(4)
  end
end
