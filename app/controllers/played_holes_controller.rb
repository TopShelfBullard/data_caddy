class PlayedHolesController < ApplicationController
  def show
    @played_hole = PlayedHole.find(params[:id])
  end
end
