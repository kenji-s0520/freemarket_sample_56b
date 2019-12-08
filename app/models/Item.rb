class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :size, presence: true
  validates :status, presence: true
  validates :ship_person, presence: true
  validates :ship_method, presence: true
  validates :ship_area, presence: true
  validates :ship_days, presence: true
  validates :price, presence: true
  
  has_many :images
  accepts_nested_attributes_for :images
end