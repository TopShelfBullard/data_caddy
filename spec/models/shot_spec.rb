require 'rails_helper'

RSpec.describe Shot, type: :model do
  fixtures :courses
  fixtures :players
  fixtures :holes
  fixtures :rounds
  fixtures :clubs
  fixtures :played_holes
  fixtures :shots

  it "knows when I'm at the tee-box" do
    shot = Shot.find(1)
    expect(Shot.is_teeing_off(shot)).to be_truthy
  end

  it "knows when I'm not at the tee-box" do
    shot = Shot.find(2)
    expect(Shot.is_teeing_off(shot)).to be_falsey
  end

  it "knows when I'm putting cause I'm using my putter" do
    shot = Shot.find(9)
    expect(Shot.is_putting(shot)).to be_truthy
  end

  it "knows when I'm putting cause I'm on the green" do
    shot = Shot.find(7)
    expect(Shot.is_putting(shot)).to be_truthy
  end

  it "knows when I'm not putting cause I'm on the green and I'm not using my putter" do
    shot = Shot.find(6)
    expect(Shot.is_putting(shot)).to be_falsey
  end

  it "understands that there is not a shot 0" do
    shot = Shot.find(6)
    expect(Shot.is_putting(shot)).to be_falsey
  end

  it "knows I'm done planning my shot because I've selected a club" do
    shot = Shot.create!(club_id: 1)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about punch shot" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, punch: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about a trick shot" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, trick: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about a full swing" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, full: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about a quarter swing" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, quarter: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about punch shot" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, half: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about a three quarters swing" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, three_quarters: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about teeing up" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, tee_up: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about teeing down" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, tee_down: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about teeing just right" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, tee_middle: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about hitting off the turf" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, off_the_turf: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm done planning my shot because I said something about an elevated" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, elevated_tee: true)
    expect(Shot.has_prepared(shot)).to be_truthy
  end

  it "knows I'm not done planning my shot because I haven't entered shit" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1)
    expect(Shot.has_prepared(shot)).to be_falsey
  end

  it "knows I'm done assessing the damage cause I said it's in the cup. Mark it, Dude." do
    shot = Shot.create!(cup: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on the apron" do
    shot = Shot.create!(apron: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on the green" do
    shot = Shot.create!(green: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said in the rough" do
    shot = Shot.create!(rough: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said on the beach" do
    shot = Shot.create!(beach: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said in the drink" do
    shot = Shot.create!(drink: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said out of bounds" do
    shot = Shot.create!(out_of_bounds: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said on a down-slope" do
    shot = Shot.create!(downslope: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on an up-slope" do
    shot = Shot.create!(upslope: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on a right sloping side hill" do
    shot = Shot.create!(side_hill_right: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on a left sloping side hill" do
    shot = Shot.create!(side_hill_left: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's behind a stupid-ass obstruction" do
    shot = Shot.create!(obstructed: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's one the fairway" do
    shot = Shot.create!(fairway: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I hooked it" do
      shot = Shot.create!(hook: true)
      expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot had a bit of a draw" do
    shot = Shot.create!(draw: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said pulled it" do
    shot = Shot.create!(pull: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot was pure" do
    shot = Shot.create!(pure: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I pushed it" do
    shot = Shot.create!(push: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot had a bit of a fade" do
    shot = Shot.create!(fade: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I sliced it" do
   shot = Shot.create!(shot_slice: true)
   expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot left" do
    shot = Shot.create!(left: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot right" do
    shot = Shot.create!(right: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said shot straight" do
    shot = Shot.create!(center: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I lobbed it" do
    shot = Shot.create!(lob: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it was a popup" do
    shot = Shot.create!(pop_up: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shanked it" do
    shot = Shot.create!(shank: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I skulled it" do
    shot = Shot.create!(skull: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I over-clubbed" do
    shot = Shot.create!(over_club: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I under-clubbed" do
    shot = Shot.create!(under_club: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said the trajectory was high" do
    shot = Shot.create!(high: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said  trajectory was low" do
    shot = Shot.create!(low: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I chunked it" do
    shot = Shot.create!(chunk: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I topped it" do
    shot = Shot.create!(top: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot too soft" do
    shot = Shot.create!(soft: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot too hard" do
    shot = Shot.create!(hard: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I took a mulligan" do
    shot = Shot.create!(mulligan: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I took a drop" do
    shot = Shot.create!(drop: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said It was a practice shot" do
    shot = Shot.create!(practice: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I hit the sweet spot" do
    shot = Shot.create!(sweet_spot: true)
    expect(Shot.has_evaluated_result(shot)).to be_truthy
  end

  it "knows I'm not done assessing the damage cause I haven't entered shit" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1)
    expect(Shot.has_prepared(shot)).to be_falsey
  end

  it "knows I'm haven't assesed the damage even though I've entered a bunch of stuff" do
    shot = Shot.create!(number: 4, played_hole_id: 1, round_id: 1, club_id: 1, punch: true, trick: true, full: true,
                        quarter: true, half: true, three_quarters: true, tee_up: true, tee_down: true, tee_middle: true,
                        off_the_turf: true, elevated_tee: true)
    expect(Shot.has_evaluated_result(shot)).to be_falsey
  end
end
