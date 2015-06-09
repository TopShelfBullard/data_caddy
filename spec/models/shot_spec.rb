require 'rails_helper'

RSpec.describe Shot, type: :model do

  it "knows when I'm at the tee-box" do
    shot = Shot.new(number: 1)
    expect(shot.is_off_the_tee).to be_truthy
  end

  it "knows when I'm not at the tee-box" do
    shot = Shot.new(number: 2)
    expect(shot.is_off_the_tee).to be_falsey
  end

  it "knows when I'm putting cause I'm on the green" do
    hole = Hole.create()
    played_hole = PlayedHole.create(hole_id: hole.id)
    shot1 = Shot.create(played_hole_id: played_hole.id, number: 1)
    shot2 = Shot.create(played_hole_id: played_hole.id, number: 2, green: true)
    shot3 = Shot.create(played_hole_id: played_hole.id, number: 3)

    expect(shot3.is_a_putt).to be_truthy
  end

  it "knows when I'm not putting cause I'm not on the green" do
    hole = Hole.create()
    played_hole = PlayedHole.create(hole_id: hole.id)
    shot1 = Shot.create(played_hole_id: played_hole.id, number: 1)
    shot2 = Shot.create(played_hole_id: played_hole.id, number: 2)
    shot3 = Shot.create(played_hole_id: played_hole.id, number: 3)

    expect(shot3.is_a_putt).to be_falsey
  end

  it "knows I'm done planning my shot because I've selected a club" do
    hole = Hole.create()
    played_hole = PlayedHole.create(hole: hole)
    club = Club.create()
    shot = Shot.create(played_hole: played_hole, club_id: club.id)

    expect(shot.has_prepared).to be_truthy
  end

  it "knows I'm not done planning my shot because I haven't selected a club" do
    hole = Hole.create()
    played_hole = PlayedHole.create(hole: hole)
    shot = Shot.create(played_hole: played_hole)

    expect(shot.has_prepared).to be_falsey
  end

  it "knows I'm done assessing the damage cause I said it's in the cup. Mark it, Dude." do
    shot = Shot.new(cup: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on the apron" do
    shot = Shot.new(apron: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on the green" do
    shot = Shot.new(green: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said in the rough" do
    shot = Shot.new(rough: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said on the beach" do
    shot = Shot.new(beach: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said in the drink" do
    shot = Shot.new(drink: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said out of bounds" do
    shot = Shot.new(out_of_bounds: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said on a down-slope" do
    shot = Shot.new(downslope: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on an up-slope" do
    shot = Shot.new(upslope: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on a right sloping side hill" do
    shot = Shot.new(side_hill_right: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on a left sloping side hill" do
    shot = Shot.new(side_hill_left: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's behind a stupid-ass obstruction" do
    shot = Shot.new(obstructed: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's one the fairway" do
    shot = Shot.new(fairway: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I hooked it" do
      shot = Shot.new(hook: true)
      expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot had a bit of a draw" do
    shot = Shot.new(draw: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said pulled it" do
    shot = Shot.new(pull: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot was pure" do
    shot = Shot.new(pure: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I pushed it" do
    shot = Shot.new( push: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot had a bit of a fade" do
    shot = Shot.new(fade: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I sliced it" do
   shot = Shot.new(shot_slice: true)
   expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot left" do
    shot = Shot.new(left: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said shot straight" do
    shot = Shot.new(center: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I lobbed it" do
    shot = Shot.new(lob: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it was a popup" do
    shot = Shot.new(pop_up: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shanked it" do
    shot = Shot.new(shank: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I skulled it" do
    shot = Shot.new(skull: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I over-clubbed" do
    shot = Shot.new(over_club: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I under-clubbed" do
    shot = Shot.new(under_club: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said the trajectory was high" do
    shot = Shot.new(high: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said  trajectory was low" do
    shot = Shot.new(low: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I chunked it" do
    shot = Shot.new(chunk: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I topped it" do
    shot = Shot.new(top: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot too soft" do
    shot = Shot.new(soft: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot too hard" do
    shot = Shot.new(hard: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I took a mulligan" do
    shot = Shot.new(mulligan: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I took a drop" do
    shot = Shot.new(drop: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said It was a practice shot" do
    shot = Shot.new(practice: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I hit the sweet spot" do
    shot = Shot.new(sweet_spot: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm not done assessing the damage cause I haven't entered shit" do
    shot = Shot.new()
    expect(shot.has_evaluated).to be_falsey
  end

  it "knows I'm haven't assesed the damage even though I've entered a bunch of stuff" do
    club = Club.new()
    shot = Shot.new(club_id: club.id, punch: true, trick: true, full: true,
                             quarter: true, half: true, three_quarters: true, tee_up: true, tee_down: true, tee_middle: true,
                             off_the_turf: true, elevated_tee: true)
    expect(shot.has_evaluated).to be_falsey
  end
end
