class LiesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    @lie = Lie.find(params[:id])
    @lie.save()
  end

  def destroy
  end

  private

end
