class ShotResultsController < ApplicationController
  def new
    @shot = Shot.find(params[:shot_id])
    @shot_result = ShotResult.new()
    @shot_result.shot = @shot
    @shot.shot_result = @shot_result
  end

  def create
    @shot_result = ShotResult.new(shot_result_params)
    @shot = Shot.find(params[:shot_id])
    if @shot_result.save
      redirect_to @shot
    else
      render 'new'
    end
  end

  private
  def shot_result_params
    params.require(:shot_result).permit(:was_hook, :was_draw, :was_pull, :was_pure, :was_push, :was_fade, :was_slice,
                                  :was_worm_burner, :was_goldie_bounce, :was_lob, :was_stoney, :was_pop_up, :was_shank,
                                  :was_skull, :was_tree_shot, :over_club, :under_club, :high_trajectory, :low_trajectory,
                                  :chunked, :topped)
  end
end
