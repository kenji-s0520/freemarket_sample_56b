class ItemsController < ApplicationController
  
  #mishima ユーザー新規登録 deviseの機能を追加
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
  def new
  end

  def toppage
  end

  def show
    render "items/items"
  end
  
  

  # def purchase
  #   card = Card.where(user_id: "1").first
  #   #あとでcurrent_user.idに記載を変更する
  #   #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
  #   if card.blank?
  #     #登録された情報がない場合にカード登録画面に移動
  #     redirect_to controller: "card", action: "new"
      
  #   else
  #     Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
  #     #保管した顧客IDでpayjpから情報取得
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
  #     @default_card_information = customer.cards.retrieve(card.card_id)
      
  #   end
  # end

  def purchase
    
    Payjp.api_key = 'sk_test_3c6c6f094d2e40b7a314b6c3'
    charge = Payjp::Charge.create(
    amount: 300,
    
    card: params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to action: :done
  end

  def done
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :price,
    ).merge(user_id: "1")
    # あとでcurrent_user_idに変更
  end

end

