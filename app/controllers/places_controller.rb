class PlacesController < ApplicationController
  before_action :authenticate_user!
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:title, :start, :end)
  end
end
