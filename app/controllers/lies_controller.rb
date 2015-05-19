class LiesController < ApplicationController
  def new
    @shot = Shot.find(params[:shot_id])
    @lie = Lie.new()
    @lie.shot = @shot
    @shot.lie = @lie
  end

  def create
    @lie = Lie.new(lie_params)

    if @lie.save
      redirect_to edit_shot_path(@shot)
    else
      render 'new'
    end
  end

  private
  def lie_params
    params.require(:lie).permit(:in_cup, :on_apron, :on_green, :in_rough, :on_beach, :in_drink, :out_of_bounds, :on_downslope,
                                :on_upslope, :on_side_hill_right, :on_side_hill_left, :obstructed_by_trees, :on_fairway, :tee_up,
                                :tee_down, :tee_middle, :elevated_tee, :off_the_turf)
  end
end
