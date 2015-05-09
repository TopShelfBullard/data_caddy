class RoundsController < ApplicationController
  def index
    @rounds = Round.all

  end

  def show
    @round = Round.find(params[:id])
  end

  def new
    @round = Round.new
  end

  def edit
    @round = Round.find(params[:id])
    @hole_options = @round.holes.map{|hole| ["#{hole.number}. #{hole.par} - #{hole.distance} yards", hole.id]}
  end

  def create
    @round = Round.new(round_params)

    if @round.save
      redirect_to @round
    else
      render 'new'
    end
  end

  def update
    @round = Round.find(params[:id])

    if @round.update(round_params)
      redirect_to @round
    else
      render 'edit'
    end
  end

  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    redirect_to round_path
  end

  private
  def book_params
    params.require(:round).permit(:date, :score)
  end
end
