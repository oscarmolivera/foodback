class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  scope :ratings, ->(restaurant) { where('restaurant_id = ?', restaurant) }

  def self.avg_rating(restaurant)
    return 0 if ratings(restaurant).count.zero? || stars_per_restaurant(restaurant).zero?

    stars_per_restaurant(restaurant) / reviews_of_restaurant(restaurant).round(2)
  end

  def self.reviews_of_restaurant(restaurant)
    ratings(restaurant).count
  end

  def self.stars_per_restaurant(restaurant)
    ratings(restaurant).map(&:rating).reduce(:+)
  end
end
