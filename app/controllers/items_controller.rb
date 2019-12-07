class ItemsController < ApplicationController
  
  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
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

  def toppage
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
    render "items/items"
  end
  
  def buy
  end

  private
    
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:size,:brand_id,:status,:ship_person,:ship_method,:ship_area,:ship_days,:price,images_attributes: [:item_id, :image])
  end

end