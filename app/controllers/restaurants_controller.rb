class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  def index
    #visitor_latitude = request.location.latitude
    #visitor_longitude = request.location.longitude

    #@restaurants = Restaurant.near([visitor_latitude, visitor_longitude])
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.images.attach(params[:restaurant][:images])
    if @restaurant.save
      redirect_to @restaurant, notice: 'New Restaurant Created!'
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant).includes([:user])
    @avg_rating = @reviews.avg_rating(@restaurant.id)
    @half_star = @avg_rating % 1 != 0 ? 1 : 0
    @blank_stars = @reviews.blank_stars(@restaurant.id) 
  end

  def search
    @restaurants = Restaurant.search(params)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address1, :address2,
                                       :city, :state, :zipcode, :phone,
                                       :email, :category_id, :latitude, :longitude,
                                       images: [])
  end
end
