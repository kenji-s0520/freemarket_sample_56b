class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable

  has_many :items
  has_many :likes
  has_one :address
  has_many :item_comments
  has_many :trading_comments
  has_many :cards
  
  #mishima ユーザー新規登録 カラムにvalidationを追加
  validates :nickname, presence: true
  validates :email, presence: true,uniqueness: true
  validates :password, presence: true,length: {minimum:7},confirmation: true
  validates :password_confirmation, presence: true,length: {minimum:7}
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birthday, presence: true
  validates :phone_number, presence: true,uniqueness: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
