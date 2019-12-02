class CardController < ApplicationController
  
#  ujiie card登録・削除に必要なcontrollerを作成 
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def create #payjpとCardのデータベース作成。
    # Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
    Payjp.api_key= ENV['PAYJP_ACCESS_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "new"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      # Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
      Payjp.api_key= ENV['PAYJP_ACCESS_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      # Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
      Payjp.api_key= ENV['PAYJP_ACCESS_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
end

