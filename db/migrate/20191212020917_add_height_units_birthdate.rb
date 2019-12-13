class AddHeightUnitsBirthdate < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :height_units, :string
  end
end
