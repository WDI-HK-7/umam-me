class DishesController < ApplicationController
	def create
		@dish = Dish.create(dish_params)
	end

	private

	def dish_params
		params.require(:dish).permit(:name, :content, :restaurant_id)
	end
end
