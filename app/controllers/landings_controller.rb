class LandingsController < ApplicationController
  def index
    @categories = Category.first(6)
    @restaurants = Restaurant.search(params)
  end
end
