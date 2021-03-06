class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :make
      t.string :model
      t.integer :year
      t.string :exterior_color
      t.integer :mileage
    end
  end
end
