class Rating < ActiveRecord::Base

  enum severity: [ :PG, :PG13, :R ]

  has_many :topics
  has_many :posts

  belongs_to :rateable, polymorphic: true

  def self.update_ratings(rating_string)
    new_ratings = []
    unless rating_string.nil? || rating_string.empty?
    rating_string.split(",").each do |rating|
    rating_name = rating.strip
    new_rating = Rating.find_or_create_by(name: rating_type)
    new_ratings << new_rating
    end
    new_rating
  end



end
