class CreateCarsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :make
      t.string :model
      t.integer :year
      t.string :exterior_color
      t.integer :mileage
      t.integer :price
      t.string :image_url
    end
  end
end
