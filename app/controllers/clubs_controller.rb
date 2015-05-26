class ClubsController < ApplicationController

  private
  def round_params
    params.require(:club).permit(:name, :head, :shaft, :abbreviation)
  end
end
