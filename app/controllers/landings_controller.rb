class LandingsController < ApplicationController
  def index
    @categories = Category.includes([:img_photo_attachment]).limit(6)
    @restaurants = Restaurant.search(params)
  end
end
