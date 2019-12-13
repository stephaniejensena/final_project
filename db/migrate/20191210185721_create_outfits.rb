class CreateOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :outfits do |t|
      t.integer :default_image_id
      t.text :description

      t.timestamps
    end
  end
end
