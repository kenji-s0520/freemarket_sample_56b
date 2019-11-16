class Brand < ApplicationRecord
  has_many :items, trough: items_brands
end
