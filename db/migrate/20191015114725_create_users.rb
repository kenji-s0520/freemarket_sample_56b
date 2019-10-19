class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname,           null: false
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :last_name,          null: false
      t.string :first_name,          null: false
      t.string :last_name_kana,     null: false
      t.string :first_name_kana,    null: false
      t.date   :birthday_info,      null: false
      t.string :icon
      t.text   :introduction
      t.integer :point,             null: false, default: 0
    end
  end
end
