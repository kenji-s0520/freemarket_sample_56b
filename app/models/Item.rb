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

   has_many :images, dependent: :destroy
   accepts_nested_attributes_for :images

   
   def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:face].blank? and attributes[:flip].blank?
      !attributes[:face].blank? and attributes[:flip].blank?
    else
      attributes[:face].blank? and attributes[:flip].blank?
    end
  end
end