class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :owner_id

      t.timestamps
    end
  end
end
