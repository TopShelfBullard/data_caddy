class CoursesController < ApplicationController

  private
  def round_params
    params.require(:course).permit(:name)
  end
end
