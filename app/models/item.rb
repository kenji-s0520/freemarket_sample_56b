class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :seller
  # belongs_to :buyer
  # belongs_to :category
  # belongs_to :brand
  # has_many :likes
  # has_many :trading_comments
  # has_many :item_comments
   has_many :images, dependent: :destroy
   accepts_nested_attributes_for :images
  
end
