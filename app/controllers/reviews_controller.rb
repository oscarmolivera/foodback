class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  before_action :set_restaurant, only: %i[create new]

  def new
    @review = Review.new(restaurant: @restaurant)
  end

  def create
    @review = current_user.reviews.build(reviews_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end
end
