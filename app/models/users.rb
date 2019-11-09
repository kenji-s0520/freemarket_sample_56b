has_many :sns_credentials, dependent: :destroy

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook]

def self.find_oauth(auth)
  uid = auth.uid
  provider = auth.provider
  snscredential = SnsCredential.where(uid: uid, provider: provider).first
  # binding.pry

  if snscredential.present?
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email
      )
    end
    sns = snscredential
    #binding.pry

  else
    user = User.where(email: auth.info.email).first
    if user.present?
      sns = SnsCredential.new(
        uid: uid,
        provider: provider,
        user_id: user.id
      )
    else
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email
      )
      # binding.pry
      sns = SnsCredential.create(
        uid: uid,
        provider: provider
      )
      # binding.pry 
    end
  end
  # binding.pry
  return { user: user , sns_id: sns.id }
end