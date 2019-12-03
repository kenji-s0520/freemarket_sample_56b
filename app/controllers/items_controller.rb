class ItemsController < ApplicationController

  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]


  def new
  end

  def toppage
  end

  def toppage
    @items = Item.order("created_at DESC").limit(10)
  end

  def show
    @item = Item.find_by(id:"1")
    @images = Image.where(item_id: @item)
    @user_id = Seller.find_by(item_id: @item).user_id
    @user = User.find_by(id: @user_id)
    @items = Item.order("created_at DESC").limit(6)
    render "items/items"
  end
  
  def buy
  end

end

