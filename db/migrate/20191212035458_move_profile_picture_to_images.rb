class MoveProfilePictureToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_picture_id, :integer
    remove_column :users, :profile_picture
  end
end
