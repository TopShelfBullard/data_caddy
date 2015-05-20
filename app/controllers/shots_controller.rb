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
    params.require(:shot).permit( :round_id, :played_hole_id, :club_id, :number, :tee_up, :tee_down, :tee_middle, :off_the_turf,
                                  :elevated_tee, :was_hook, :was_draw, :was_pull, :was_pure, :was_push, :was_fade, :was_slice,
                                  :was_lob, :was_pop_up, :was_shank, :was_skull, :over_club, :under_club, :high_trajectory,
                                  :low_trajectory, :chunked, :topped, :in_cup, :on_apron, :on_green, :in_rough, :on_beach,
                                  :in_drink, :out_of_bounds, :on_downslope, :on_upslope, :on_side_hill_right, :on_side_hill_left,
                                  :obstructed_by_trees, :on_fairway, :take_mulligan, :take_drop,)
  end
end
