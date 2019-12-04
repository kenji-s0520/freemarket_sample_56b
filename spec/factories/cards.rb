#mishima ユーザー新規登録 Userモデルのテスト用のサンプルを作成
FactoryBot.define do
  factory :card do
    user
    card_id                {"car_0b4e38753881d83d01e5945734e7"}
    customer_id              {"cus_70bbf7ef2a1d80bebefe2588ead5"}
  end
end