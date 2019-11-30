class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.build
  end

  def index
  end

  def show
    render "items/items"
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