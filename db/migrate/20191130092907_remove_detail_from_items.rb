class RemoveDetailFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :ship_fee, :integer
  end
end
