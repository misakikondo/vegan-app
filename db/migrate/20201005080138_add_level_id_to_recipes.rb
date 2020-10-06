class AddLevelIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :level_id, :integer
  end
end
