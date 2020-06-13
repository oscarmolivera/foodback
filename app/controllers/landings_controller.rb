class LandingsController < ApplicationController
  def index
    @categories = Category.first(6)
  end
end
