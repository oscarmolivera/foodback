class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :category

  has_many_attached :images

  validates :name, :description, :address1, :city, :phone, :email, :category_id, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address1, city, state, zipcode].join(', ')
  end

  def self.search(params)
    restaurants = Restaurant.where(category_id: params[:category].to_i)
    if params[:search].present?
      restaurants = restaurants.where('name like ? or description like ?', "%#{params[:search]}%", "%#{params[:search]}%") 
    end
    restaurants = restaurants.near(params[:location], 20) if params[:location].present?
    restaurants
  end
end
