class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :first_name
      t.string :last_name
      t.float :height
      t.float :weight
      t.string :pant_size
      t.string :shirt_size
      t.string :dress_size
      t.string :shoe_size
      t.string :pant_size_units
      t.string :shirt_size_units
      t.string :dress_size_units
      t.string :shoe_size_units
      t.string :profile_picture
      t.text :bio

      t.timestamps
    end
  end
end
