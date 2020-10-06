class RemoveCookingTimeFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :cookingtime_id, :integer
  end
end
