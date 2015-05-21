class Dish < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  has_many :comments
end
