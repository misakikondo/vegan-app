class AddCookinTimeIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :cookingtime_id, :integer
  end
end
