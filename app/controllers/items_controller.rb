class ItemsController < ApplicationController

  def index
  end

  def show
    render "items/items"
  end

  def pay
    Payjp.api_key = 'sk_test_**************************'
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end
  
end

