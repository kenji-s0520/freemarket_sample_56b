class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  # validate :validate_status_not_presense
  validates :ship_person, presence: true
  validates :ship_method, presence: true
  validates :ship_area, presence: true
  validates :ship_days, presence: true
  validates :price, presence: true

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  # private

  # def validate_status_not_presense
  #   errors.add('選択してください') if status.nil?
  # end
  
end