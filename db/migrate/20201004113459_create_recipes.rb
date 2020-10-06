class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string       :recipes_name,       null: false
      t.text         :explains,           null: false
      t.timestamps
    end
  end
end
