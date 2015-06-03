class ShotsController < ApplicationController
  before_action :set_played_hole
  before_action :set_shot, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @shot = @played_hole.shots.build
    @shot.number = @played_hole.shots.length
    @is_tee = Shot.is_teeing_off(@shot)
    @club_options = Club.all.map{|club| ["#{club.name}", club.id]}
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
    @is_tee = Shot.is_teeing_off(@shot)
    @prep_entered = Shot.has_prepared(@shot)
    @result_entered = Shot.has_evaluated_result(@shot)
    @is_putting = Shot.is_putting(@shot)
    @shot.green = true if @is_putting
    @all_entered = @prep_entered && @result_entered
    @club_options = Club.all.map{|club| ["#{club.name}", club.id]}
  end

  def update
    @shot.update(shot_params)

    if prep_entered(@shot) && result_entered(@shot)
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
    params.require(:shot).permit( :number, :tee_up, :tee_down, :tee_middle, :off_the_turf, :elevated_tee, :punch, :trick,
      :full, :quarter, :half, :three_quarters, :hook, :draw, :pull, :pure, :push, :fade, :shot_slice, :left, :right, :center,
      :lob, :pop_up, :shank, :skull, :over_club, :under_club, :high, :low, :chunk, :top, :soft, :hard, :cup, :apron, :green,
      :rough, :beach, :drink, :out_of_bounds, :downslope, :upslope, :side_hill_right, :side_hill_left, :obstructed, :fairway,
      :mulligan, :drop, :practice, :round_id, :club_id, :played_hole_id, :sweet_spot )
  end
end
