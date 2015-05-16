class PlayedHolesController < ApplicationController
  def index
    if params[:round_id]
      @round = Round.find(params[:round_id])
      @played_holes = @round.played_holes
    else
      @played_holes = current_player.played_holes
    end
  end

  def show
    @played_hole = PlayedHole.find(params[:played_hole_id])
  end

  def edit
  end

  def create
    @round = Round.find(params[:round_id])
    @player_holes = @round.course.holes.map{|hole| PlayedHole.new(player_id: current_player.id, hole_id: hole.id, round_id: @round.id)}
  end

  def update
  end

  def destroy
  end

  private
  def played_hole_params
    params.require(:played_hole).permit(:date)
  end
end
