class AddCaptionToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :caption, :text
  end
end
