class CreateBodyStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :body_styles do |t|
      t.string :name
    end
  end
end
