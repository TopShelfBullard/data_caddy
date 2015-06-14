class Shot < ActiveRecord::Base
  belongs_to :played_hole
  belongs_to :club

  def is_off_the_tee
    self.number == 1
  end

  def is_a_putt
    ball_is_on_the_green = self.previous_shot_was_on_the_green
    player_is_using_the_putter = self.club.nil? ? false : self.club.name == "Putter"
    ball_is_on_the_green || player_is_using_the_putter
  end

  def has_prepared
    !self.club.nil?
  end

  def has_evaluated
    self.hook || self.draw || self.pull || self.pure || self.push || self.fade || self.shot_slice || self.left || self.right ||
        self.center || self.lob ||self.pop_up || self.shank || self.skull || self.over_club || self.under_club || self.high ||
        self.low || self.chunk || self.top ||self.soft || self.hard || self.mulligan || self.drop || self.practice || self.sweet_spot
  end

  def entered_ly
    self.cup || self.apron || self.green || self.rough || self.beach  || self.drink || self.out_of_bounds || self.downslope ||
        self.upslope ||self.side_hill_right || self.side_hill_left || self.obstructed || self.fairway
  end

  def previous_shot_was_on_the_green
    previous_shot = self.previous_shot
    previous_shot.nil? ? false : previous_shot.green
  end

  def previous_shot
    previous_shot_index = self.number - 2
    previous_shot_index >= 0 ? self.played_hole.shots[previous_shot_index] : nil
  end
end
