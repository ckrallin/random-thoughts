class PlacesController < ApplicationController
  before_action :authenticate_user!
  def index
    @places = current_user.places
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:title, :start, :end)
  end
end
