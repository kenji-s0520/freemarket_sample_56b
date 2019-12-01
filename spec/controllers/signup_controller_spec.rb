#mishima ユーザー新規登録 signup_controllerのテスト
require 'rails_helper'

  describe SignupController do

#user_reg

  #user_regのビューが表示されるか
    describe 'GET #user_reg' do
      it "renders the :user_reg template" do
        get :user_reg    
        expect(response).to render_template :user_reg
      end
    end
    
#user_reg2
  
  #user_reg2のビューが表示されるか
      describe 'GET #user_reg2' do
        it "renders the :user_reg2 template" do
          get :user_reg2,params:{user:{"nickname"=>"みしま", "email"=>"mkwkswwdaf@outlook.jp", "password"=>"1111111", "password_confirmation"=>"1111111", "last_name"=>"三島", "first_name"=>"将暉", "last_name_kana"=>"ミシマ", "first_name_kana"=>"コウダイ","birthday"=>{"birthday(1i)"=>"1995","birthday(2i)"=>"08","birthday(3i)"=>"29"}}}
          expect(response).to render_template :user_reg2
        end
    end

  #user_regの入力フォームに値が入っていない場合、user_regにリダイレクトされるか
      describe 'GET #user_reg2' do
        it "redirect_to user_reg without params is nothing" do
          get :user_reg2,params:{user:{"nickname"=>"", "email"=>"mkwkswwdaf@outlook.jp", "password"=>"1111111", "password_confirmation"=>"1111111", "last_name"=>"三島", "first_name"=>"将暉", "last_name_kana"=>"ミシマ", "first_name_kana"=>"コウダイ","birthday"=>{"birthday(1i)"=>"1995","birthday(2i)"=>"08","birthday(3i)"=>"29"}}}
          expect(response).to redirect_to "/signup/user_reg"
        end
      end
     
#user_reg3

  #user_reg3のビューが表示されるか
    describe 'GET #user_reg3' do
      it "renders the :user_reg3 template" do
        get :user_reg3
        expect(response).to render_template :user_reg3
      end
  end

#user_reg4

  #user_reg4のビューが表示されるか
  describe 'GET #user_reg4' do
    it "renders the :user_reg4 template" do
      get :user_reg4
      expect(response).to render_template :user_reg4
    end
end

#user_reg5

  #user_reg5のビューが表示されるか
  describe 'GET #user_reg5' do
    it "renders the :user_reg5 template" do
      get :user_reg5
      expect(response).to render_template :user_reg5
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
        expect(response).to redirect_to user_reg_signup_index_path
      end
    end

#done

  #doneアクションが実行されて、user_reg3アクションが発動されるか
    describe 'GET #done' do
      it "user login and redirect to user_reg3" do
        user = create(:user)
        session[:id]= user.id
        get :done
        expect(response).to redirect_to user_reg3_signup_index_path
      end
    end

#address_create
  
  #address_createアクションが実行されてuser_reg4アクションにリダイレクトするか
    describe 'POST #address_create' do
      it "excusion addres_create and user_reg4 action" do
        user = create(:user)
        sign_in user
        post :address_create,params:{address:{"code"=>"525-0051","prefectures"=>"岐阜県","city_town"=>"郡上市白鳥町白鳥","address_number"=>"437","building"=>"スチューデントヒロセ","room_for_number"=>"1615000000"}}
        expect(response).to redirect_to user_reg4_signup_index_path
      end
    end

  #address_createアクションが実行されて,params情報が不足していた場合、user_reg3アクションにリダイレクトする
    describe 'POST #address_create' do
      it "excusion addres_create and user_reg3 action" do
        user = create(:user)
        sign_in user
        post :address_create,params:{address:{"code"=>"","prefectures"=>"岐阜県","city_town"=>"郡上市白鳥町白鳥","address_number"=>"437","building"=>"スチューデントヒロセ","room_for_number"=>"1615000000"}}
        expect(response).to redirect_to user_reg3_signup_index_path
      end
    end
end
