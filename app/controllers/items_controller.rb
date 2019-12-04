class ItemsController < ApplicationController
  
  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
  def new
  end

  def toppage
  end

  def show
  end
  
  # ujiie 購入機能に必要なアクションを追記
  require 'payjp'

  def purchase
    @item = Item.find(params[:id])
  end
  

  def buy
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to controller: "card", action: "new"
      # カード情報が登録されていなかったら登録画面に遷移する
    else
      @items = Item.find_by(params[id:"1"])
      Payjp.api_key= ENV['PAYJP_ACCESS_KEY']
      Payjp::Charge.create(
      amount: @items.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
  redirect_to action: 'done' #完了画面に移動
  end
end

  def done
  end

end

