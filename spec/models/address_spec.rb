#mishima ユーザー新規登録 Addressモデルのテスト

require 'rails_helper'
describe Address do
  describe '#create' do
  
#全ての項目が入っていれば登録できる
  it "is valid with a user_id,code,prefectures,city_town,address_number,building,room_for_number" do
    user = create(:user)
    address = build(:address,user_id:user.id)
    expect(address).to be_valid
  end

#buildingとroom_for_numberが入っていなくても登録できる
  it "is valid without a building,room_for_number" do
    user = create(:user)
    address = build(:address,user_id:user.id,building:"",room_for_number:"")
    expect(address).to be_valid
  end

#user_idカラム
  
  #user_idが入っていないと登録できない
    it "is invalid without a user_id" do
      address = build(:address,user_id:"")
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end
  
  # #user_idが重複した場合、登録できない
    it "is invalid with a duplicate user_id" do
      user = create(:user)
      address = create(:address,user_id:user.id)
      another_address = build(:address,user_id:address.user_id)
      another_address.valid?
      expect(another_address.errors[:user_id]).to include("has already been taken")
    end
        
#codeカラム

  #codeが入っていないと登録できない
    it "is invalid without a code" do
      user = create(:user)
      address = build(:address,user_id:user.id,code:"")
      address.valid?
      expect(address.errors[:code]).to include("can't be blank")
    end
      
  #codeが7文字以下の場合、登録できない
    it "is invalid with a code that has less than 7" do
      user = create(:user)
      address = build(:address,user_id:user.id,code:"123-456")
      address.valid?
      expect(address.errors[:code]).to include("is the wrong length (should be 8 characters)")
    end

  #codeが9文字以上の場合、登録できない
    it "is invalid with a code that has more than 9" do
      user = create(:user)
      address = build(:address,user_id:user.id,code:"123-45678")
      address.valid?
      expect(address.errors[:code]).to include("is the wrong length (should be 8 characters)")
    end

#prefecturesカラム

  #prefecturesが入っていないと登録できない
    it "is invalid without a prefectures" do
      user = create(:user)
      address = build(:address,user_id:user.id,prefectures:"")
      address.valid?
      expect(address.errors[:prefectures]).to include("can't be blank")
    end

#city_townカラム

  #city_townが入っていないと登録できない
    it "is invalid without a city_town" do
      user = create(:user)
      address = build(:address,user_id:user.id,city_town:"")
      address.valid?
      expect(address.errors[:city_town]).to include("can't be blank")
    end

#address_numberカラム

  #address_numberが入っていないと登録できない
    it "is invalid without a address_number" do
      user = create(:user)
      address = build(:address,user_id:user.id,address_number:"")
      address.valid?
      expect(address.errors[:address_number]).to include("can't be blank")
    end

#buildingカラム
    
  #buildingが入っていなくても登録できる
    it "is valid without a building" do
      user = create(:user)
      address = build(:address,user_id:user.id,building:"")
      address.valid?
      expect(address).to be_valid
    end
#room_for_numberカラム

  #room_for_numberが入っていなくても登録できる
    it "is valid without a room_for_number" do
      user = create(:user)
      address = build(:address,user_id:user.id,room_for_number:"")
      address.valid?
      expect(address).to be_valid
    end

  end
end