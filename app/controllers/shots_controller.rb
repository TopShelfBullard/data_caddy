class ShotsController < ApplicationController
  def new
    @played_hole = PlayedHole.find(params[:played_hole_id])
    @shot = Shot.new()
  end

  def create
    @shot = Shot.new()
    if @played_hole.shots.nil? || @played_hole.shots.empty?
      @shot.number = 1
    else
      @shot.number = @played_hole.shots.length + 1
    end

    @shot.save

    if !@shot.lie
      # Do lie stuffs
    end

    if !@shot.result
      # Do result stuffs
    end
  end

  def edit

  end
  private
  def shot_params
    params.require(:shot).permit(:played_hole_id, :number, :club_id, :ly_id, :result_id)
  end
end
