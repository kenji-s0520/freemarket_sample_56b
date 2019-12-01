#ujiie カード新規登録 Cardモデルのテスト

require 'rails_helper'
describe Cards do
  describe '#create' do
    
#全ての項目が入っていなければ登録できない
    it "is valid with a user_id,card_id,customer_id" do
      cards = build(:cards)
      expect(cards).to be_valid
    end

#card_idカラム    
  
  #card_idが入っていないと登録できない
    it "is invalid without a card_id" do
      cards = build(:cards,card_id:"")
      cards.valid?
      expect(cards.errors[:card_id]).to include("can't be blank")
    end

#customer_idカラム    
    
  #customer_idが入っていないと登録できない
    it "is invalid without a customer_id" do
      cards = build(:cards,customer_id:"")
      cards.valid?
      expect(cards.errors[:customer_id]).to include("can't be blank")
    end

  end
end