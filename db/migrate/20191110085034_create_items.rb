class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.integer :price, null: false
      t.string :size, null: false
      t.references :category_id, null: false, foreign_key: true
      t.references :brand_id, null: false, foreign_key: true
      t.string :status, null: false
      t.string :ship_method, null: false
      t.integer :ship_fee, null: false
      t.string :ship_person, null: false
      t.string :ship_area, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :seller, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true


      t.timestamps
    end
  end
end
