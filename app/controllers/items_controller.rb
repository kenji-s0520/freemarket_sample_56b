class ItemsController < ApplicationController
  
  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
  def new
    @item = Item.new
    @item.images.build
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

  def create
    @item = Item.new(create_params)
    if @item.save
       redirect_to root_path, notice: '出品しました。'
    else
      @item.images.build
      render :new
    end
    binding.pry
    
  end

  private

  def create_params
    params.require(:item).permit(
      :name,
      :description,
      :status,
      :price,
      :size,
      :status,
      :cotegory_id,
      :brand_id,
      :ship_method,
      :ship_fee,
      :ship_person,
      :ship_area,
      :ship_days,
      images_attributes: [:item_id, :image]
    )
  end

    
end