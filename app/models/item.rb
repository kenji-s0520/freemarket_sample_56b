class Item < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  belongs_to :buyer
  belongs_to :category
  belongs_to :brand
  has_many :likes
end
