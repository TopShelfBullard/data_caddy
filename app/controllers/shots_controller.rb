class ShotsController < ApplicationController
  before_action :set_played_hole
  before_action :set_shot, only: [:show, :edit, :update, :destroy]
  before_action :set_new_shot, only: [:new]
  before_action :set_shot_status, only: [:new, :edit]

  def show
  end

  def new
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

  end

  def update
    @shot.update(shot_params)
    if @shot.cup
      redirect_to round_path(@played_hole.round)
    elsif !@shot.has_prepared || !@shot.has_evaluated || !@shot.entered_ly
      redirect_to edit_played_hole_shot_path(@played_hole, @shot)
    else
      redirect_to @played_hole
    end
  end

  private
  def set_shot
    @shot = @played_hole.shots.find(params[:id])
  end

  def set_new_shot
    @shot = @played_hole.shots.build
    @shot.number = @played_hole.shots.length
  end

  def set_played_hole
    @played_hole = PlayedHole.find(params[:played_hole_id])
  end

  def set_shot_status
    @prep_entered = @shot.has_prepared
    @result_entered = @shot.has_evaluated
    @ly_entered = @shot.entered_ly

    @all_entered = @prep_entered && @result_entered && @ly_entered

    @is_tee = @shot.is_off_the_tee
    @is_putting = @shot.is_a_putt

    @club_options = Club.all.map{|club| ["#{club.name}", club.id]}

    @shot.green = @is_putting
    @club_options = @club_options.unshift(@club_options.pop) if @is_putting
  end

  def shot_params
    params.require(:shot).permit( :number, :tee_up, :tee_down, :tee_middle, :off_the_turf, :elevated_tee, :punch, :trick,
      :full, :quarter, :half, :three_quarters, :gimme, :knocked_in_bounds, :worm_burner, :hook, :draw, :pull, :squib,
      :pure, :good_speed, :push, :fade, :shot_slice, :left, :right, :center, :lob, :pop_up, :shank, :skull, :over_club,
      :under_club, :high, :low, :chunk, :top, :soft, :hard, :cup, :apron, :green, :rough, :beach, :drink, :out_of_bounds,
      :downslope, :upslope, :side_hill_right, :side_hill_left, :obstructed, :fairway, :mulligan, :drop, :practice, :round_id,
      :club_id, :played_hole_id, :sweet_spot )
  end
end
