class PlayedHolesController < ApplicationController
  def show
    @played_hole = PlayedHole.find(params[:id])
  end

  private
  def played_hole_params
    params.require(:played_hole).permit(:round_id, :hole_id, :player_id)
  end
end
