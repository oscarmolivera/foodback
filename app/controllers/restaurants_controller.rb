class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params(params[:restaurant]))
    @restaurant.save
    redirect_to @restaurant
  end

  def show; end

  private

  def restaurant_params(params)
    params.permit(:name, :description, :address1,
                  :address2, :city, :state,
                  :zipcode, :phone, :email)
  end
end
