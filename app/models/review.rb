class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  scope :all_reviews, ->(restaurant) { where('restaurant_id = ?', restaurant) }

  def self.avg_rating(restaurant)
    return 0 if all_reviews(restaurant).count.to_f.zero?

    (all_reviews(restaurant).map(&:rating).reduce(&:+) / all_reviews(restaurant).count.to_f).round(2)
  end

  def self.blank_stars(restaurant)
    5 - avg_rating(restaurant)
  end
end
