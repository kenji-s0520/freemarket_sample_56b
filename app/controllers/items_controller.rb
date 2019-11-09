class ItemsController < ApplicationController

  def index
  end

  def show
    render "items/items"
  end

  require 'payjp'

  def purchase
    Payjp.api_key = "" #秘密鍵
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end
  
end

