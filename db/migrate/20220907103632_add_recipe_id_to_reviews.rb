class AddRecipeIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :recipe_id, :integer
  end
end
