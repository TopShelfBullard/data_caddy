require 'rails_helper'
require 'factory_girl_rails'
RSpec.describe Shot, type: :model do

  it "knows when I'm at the tee-box" do
    shot = FactoryGirl.build(:shot, number: 1)
    expect(shot.is_off_the_tee).to be_truthy
  end

  it "knows when I'm not at the tee-box" do
    shot = FactoryGirl.build(:shot, number: 2)
    expect(shot.is_off_the_tee).to be_falsey
  end

  it "knows when I'm putting cause I'm on the green" do
    hole = FactoryGirl.create(:hole)
    played_hole = FactoryGirl.create(:played_hole, hole: hole)
    shot1 = FactoryGirl.create(:shot, played_hole: played_hole, number: 1)
    shot2 = FactoryGirl.create(:shot, played_hole: played_hole, number: 2, green: true)
    shot3 = FactoryGirl.create(:shot, played_hole: played_hole, number: 3)

    expect(shot3.is_a_putt(played_hole)).to be_truthy
  end

  it "knows when I'm not putting cause I'm not on the green" do
    hole = FactoryGirl.create(:hole)
    played_hole = FactoryGirl.create(:played_hole, hole: hole)
    shot1 = FactoryGirl.create(:shot, played_hole: played_hole, number: 1)
    shot2 = FactoryGirl.create(:shot, played_hole: played_hole, number: 2)
    shot3 = FactoryGirl.create(:shot, played_hole: played_hole, number: 3)

    expect(shot3.is_a_putt(played_hole)).to be_falsey
  end

  it "knows I'm done planning my shot because I've selected a club" do
    hole = FactoryGirl.create(:hole)
    played_hole = FactoryGirl.create(:played_hole, hole: hole)
    club = FactoryGirl.create(:club)
    shot = FactoryGirl.create(:shot, played_hole: played_hole, club: club)

    expect(shot.has_prepared).to be_truthy
  end

  it "knows I'm not done planning my shot because I haven't selected a club" do
    hole = FactoryGirl.create(:hole)
    played_hole = FactoryGirl.create(:played_hole, hole: hole)
    shot = FactoryGirl.create(:shot, played_hole: played_hole)

    expect(shot.has_prepared).to be_falsey
  end

  it "knows I'm done assessing the damage cause I said it's in the cup. Mark it, Dude." do
    shot = FactoryGirl.build(:shot, cup: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on the apron" do
    shot = FactoryGirl.build(:shot, apron: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on the green" do
    shot = FactoryGirl.build(:shot, green: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said in the rough" do
    shot = FactoryGirl.build(:shot, rough: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said on the beach" do
    shot = FactoryGirl.build(:shot, beach: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said in the drink" do
    shot = FactoryGirl.build(:shot, drink: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said out of bounds" do
    shot = FactoryGirl.build(:shot, out_of_bounds: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said on a down-slope" do
    shot = FactoryGirl.build(:shot, downslope: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on an up-slope" do
    shot = FactoryGirl.build(:shot, upslope: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on a right sloping side hill" do
    shot = FactoryGirl.build(:shot, side_hill_right: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's on a left sloping side hill" do
    shot = FactoryGirl.build(:shot, side_hill_left: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's behind a stupid-ass obstruction" do
    shot = FactoryGirl.build(:shot, obstructed: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it's one the fairway" do
    shot = FactoryGirl.build(:shot, fairway: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I hooked it" do
      shot = FactoryGirl.build(:shot, hook: true)
      expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot had a bit of a draw" do
    shot = FactoryGirl.build(:shot, draw: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said pulled it" do
    shot = FactoryGirl.build(:shot, pull: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot was pure" do
    shot = FactoryGirl.build(:shot, pure: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I pushed it" do
    shot = FactoryGirl.build(:shot, push: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said my shot had a bit of a fade" do
    shot = FactoryGirl.build(:shot, fade: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I sliced it" do
   shot = FactoryGirl.build(:shot, shot_slice: true)
   expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot left" do
    shot = FactoryGirl.build(:shot, left: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said shot straight" do
    shot = FactoryGirl.build(:shot, center: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I lobbed it" do
    shot = FactoryGirl.build(:shot, lob: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said it was a popup" do
    shot = FactoryGirl.build(:shot, pop_up: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shanked it" do
    shot = FactoryGirl.build(:shot, shank: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I skulled it" do
    shot = FactoryGirl.build(:shot, skull: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I over-clubbed" do
    shot = FactoryGirl.build(:shot, over_club: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I under-clubbed" do
    shot = FactoryGirl.build(:shot, under_club: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said the trajectory was high" do
    shot = FactoryGirl.build(:shot, high: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said  trajectory was low" do
    shot = FactoryGirl.build(:shot, low: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I chunked it" do
    shot = FactoryGirl.build(:shot, chunk: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I topped it" do
    shot = FactoryGirl.build(:shot, top: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot too soft" do
    shot = FactoryGirl.build(:shot, soft: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I shot too hard" do
    shot = FactoryGirl.build(:shot, hard: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I took a mulligan" do
    shot = FactoryGirl.build(:shot, mulligan: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I took a drop" do
    shot = FactoryGirl.build(:shot, drop: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said It was a practice shot" do
    shot = FactoryGirl.build(:shot, practice: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm done assessing the damage cause I said I hit the sweet spot" do
    shot = FactoryGirl.build(:shot, sweet_spot: true)
    expect(shot.has_evaluated).to be_truthy
  end

  it "knows I'm not done assessing the damage cause I haven't entered shit" do
    shot = FactoryGirl.build(:shot)
    expect(shot.has_evaluated).to be_falsey
  end

  it "knows I'm haven't assesed the damage even though I've entered a bunch of stuff" do
    club = FactoryGirl.build(:club)
    shot = FactoryGirl.build(:shot, club: club, punch: true, trick: true, full: true,
                             quarter: true, half: true, three_quarters: true, tee_up: true, tee_down: true, tee_middle: true,
                             off_the_turf: true, elevated_tee: true)
    expect(shot.has_evaluated).to be_falsey
  end
end
