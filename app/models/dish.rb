class Dish < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_dishes,
    :against => [:name, :content],
    :using => { :tsearch => {:prefix => true} }

  belongs_to :restaurant
  has_many :comments
end
