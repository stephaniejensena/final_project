class AddOwnerToOutfit < ActiveRecord::Migration[6.0]
  def change
    add_column :outfits, :owner_id, :integer
  end
end
