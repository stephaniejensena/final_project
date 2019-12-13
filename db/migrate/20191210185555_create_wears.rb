class CreateWears < ActiveRecord::Migration[6.0]
  def change
    create_table :wears do |t|
      t.integer :image_id
      t.integer :outfit_id

      t.timestamps
    end
  end
end
