class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :ship_person, presence: true
  validates :ship_method, presence: true
  validates :ship_area, presence: true
  validates :ship_days, presence: true
  validates :price, presence: true
end