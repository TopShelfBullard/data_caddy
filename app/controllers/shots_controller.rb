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
    params.require(:shot).permit( :number, :tee_up, :tee_down, :tee_middle, :off_the_turf, :elevated_tee, :punch, :trick,
      :full, :quarter, :half, :three_quarters, :hook, :draw, :pull, :pure, :push, :fade, :slice, :left, :right, :center,
      :lob, :pop_up, :shank, :skull, :over_club, :under_club, :high, :low, :chunk, :top, :soft, :hard, :cup, :apron, :green,
      :rough, :beach, :drink, :out_of_bounds, :downslope, :upslope, :side_hill_right, :side_hill_left, :obstructed, :fairway,
      :mulligan, :drop, :practice, :round_id, :club_id, :played_hole_id )
  end

  def ly_is_entered(shot)
    shot.tee_up || shot.tee_down || shot.tee_middle || shot.off_the_turf || shot.elevated_tee || shot.cup || shot.apron ||
     shot.green || shot.rough || shot.beach  || shot.drink || shot.out_of_bounds || shot.downslope ||
     shot.upslope ||shot.side_hill_right || sshot.side_hill_left || shot.obstructed || shot.fairway
  end

  def shot_is_entered(shot)
    shot.club_id || shot.punch || shot.trick || shot.full || shot.quarter || shot.half || shot.three_quarters
  end

  def result_is_entered(shot)
    shot.hook || shot.draw || shot.pull || shot.pure || shot.push || shot.fade || shot.slice || shot.left || shot.right ||
      shot.center || shot.lob || shot.pop_up || shot.shank || shot.skull || shot.over_club || shot.under_club || shot.high ||
      shot.low || shot.chunk || shot.top ||shot.soft || shot.hard || shot.mulligan || shot.drop || shot.practice
  end
end
