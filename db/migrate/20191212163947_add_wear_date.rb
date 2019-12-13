class AddWearDate < ActiveRecord::Migration[6.0]
  def change
    add_column :wears, :wear_date, :date
  end
end
