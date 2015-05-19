class ShotsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def shot_params
    params.require(:shot).permit(:played_hole_id, :number, :club_id, :lie_id, :shot_result_id)
  end
end
