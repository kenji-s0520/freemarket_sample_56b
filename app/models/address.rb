class Address < ApplicationRecord
  belongs_to :user
  
  #mishima 新規登録時のvalidation
  validates :user_id, presence: true
  validates :code, presence: true
  validates :prefectures, presence: true
  validates :city_town, presence: true
  validates :address_number, presence: true
end
