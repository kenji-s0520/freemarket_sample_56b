class Card < ApplicationRecord
  belongs_to :user
  references :user, foreign_key: true, null: false



  validates :card_id, presence: true
  validates :customer_id, presence: true
  validates :card_id, presence: true,uniqueness: true
  
end
