class RemoveNumcountFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :likes_count, :integer
  end
end
