class ItemsController < ApplicationController
  
  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
  def new
  end

  def toppage
  end

  def show
    
  end
  
  
  require 'payjp'

  def purchase
    @items = Item.find_by(params[id:"1"])
  end

  def buy
    card = Card.find_by(user_id: "1")
    # cardの定義を行う
    if card.blank?
      redirect_to controller: "card", action: "new"
      # カード情報が登録されていなかったら登録画面に遷移する
    else
      @items = Item.find_by(params[id:"1"])
      Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
      # secret.ymlか環境変数に入れる
      Payjp::Charge.create(
      amount: @items.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
  redirect_to action: 'done' #完了画面に移動
  end

  def done
  end

  def pay
    card = Card.where(user_id: "1").first
    #あとでcurrent_user.idに変更する。
    Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
    Payjp::Charge.create(
    @items = Items.find("1"), #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end
end

def done
end


end

def done
end

end

