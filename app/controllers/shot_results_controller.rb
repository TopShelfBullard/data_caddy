class ShotResultsController < ApplicationController
  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  private
  def round_params
    params.require(:round).permit(:was_hook, :was_draw, :was_pull, :was_pure, :was_push, :was_fade, :was_slice,
                                  :was_worm_burner, :was_goldie_bounce, :was_lob, :was_stoney, :was_pop_up, :was_shank,
                                  :was_skull, :was_tree_shot, :over_club, :under_club, :high_trajectory, :low_trajectory,
                                  :chunked, :topped)
  end
end
