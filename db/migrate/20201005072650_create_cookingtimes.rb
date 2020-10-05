class CreateCookingtimes < ActiveRecord::Migration[6.0]
  def change
    create_table :cookingtimes do |t|
      t.string    :name,     null: false

      t.timestamps
    end
  end
end
