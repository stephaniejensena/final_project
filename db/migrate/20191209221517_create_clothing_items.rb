class CreateClothingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_items do |t|
      t.string :name
      t.string :color
      t.string :pattern
      t.string :material
      t.string :size
      t.string :brand
      t.string :retailer
      t.float :price
      t.string :price_units
      t.date :date_purchased
      t.string :category
      t.integer :quantity
      t.text :description
      t.integer :owner_id
      t.integer :default_image_id

      t.timestamps
    end
  end
end
