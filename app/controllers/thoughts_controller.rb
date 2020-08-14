class ThoughtsController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @place.thoughts.create(thought_params.merge(user: current_user))
    redirect_to place_path(@place)
    if @place.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
      redirect_to root_path
    end
  end

  def update
     current_thought.update_attributes(thought_params)
     render plain: 'updated'  
  end

  private

  def current_thought
    @current_thought ||= Thought.find(params[:id])
  end

  helper_method :current_section
  def current_place
    @current_place ||= Place.find(params[:place_id])
  end

  def thought_params
    params.require(:thought).permit(:description, :favorite, :row_order_position)
  end
end
