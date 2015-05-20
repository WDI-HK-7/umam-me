class RestaurantsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])

    if @restaurant.nil?
      render :json => {
        :message => { :message => "Cannot find restaurant" }
      }
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
