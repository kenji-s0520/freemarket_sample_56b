class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :seller
  belongs_to :buyer
  belongs_to :category
  belongs_to :brand
  has_many :likes
  has_many :trading_comments
  has_many :item_comments
  has_many :images, dependent: :destroy
  
end
