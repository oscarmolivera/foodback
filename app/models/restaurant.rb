class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :category

  validates :name, :description, :address1, :city, :phone, :email, :category_id, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address1, city, state, zipcode].join(', ')
  end
end
