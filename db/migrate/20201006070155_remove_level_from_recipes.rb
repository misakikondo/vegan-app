class RemoveLevelFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :level_id, :integer
  end
end
