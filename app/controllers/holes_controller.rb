class HolesController < ApplicationController

  private
  def played_hole_params
    params.require(:played_hole).permit(:number, :par, :distance)
  end
end