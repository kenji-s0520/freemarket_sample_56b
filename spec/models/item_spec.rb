require 'rails_helper'

#yoshikawa  商品出品ページ Itemモデルのテスト
describe Item do
  describe '#create' do
    
#nameカラム    
    #nicknameが入っていないと出品できない
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    #nameが41文字以内だと出品できる
    it "is invalid name charactors less than 40" do
      item = build(:item, name: "a"*40)
      expect(item).to be_valid
    end

    #nameが41文字以上だと出品できない
    it "is invalid name charactors more than 40" do
      item = build(:item, name: "a"*41)
      item.valid?
      expect(item.errors[:name][0]).to include("is too long")
    end

#descriptionカラム    
    #descriptionが入っていないと出品できない
    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
    
    #descriptionが1000文字以内だと出品できる
    it "is invalid description charactors less than 1000" do
      item = build(:item, description: "a"*1000)
      expect(item).to be_valid
    end

    #descriptionが1001文字以内だと出品できない
    it "is invalid description charactors more than 1000" do
      item = build(:item, description: "a"*1001)
      item.valid?
      expect(item.errors[:description][0]).to include("is too long")
    end

#category_idカラム    
    #category_idが入っていないと出品できない
    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

#sizeカラム    
    #sizeが入っていないと出品できない
    it "is invalid without a size" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

#statusカラム    
    #statusが入っていないと出品できない
    it "is invalid without a status" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

#ship_personカラム    
    #ship_personが入っていないと出品できない
    it "is invalid without a ship_person" do
      item = build(:item, ship_person: nil)
      item.valid?
      expect(item.errors[:ship_person]).to include("can't be blank")
    end

#ship_methodカラム    
    #ship_methodが入っていないと出品できない
    it "is invalid without a ship_method" do
      item = build(:item, ship_method: nil)
      item.valid?
      expect(item.errors[:ship_method]).to include("can't be blank")
    end

#ship_areaカラム    
    #ship_areaが入っていないと出品できない
    it "is invalid without a ship_area" do
      item = build(:item, ship_area: nil)
      item.valid?
      expect(item.errors[:ship_area]).to include("can't be blank")
    end

#ship_daysカラム    
    #ship_daysが入っていないと出品できない
    it "is invalid without a ship_days" do
      item = build(:item, ship_days: nil)
      item.valid?
      expect(item.errors[:ship_days]).to include("can't be blank")
    end

#priceカラム    
    #priceが入っていないと出品できない
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    
  end
end