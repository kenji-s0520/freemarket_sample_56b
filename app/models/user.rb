class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #yamashita :omniauthableと:omniauth_providers追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :items
  has_many :likes
  has_one :address
  has_many :item_comments
  has_many :trading_comments
  has_one :card
  # has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  # has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
  
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

  #yamashita sns認証
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      pass = Devise.friendly_token[0, 20]
      user = User.new(
        name:     auth.info.name,
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: pass,
        password_confirmation: pass,
      )
      # user.save!
    end
    user
  end  
end