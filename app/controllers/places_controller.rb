class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = current_user.places.order(start: :desc)
    @new_place = Place.new
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @places = current_user.places.order(start: :desc)
    @place = Place.find(params[:id])
    @new_place = Place.new
    @thought = Thought.new
    @thoughts = @place.thoughts.order("favorite DESC").class
    if @place.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    if @place.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  private

  def place_params
    params.require(:place).permit(:start, :location, :title, :end)
  end
end
