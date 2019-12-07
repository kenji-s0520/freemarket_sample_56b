class ItemsController < ApplicationController

  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  before_action :set_item,except: [:new,:toppage,:show,:done]

  def new
  end

  # sakaguchi トップページにDBからデータを取り出す記述を追加
  def toppage
    @items = Item.order("created_at DESC").limit(10)
  end

  # sakaguchi トップページの商品をクリックしたら商品に詳細ページに飛ぶ記述を追加
  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item)
    user_id = Seller.find_by(item_id: @item).user_id
    @user = User.find_by(id: user_id)
    @items = Item.order("created_at DESC").limit(6)
    # render "items/items"
  end
  
  # ujiie 購入機能に必要なアクションを追記
  require 'payjp'

  def purchase
  end
  

  def buy
    card = current_user.card
    if card.blank?
      redirect_to controller: "card", action: "new"
      # カード情報が登録されていなかったら登録画面に遷移する
    else
      Payjp.api_key= ENV['PAYJP_ACCESS_KEY']
      Payjp::Charge.create(
      amount: @item.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
  redirect_to action: 'done' #完了画面に移動
  end
end

  def done
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def create    
  end    
end