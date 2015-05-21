class Dish < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_dishes,
    :against => [:name, :content, :restaurant_name],
    :using => { :tsearch => {:prefix => true} }

  belongs_to :restaurant
  belongs_to :user
  has_many :comments

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end
