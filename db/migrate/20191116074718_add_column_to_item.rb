class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ship_days, :string
  end
end
