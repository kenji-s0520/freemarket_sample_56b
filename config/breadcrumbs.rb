# ルート
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :users do
  link "マイページ", users_path
end

# 本人情報
crumb :info do
  link "本人情報の登録", users_info_path
  parent :users
end

# プロフィール
crumb :profile do
  link "プロフィール", edit_user_path
  parent :users
end

# 支払い方法
crumb :card do
  link "支払い方法", users_card_path
  parent :users
end

# クレジットカード情報
crumb :card_create do
  link "クレジットカード情報入力", users_card_create_path
  parent :card
end

# 商品詳細の下段に表示
crumb :items do
  link "AppleWatch", item_path
  parent :root
end