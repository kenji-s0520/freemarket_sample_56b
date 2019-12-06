class Card < ApplicationRecord
  belongs_to :user
  references :user, foreign_key: true, null: false



  validates :customer_id, presence: true
  validates :card_id, presence: true,uniqueness: true
  validates :user_id, presence: true,uniqueness: true
  
end
