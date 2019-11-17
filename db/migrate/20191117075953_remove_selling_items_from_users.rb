class RemoveSellingItemsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :selling_items, :string
  end
end
