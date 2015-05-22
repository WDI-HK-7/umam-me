class Dish < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_dishes,
    :against => [:name, :content, :restaurant_name],
    :using => { :tsearch => {:prefix => true} }

  belongs_to :restaurant
  belongs_to :user
  has_many :comments, dependent: :delete_all

  has_attached_file :picture,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end

end
