class RemoveBoughtItemsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Bought_items, :string
  end
end
