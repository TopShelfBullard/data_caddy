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
    shot.tee_up || shot.tee_down || shot.tee_middle || shot.off_the_turf || shot.elevated_tee || shot.in_cup || shot.on_apron ||
        shot.on_green || shot.in_rough || shot.on_beach  || shot.in_drink || shot.out_of_bounds || shot.on_downslope ||
        shot.on_upslope ||shot.on_side_hill_right || sshot.on_side_hill_left || shot.obstructed_by_trees || shot.on_fairway
  end

  def shot_is_entered(shot)
    shot.club_id
  end

  def result_is_entered(shot)
    shot.was_hook || shot.was_draw || shot.was_pull || shot.was_pure || shot.was_push || shot.was_fade || shot.was_slice ||
        shot.was_lob || shot.was_pop_up || shot.was_shank || shot.was_skull || shot.over_club || shot.under_club ||
        shot.high_trajectory || shot.low_trajectory || shot.chunked || shot.topped ||shot.take_mulligan || shot.take_drop
  end
end
