class AddLevelToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :level, null: false, foreign_key: true
  end
end
