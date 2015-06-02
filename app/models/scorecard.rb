class Scorecard
  def self.set_scorecard_hash(round)
    round.played_holes.map { |played_hole| self.collect_played_hole_data(played_hole, self.played_hole_data(played_hole)) }
  end

  def self.played_hole_data(played_hole)
    {
        played_hole: played_hole,
        number: played_hole.hole.number,
        par: played_hole.hole.par,
        distance: played_hole.hole.distance,
        shots: played_hole.shots,
        score: 0, mulligans: 0, drops: 0, practice_shots: 0, putts: 0
    }
  end

  def self.collect_played_hole_data(played_hole, data)
    played_hole.shots.each do |shot|
      data[:score] = data[:score] + self.increment_score(shot.mulligan, shot.drop, shot.practice)
      data[:practice_shots] = shot.practice ? data[:practice_shots] + 1 : data[:practice_shots]
      data[:drops] = shot.drop ? data[:drops] + 1 : data[:drops]
      data[:mulligans] = shot.mulligan ? data[:mulligans] + 1 : data[:mulligans]
      data[:putts] = shot.club.name == "Putter" ? data[:putts] + 1 : data[:putts]
    end

    data
  end

  def self.increment_score(mulligan, drop, practice)
    return 0 if mulligan || practice
    return 2 if drop
    1
  end
end