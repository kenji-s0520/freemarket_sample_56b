class Address < ApplicationRecord
  belongs_to :user
  
  #mishima ユーザー新規登録 カラムにvalidationを追加
  validates :user_id, presence: true, uniqueness: true
  validates :code, presence: true,length: {is: 8}
  validates :prefectures, presence: true
  validates :city_town, presence: true
  validates :address_number, presence: true
end
