class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show new]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.img_photo.attach(params[:img_photo])
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      @category.img_photo.attach(params[:img_photo])
      if @category.update(category_params)
        format.html { redirect_to root_path, notice: 'category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :img_photo)
  end
end
