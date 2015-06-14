class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  def index
    @clubs = Club.all
  end

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
    if @club.save
      redirect_to @club
    else
      render 'new'
    end
  end

  def update
    if @club.update(club_params)
      redirect_to @club

    else
      render 'edit'
    end
  end

  def destroy
    @club.destroy
    redirect_to clubs_path
  end

  private
  def club_params
    params.require(:club).permit(:name, :head, :shaft, :abbreviation, :position)
  end

  def set_club
    @club = Club.find(params[:id])
  end
end
