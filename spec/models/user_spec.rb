#mishima ユーザー新規登録 Userモデルのテスト

require 'rails_helper'
describe User do
  describe '#create' do
    
#全ての項目が入っていなければ登録できない
    it "is valid with a nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthday,phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end

#nicknameカラム    
  
  #nicknameが入っていないと登録できない
    it "is invalid without a nickname" do
      user = build(:user,nickname:"")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    
  #emailが入っていないと登録できない
    it "is invalid without a email" do
      user = build(:user,email:"")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")  
    end
    
  #emailが重複した場合、登録できない
    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user,phone_number:"11111114532")
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

#passwordカラム    
  
  #passwordが入っていないと登録できない
    it "is invalid without a password" do
      user = build(:user,password:"")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
  #passwordが7文字未満だと登録できない
    it "is invalid with a password that has less than 6 characters" do
      user = build(:user,password:"123456",password_confirmation:"123456")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  
  #passwordが7文字以上ならば登録できる
    it "is valid with a password that has more than 6 characters " do
      user = build(:user,password:"1234567",password_confirmation:"1234567")
      user.valid?
      expect(user).to be_valid
    end

#password_confirmationカラム

  #password_confirmationが入っていないと登録できない
    it "is invalid without a password_confirmation" do
      user = build(:user,password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

  #passwordとpassword_confirmationが一致すればpasswordを登録できる
    it "is valid match a password and a password_confirmation" do
      user = build(:user)
      user.valid?
      expect(user.errors[:password_confirmation]).present?
    end

  #passwordとpassword_confirmationが一致しなければpasswordを登録できない
    it "is invalid not match a password and a password_confirmation" do
      user = build(:user,password_confirmation:"12345678")
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
    end

#last_nameカラム

  #last_nameが入っていないと登録できない
    it "is invalid without a last_name" do
      user = build(:user,last_name:"")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

#first_nameカラム
    
    #first_nameが入っていないと登録できない
    it "is invalid without a first_name" do
      user = build(:user,first_name:"")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

#last_name_kanaカラム

  #last_name_kanaが入っていないと登録できない
    it "is invalid without a last_name_kana" do
      user = build(:user,last_name_kana:"")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    
  #last_name_kanaがカタカナではないと登録できない
    it "is invalid if a last_name_kana is not katakana" do
      user = build(:user,last_name_kana:"菅田")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

#first_name_kanaカラム

  #first_name_kanaが入っていないと登録できない
    it "is invalid without a first_name_kana" do
      user = build(:user,first_name_kana:"")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end  

  #first_name_kanaがカタカナではないと登録できない
    it "is invalid if a first_name_kana is not katakana" do
      user = build(:user,first_name_kana:"将暉")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
  
#birthdayカラム

  #birthdayが入っていないと登録できない
    it "is invalid without a birthday" do
      user = build(:user,birthday:"")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
    
#phone_numberカラム

  #phone_numberが入っていないと登録できない
    it "is invalid without a phone_number" do
      user = build(:user,phone_number:"")
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

  #phone_numberが重複した場合、登録できない
    it "is invalid with a duplicate phone_number" do
      user = create(:user)
      another_user = build(:user,email:"mk038432@gmail.com")
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("has already been taken")
    end
  end
end