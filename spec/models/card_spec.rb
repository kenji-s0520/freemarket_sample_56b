#ujiie カード新規登録 Cardモデルのテスト

require 'rails_helper'
describe Card do
  describe '#create' do
    
#全ての項目が入っていなければ登録できない
    it "is valid with a user_id,card_id,customer_id" do
      card = build(:card)
      expect(card).to be_valid
    end

#card_idカラム    
  
  #card_idが入っていないと登録できない
    it "is invalid without a card_id" do
      card = build(:card,card_id:"")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end

  #card_idが重複した場合、登録できない
  it "is invalid with a duplicate card_id" do
    card = create(:card)
    another_card = build(:card,customer_id:"1")
    another_card.valid?
    expect(another_card.errors[:card_id]).to include("has already been taken")
  end

#customer_idカラム    
    
  #customer_idが入っていないと登録できない
    it "is invalid without a customer_id" do
      card = build(:card,customer_id:"")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

  end
end