class Card < ApplicationRecord
  belongs_to :user
  references :user, foreign_key: true, null: false
end
