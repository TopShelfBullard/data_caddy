class RoundsController < ApplicationController
  def index
    @rounds = Round.where(player_id: current_player.id)
  end

  def show
    @round = Round.find(params[:id])
    @scorecard = Scorecard.set_scorecard_hash(@round)
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

end
