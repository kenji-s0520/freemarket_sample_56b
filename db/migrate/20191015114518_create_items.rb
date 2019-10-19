class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.string :description, null: false
      t.string :condition, null: false
      t.string :shipping_method, null: false
      t.string :shipping_charge, null: false
      t.string :ship_from_region, null: false
      t.string :shipping_date, null: false
      t.integer :price, null: false
      t.integer :seller_id, null: false, foreign_key: true
      t.integer :buyer_id, null: true, foreign_key: true
      t.timestamps
    end
  end
end
