class ThoughtsController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @place.thoughts.create(thought_params.merge(user: current_user))
    if @place.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
      redirect_to root_path
    end
  end

  private

  def thought_params
    params.require(:thought).permit(:description, :favorite)
  end
end
