class Shot < ActiveRecord::Base
  belongs_to :played_hole
  belongs_to :club

  def self.is_teeing_off(shot)
    shot.number == 1
  end

  def self.is_putting(shot)
    return false if shot.number.nil? || shot.number <= 1

    on_the_green = self.previous_shot_was_on_the_green(shot)
    shot.update(green: true, club_id: Club.find_by(name: "Putter").id) if on_the_green
    on_the_green || shot.green
  end

  def self.has_prepared(shot)
    shot.club_id || shot.punch || shot.trick || shot.full || shot.quarter || shot.half || shot.three_quarters ||
        shot.tee_up || shot.tee_down || shot.tee_middle || shot.off_the_turf || shot.elevated_tee
  end

  def self.has_evaluated_result(shot)
    shot.cup || shot.apron || shot.green || shot.rough || shot.beach  || shot.drink || shot.out_of_bounds || shot.downslope ||
        shot.upslope ||shot.side_hill_right || shot.side_hill_left || shot.obstructed || shot.fairway || shot.hook || shot.draw ||
        shot.pull || shot.pure || shot.push || shot.fade || shot.shot_slice || shot.left || shot.right || shot.center || shot.lob ||
        shot.pop_up || shot.shank || shot.skull || shot.over_club || shot.under_club || shot.high || shot.low || shot.chunk ||
        shot.top ||shot.soft || shot.hard || shot.mulligan || shot.drop || shot.practice || shot.sweet_spot
  end

  private
  def self.previous_shot_was_on_the_green(shot)
    self.find_by(played_hole_id: shot.played_hole_id, number: shot.number - 1).green
  end
end
