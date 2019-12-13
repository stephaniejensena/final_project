class CreateOutfitTags < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_tags do |t|
      t.integer :outfit_id
      t.integer :image_id

      t.timestamps
    end
  end
end
