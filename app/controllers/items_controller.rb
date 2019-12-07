class ItemsController < ApplicationController

  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  before_action :set_item,except: [:new,:toppage,:show,:done]

  def new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
    @items = Item.new
    @items.images.build
    @prefectures = Prefecture.all
  end

  # sakaguchi トップページにDBからデータを取り出す記述を追加
  def toppage
    @items = Item.order("created_at DESC").limit(10)
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @items = Item.new(item_params)
    if @items.save  
    else
      @prefectures = Prefecture.all
      @category_parent_array = ["---"]
       #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      render :new
    end
  end

  def index
    @items = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item)
    user_id = Seller.find_by(item_id: @item)
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
  
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:size,:brand_id,:status,:ship_person,:ship_method,:ship_area,:ship_days,:price,images_attributes: [:item_id, :image])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end