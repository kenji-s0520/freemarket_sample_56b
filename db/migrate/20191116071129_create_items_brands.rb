class CreateItemsBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :items_brands do |t|
      t.integer :items_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
