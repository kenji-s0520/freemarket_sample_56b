class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :code, null: false
      t.string :prefectures,  null: false
      t.string :city_town,    null: false
      t.string :address_number,   null:false
      t.string :building
      t.string :room_number

      t.timestamps
    end
  end
end
