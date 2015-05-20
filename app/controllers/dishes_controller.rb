class DishesController < ApplicationController
  before_action :authenticate_user!
end
