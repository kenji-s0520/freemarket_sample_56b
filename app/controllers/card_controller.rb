class CardController < ApplicationController
  
  require "payjp"

  def new
    card = Card.where(user_id: "1")
    # あとでcurrent_user.idを追記
    redirect_to action: "show" if card.exists?
  end

  def create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      ) 
      @card = Card.new(user_id: "1", customer_id: customer.id, card_id: customer.default_card)
      # あとでcurrent_user.idを追記
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "new"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: "1").first
    # あとでcurrent_user.idを追記
    if card.blank?
    else
      Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: "1").first
    # あとでcurrent_user.idを追記
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
end

