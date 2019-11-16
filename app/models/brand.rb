class Brand < ApplicationRecord
  has_many :items, through :items_brands
end
