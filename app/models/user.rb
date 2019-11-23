class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :likes
  has_one :address
  has_many :item_comments
  has_many :trading_comments
  has_many :cards
  
  #mishima 新規登録のvalidation
  validates :nickname, presence: true
  validates :email, presence: true,uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :phone_number, presence: true,uniqueness: true
end
