class RemoveSoldItemsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sold_items, :string
  end
end
