class HolesController < ApplicationController
  before_action :set_course
  before_action :set_hole, only: [:edit, :update]

  def new
    @hole = @course.holes.build
  end

  def create
    @hole = @course.holes.build(hole_params)
    @hole.number = @course.holes.length
    if @hole.save
      redirect_to @course
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hole.update(shot_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  private
  def set_hole
    @hole = @course.holes.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def hole_params
    params.require(:hole).permit(:number, :par, :distance)
  end
end