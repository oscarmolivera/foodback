class AddCategoryIndexToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :category, index: true
  end
end
