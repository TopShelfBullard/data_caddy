class ShotsController < ApplicationController
  def new
    @played_hole = PlayedHole.find(params[:played_hole_id])
    @shot = Shot.new()

    if @played_hole.shots.nil? || @played_hole.shots.empty?
      @shot.number = 1
    else
      @shot.number = @played_hole.shots.length + 1
    end

    @club_options = Club.all.map{|club| ["#{club.name}", club.id]}

    @lie = Lie.new()
    @shot_result = Result.new()
    @shot.lie = @lie
  end

  def edit
  end

  def create
    @shot = Shot.new()

    @shot.save

    if !@shot.lie
      # Do lie stuffs
    end

    if !@shot.shot_result
      # Do result stuffs
    end
  end

  private
  def shot_params
    params.require(:shot).permit(:played_hole_id, :number, :club_id, :lie_id, :shot_result_id)
  end
end
