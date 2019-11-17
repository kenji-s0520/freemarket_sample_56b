class RemoveTredingItemsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :trading_items, :string
  end
end
