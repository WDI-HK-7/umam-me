class DishesController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @dishes = Dish.all
  end

  def create    
    @dish = Dish.new(dish_params)

    if @dish.save
      render :json => { message: "saved", dish: @dish }
    else
      render :json => { message: "not saved" }
    end
  end

  def show
    @dish = Dish.find_by_id(params[:id])

    if @dish.nil?
      render :json => {
        :message => { :message => "Cannot find dish" }
      }
    end
  end

  def destroy
    # before_action :authenticate_user!

    @dish = dish.find_by_id(params[:id])

    if @dish.nil?
      render :json => {
        :message => { :message => "Cannot find dish", :delete => false }
      }
    else
      if @dish.destroy
        render :json => {
          :message => { :message => "Successful", :delete => true }
        }
      else
        render :json => {
          :message => { :message => "Unsuccessful", :delete => false }
        }
      end
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :content, :picture)
  end

end
