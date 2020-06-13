class Category < ApplicationRecord
  has_many :restaurants

  has_one_attached :img_photo
end
