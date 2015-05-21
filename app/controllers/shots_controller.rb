class ShotsController < ApplicationController
  before_action :set_played_hole
  before_action :set_shot, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @shot = @played_hole.shots.build
  end

  def create
    @shot = @played_hole.shots.build(shot_params)
    @shot.number = @played_hole.shots.length
    if @shot.save
      redirect_to edit_played_hole_shot_path(@played_hole, @shot)
    else
      render :new
    end
  end

  def edit
    @ly_entered = ly_is_entered(@shot)
    @shot_entered = shot_is_entered(@shot)
    @result_entered = result_is_entered(@shot)
    @all_entered = @ly_entered && @shot_entered && @result_entered
    @club_options = Club.all.map{|club| ["#{club.name}", club.id]}
  end

  def update
    @shot.update(shot_params)

    if ly_is_entered(@shot) && shot_is_entered(@shot) && result_is_entered(@shot)
      redirect_to @played_hole
    else
      redirect_to edit_played_hole_shot_path(@played_hole, @shot)
    end
  end

  def destroy
  end

  private
  def set_shot
    @shot = @played_hole.shots.find(params[:id])
  end

  def set_played_hole
    @played_hole = PlayedHole.find(params[:played_hole_id])
  end

  def shot_params
    params.require(:shot).permit(:round_id, :club_id, :number, :tee_up, :tee_down, :tee_middle,
      :off_the_turf, :elevated_tee, :in_cup, :on_apron, :on_green, :in_rough, :on_beach, :in_drink, :out_of_bounds,
      :on_downslope, :on_upslope, :on_side_hill_right, :on_side_hill_left, :obstructed_by_trees, :on_fairway, :was_hook,
      :was_draw, :was_pull, :was_pure, :was_push, :was_fade, :was_slice, :was_lob, :was_pop_up, :was_shank, :was_skull,
      :over_club, :under_club, :high_trajectory, :low_trajectory, :chunked, :topped, :take_mulligan, :take_drop, :played_hole_id)
  end

  def ly_is_entered(shot)
    shot.tee_up == true || shot.tee_down == true || shot.tee_middle == true || shot.off_the_turf == true || shot.elevated_tee == true ||
        shot.in_cup == true || shot.on_apron == true || shot.on_green == true || shot.in_rough == true || shot.on_beach == true ||
        shot.in_drink == true || shot.out_of_bounds == true || shot.on_downslope == true || shot.on_upslope == true ||shot.on_side_hill_right == true ||
        shot.on_side_hill_left == true || shot.obstructed_by_trees == true || shot.on_fairway == true
  end

  def shot_is_entered(shot)
    shot.club_id
  end

  def result_is_entered(shot)
    shot.was_hook == true || shot.was_draw == true || shot.was_pull == true || shot.was_pure == true || shot.was_push == true || shot.was_fade == true ||
        shot.was_slice == true || shot.was_lob == true || shot.was_pop_up == true || shot.was_shank == true || shot.was_skull == true || shot.over_club == true ||
        shot.under_club == true || shot.high_trajectory == true || shot.low_trajectory == true || shot.chunked == true || shot.topped == true ||
        shot.take_mulligan == true || shot.take_drop == true
  end
end
