#mishima ユーザー新規登録 signup_controllerのテスト
require 'rails_helper'

  describe SignupController do

#member_information

  #member_informationのビューが表示されるか
    describe 'GET #member_information' do
      it "renders the :member_information template" do
        get :member_information    
        expect(response).to render_template :member_information
      end
    end
    
#phone_number
  
  #phone_numberのビューが表示されるか
      describe 'GET #phone_number' do
        it "renders the :phone_number template" do
          get :phone_number,params:{user:{"nickname"=>"みしま", "email"=>"mkwkswwdaf@outlook.jp", "password"=>"1111111", "password_confirmation"=>"1111111", "last_name"=>"三島", "first_name"=>"将暉", "last_name_kana"=>"ミシマ", "first_name_kana"=>"コウダイ","birthday"=>{"birthday(1i)"=>"1995","birthday(2i)"=>"08","birthday(3i)"=>"29"}}}
          expect(response).to render_template :phone_number
        end
    end

  #member_informationの入力フォームに値が入っていない場合、member_informationにリダイレクトされるか
      describe 'GET #phone_number' do
        it "redirect_to member_information without params is nothing" do
          get :phone_number,params:{user:{"nickname"=>"", "email"=>"mkwkswwdaf@outlook.jp", "password"=>"1111111", "password_confirmation"=>"1111111", "last_name"=>"三島", "first_name"=>"将暉", "last_name_kana"=>"ミシマ", "first_name_kana"=>"コウダイ","birthday"=>{"birthday(1i)"=>"1995","birthday(2i)"=>"08","birthday(3i)"=>"29"}}}
          expect(response).to redirect_to "/signup/member_information"
        end
      end
     
#address

  #addressのビューが表示されるか
    describe 'GET #address' do
      it "renders the :address template" do
        user = create(:user)
        sign_in user
        get :address
        expect(response).to render_template :address
      end
  end

#card_information

  #card_informationのビューが表示されるか
  describe 'GET #card_information' do
    it "renders the :card_information template" do
      user = create(:user)
        sign_in user
      get :card_information
      expect(response).to render_template :card_information
    end
end

#end

  #endのビューが表示されるか
  describe 'GET #end' do
    it "renders the :end template" do
      user = create(:user)
        sign_in user
      get :end
      expect(response).to render_template :end
    end
end

#create

  #createアクションが実行されて、doneアクションが発動されるか
  describe 'POST #create' do
    it "excusion create and done" do
      session[:nickname] = "まさき"
      session[:email] = "mddaf@outlook.jp"
      session[:password] = "1111111"
      session[:password_confirmation] = "1111111"
      session[:last_name] = "三島"
      session[:first_name] = "将暉"
      session[:last_name_kana] = "ミシマ"
      session[:first_name_kana] = "マサキ"
      session[:birthday] = "1995-08-29"
      session[:phone_number] = "09079141620"
      post :create,params:{user:{"phone_number"=>"12344678901"}}
      expect(response).to redirect_to done_signup_index_path
    end
  end

  #createアクションが実行されたが、session情報が不足していた場合、前のページにリダイレクトするか
    describe 'POST #create' do
      it "excusion create and user_reg action" do
        session[:nickname] = ""
        session[:email] = "mddaf@outlook.jp"
        session[:password] = "1111111"
        session[:password_confirmation] = "1111111"
        session[:last_name] = "三島"
        session[:first_name] = "将暉"
        session[:last_name_kana] = "ミシマ"
        session[:first_name_kana] = "マサキ"
        session[:birthday] = "1995-08-29"
        session[:phone_number] = "09079141620"
        post :create,params:{user:{"phone_number"=>"12344678901"}}
        expect(response).to redirect_to member_information_signup_index_path
      end
    end

#done

  #doneアクションが実行されて、addressアクションが実行されるか
    describe 'GET #done' do
      it "user login and redirect to address" do
        user = create(:user)
        session[:id]= user.id
        get :done
        expect(response).to redirect_to address_signup_index_path
      end
    end

#address_create
  
  #address_createアクションが実行されてcard_informationアクションにリダイレクトするか
    describe 'POST #address_create' do
      it "excusion addres_create and card_information action" do
        user = create(:user)
        sign_in user
        post :address_create,params:{address:{"code"=>"525-0051","prefectures"=>"岐阜県","city_town"=>"郡上市白鳥町白鳥","address_number"=>"437","building"=>"スチューデントヒロセ","room_for_number"=>"1615000000"}}
        expect(response).to redirect_to card_information_signup_index_path
      end
    end

  #address_createアクションが実行されて,params情報が不足していた場合、addressアクションにリダイレクトする
    describe 'POST #address_create' do
      it "excusion addres_create and address action" do
        user = create(:user)
        sign_in user
        post :address_create,params:{address:{"code"=>"","prefectures"=>"岐阜県","city_town"=>"郡上市白鳥町白鳥","address_number"=>"437","building"=>"スチューデントヒロセ","room_for_number"=>"1615000000"}}
        expect(response).to redirect_to address_signup_index_path
      end
    end
end
