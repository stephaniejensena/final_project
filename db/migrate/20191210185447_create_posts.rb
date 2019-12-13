class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.boolean :just_friends
      t.integer :image_id

      t.timestamps
    end
  end
end
