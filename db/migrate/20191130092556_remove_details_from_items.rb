class RemoveDetailsFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :seller, :integer
    remove_column :items, :buyer, :integer
  end
end
