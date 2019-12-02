_require 'rails_helper'

describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a status" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "is invalid without a ship_person" do
      item = build(:item, ship_person: nil)
      item.valid?
      expect(item.errors[:ship_person]).to include("can't be blank")
    end

    it "is invalid without a shipping_charge" do
      item = build(:item, ship_method: nil)
      item.valid?
      expect(item.errors[:ship_method]).to include("can't be blank")
    end

    it "is invalid without a ship_area" do
      item = build(:item, ship_area: nil)
      item.valid?
      expect(item.errors[:ship_area]).to include("can't be blank")
    end

    it "is invalid without a shipping_date" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a brand_id" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid name charactors more than 40" do
      item = build(:item, name: "a"*41)
      item.valid?
      expect(item.errors[:name][0]).to include("is too long")
    end

    it "is invalid name charactors less than 40" do
      item = build(:item, name: "a"*40)
      expect(item).to be_valid
    end

    it "is invalid description charactors more than 1000" do
      item = build(:item, description: "a"*1001)
      item.valid?
      expect(item.errors[:description][0]).to include("is too long")
    end

    it "is invalid description charactors less than 1000" do
      item = build(:item, description: "a"*1000)
      expect(item).to be_valid
    end

  end
end
