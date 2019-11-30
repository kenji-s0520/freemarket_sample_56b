class ItemsController < ApplicationController

  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]

  def new
  end

  def toppage
  end

  def show
    @item = Item.find_by(id:"1").id
    @user_id = Seller.find_by(item_id: @item).user_id
    @user = User.find_by(id: @user_id).nickname
    render "items/items"
  end
  
  def buy
  end

end

