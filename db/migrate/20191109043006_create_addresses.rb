class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :code,             null: false
      t.string :prefecture,       null: false
      t.string :city_town,        null: false
      t.string :address_number,   null: false
      t.string :bulding
      t.string :room_phone_number
      t.timestamps
    end
  end
end
