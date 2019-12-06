class ItemsController < ApplicationController
  
  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
  def new
  end

  # sakaguchi トップページにDBからデータを取り出す記述を追加
  def toppage
    @items = Item.order("created_at DESC").limit(10)
  end

  # sakaguchi トップページの商品をクリックしたら商品に詳細ページに飛ぶ記述を追加
  def show
    @item = Item.find(params[:id])
  end
  
  def buy
  end

  def create    
  end    
end