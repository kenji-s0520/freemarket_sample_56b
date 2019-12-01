class ItemsController < ApplicationController
  
  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
  def new
  end

  def toppage
    @items = Item.order("created_at DESC").limit(10)
  end

  def show
    render "items/items"
    @item = Item.find(params[:id])
  end
  
  def buy
  end

end

