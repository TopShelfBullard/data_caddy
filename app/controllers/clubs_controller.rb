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
  end

  def edit
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
    params.require(:club).permit(:name, :position)
  end

  def set_club
    @club = Club.find(params[:id])
  end
end
