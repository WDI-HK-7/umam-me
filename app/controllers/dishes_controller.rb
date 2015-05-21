class DishesController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @dishes = Dish.order('id DESC').limit(8).offset(params[:offset])
  end

  def search
    @dishes = Dish.search_dishes(params[:query]) if params[:query]
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
    @comments = Comment.where(:dish_id => params[:id])

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
      render :json => { :message => "Cannot find dish", :delete => false }
    else
      if @dish.destroy
        render :json => { message: "Successful", delete: true }
      else
        render :json => { :message => "Unsuccessful", :delete => false }
      end
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :content, :restaurant_name, :picture)
  end

end
