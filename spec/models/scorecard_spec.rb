require 'rails_helper'

RSpec.describe Scorecard, type: :model do
  def test_round
    jeffery = Player.create!(name: "Jeffery Lebowski", email: "jeffery@obviouslynotagolfer.com", password: "jeffery1234", password_confirmation: "jeffery1234")
    timber_terrace = Course.create!(name: "Timber Terrace")
    timber_terrace_one = Hole.create!(number: 1, par: 5, distance: 453, course_id: timber_terrace.id)
    round = Round.create!(date: "05-18-2015", score: 63, finished: true, course: timber_terrace, player: jeffery)
    played_hole_one = PlayedHole.create!(hole_id: timber_terrace_one.id, round_id: round.id, player_id: jeffery.id)
    putter = Club.create!(name: "Putter", head: "putter", shaft: "steel", abbreviation: "P")
    bogus = Club.create!(name: "Bogus Club", head: "Bogus", shaft: "Bogus", abbreviation: "B")
    Shot.create!(number: 1, played_hole: played_hole_one, round_id: round.id, mulligan: true, club: bogus)
    Shot.create!(number: 2, played_hole: played_hole_one, round_id: round.id, mulligan: true, club: bogus)
    Shot.create!(number: 3, played_hole: played_hole_one, round_id: round.id, drop: true, club: bogus)
    Shot.create!(number: 4, played_hole: played_hole_one, round_id: round.id, drop: true, club: bogus)
    Shot.create!(number: 5, played_hole: played_hole_one, round_id: round.id, practice: true, club: bogus)
    Shot.create!(number: 6, played_hole: played_hole_one, round_id: round.id, practice: true, club: bogus)
    Shot.create!(number: 7, played_hole: played_hole_one, round_id: round.id, club: putter)
    Shot.create!(number: 8, played_hole: played_hole_one, round_id: round.id, club: putter)
    Shot.create!(number: 8, played_hole: played_hole_one, round_id: round.id, club: putter)
    round
  end

  it "properly sets the number of mulligans taken during a hole" do
    round =  test_round
    data = Scorecard.set_scorecard_hash(round)
    expect(data.first[:mulligans]).to eq(2)
  end
end
