class ChangeDataCustomerIdToCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :customer_id, :string
  end
end
