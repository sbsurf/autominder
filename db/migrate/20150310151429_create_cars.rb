class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :year
      t.integer :make_id
      t.string :model_id

      t.timestamps null: false
    end
  end
end
