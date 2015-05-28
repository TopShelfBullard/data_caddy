class ClubsController < ApplicationController
  def show
    @club = Club.find(params[:id])
  end

  def new
    @club = Club.new()
    shafts = ["steel", "graphite"]
    heads = ["wood", "iron"]
    @shaft_options = shafts.map{|shaft| [shaft, shaft]}
    @head_options = heads.map{|head| [head, head]}
  end

  def edit
    @club = Club.find(params[:id])
    shafts =  @club.shaft == "steel" ? ["steel", "graphite"] : ["graphite", "steel"]
    heads =  @club.head == "wood" ? ["wood", "iron"] : ["iron", "wood"]
    @shaft_options = shafts.map{|shaft| [shaft, shaft]}
    @head_options = heads.map{|head| [head, head]}
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to @club
    else
      render 'new'
    end
  end

  def update
    @club = Club.find(params[:id])

    if @club.update(club_params)
      redirect_to @club

    else
      render 'edit'
    end
  end

  private
  def club_params
    params.require(:club).permit(:name, :head, :shaft, :abbreviation)
  end
end
