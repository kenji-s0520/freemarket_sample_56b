class ItemsController < ApplicationController
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
      # redirect_to index_url 
    else
      @items.images.build
      render :new
    end
  end

  def index
  end

  def show
    render "items/items"
  end
  
  def purchase
  end

  private
    
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:size,:brand_id,:status,:ship_person,:ship_method,:ship_area,:ship_days,:price,images_attributes: [:item_id, :image])
  end

end