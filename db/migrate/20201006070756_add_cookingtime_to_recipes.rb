class AddCookingtimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :cookingtime, null: false, foreign_key: true
  end
end
