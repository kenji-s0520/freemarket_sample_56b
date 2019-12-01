#mishima ユーザー新規登録 Userモデルのテスト用のサンプルを作成
FactoryBot.define do
  factory :user do
    id                    {"1"}
    nickname              {"masaki"}
    email                 {"mk0829345@outlook.jp"}
    password              {"1111111"}
    password_confirmation {"1111111"}
    last_name             {"菅田"}
    first_name            {"将暉"}
    last_name_kana        {"スダ"}
    first_name_kana       {"マサキ"}
    birthday              {"1995-08-29"}
    phone_number          {"12345678912"}
  
    
  end
end