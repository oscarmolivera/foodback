class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'New Restaurant Created!'
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address1, :address2,
                                       :city, :state, :zipcode, :phone,
                                       :email, :category_id)
  end
end
