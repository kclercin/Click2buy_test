class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :name
      t.integer :price
      t.text :description
      t.text :thumbnail
      t.timestamps null: false
    end
  end
end
