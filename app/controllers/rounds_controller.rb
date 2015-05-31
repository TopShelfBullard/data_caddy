class RoundsController < ApplicationController
  def index
    @rounds = Round.where(player_id: current_player.id)
  end

  def show
    @round = Round.find(params[:id])
    @scorecard = set_scorecard_hash(@round)
  end

  def new
    @round = Round.new()
    @course_options = Course.all.map{|course| ["#{course.name}", course.id]}
  end

  def edit
    @round = Round.find(params[:id])
    @hole_options = @round.holes.map{|hole| ["#{hole.number}. #{hole.par} - #{hole.distance} yards", hole.id]}
    @course_options = Course.all.map{|course| ["#{course.name}", course.id]}
  end

  def create
    @round = Round.new(round_params)
    @round.player = current_player
    @round.course.holes.each do |hole|
      played_hole = PlayedHole.new()
      played_hole.hole = hole
      played_hole.player = @round.player
      played_hole.round = @round
      played_hole.save
    end

    if @round.save
      redirect_to @round
    else
      render 'new'
    end
  end

  def update
    @round = Round.find(params[:id])

    if @round.update(round_params)
      redirect_to @round
    else
      render 'edit'
    end
  end

  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    redirect_to round_path
  end

  private
  def round_params
    params.require(:round).permit(:date, :course_id, :player_id, :score, :finished)
  end

  def set_scorecard_hash(round)
    round.played_holes.map {|played_hole|
      score = 0
      mulligans = 0
      putts = 0

      played_hole.shots.each do |shot|
        score = shot.mulligan ? score : score + 1
        score = shot.drop ? score + 1 : score
        mulligans = shot.mulligan ? mulligans + 1 : mulligans
        putts = shot.club.name == "Putter" ? putts + 1 : putts
      end

      { played_hole: played_hole, number: played_hole.hole.number, par: played_hole.hole.par, distance: played_hole.hole.distance,
        score: score, mulligans: mulligans, putts: putts, shots: played_hole.shots }
    }
  end

end
