class ItemsController < ApplicationController
  
  def index
  end

  def show
    render "items/items"
  end
  
  def buy
  end

  def new
    @user = User.new
    # @user.items.build
  end

  def create
    @user = User.new(user_parameter)
    respond_to do |format|
      if @user.save
          params[:items][:item].each do |item|
            @user.item.create(item: item, user_id: @user.id)
          end
        format.html{redirect_to root_path}
      else
        @user.item.build
        format.html{render action: 'new'}
      end
    end
  end

  def product_parameter
    params.require(:user).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :prefecture_id, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end

end

