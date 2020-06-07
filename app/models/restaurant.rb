class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :category

  validates :name, :description, :address1, :city, :phone, :email, :category_id, presence: true
end
