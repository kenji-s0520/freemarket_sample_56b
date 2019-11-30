#mishima ユーザー新規登録 signup_controllerのテスト
require 'rails_helper'

  describe SignupController do
    
  #user_regのビューが表示されるか
    describe 'GET #user_reg' do
      it "renders the :user_reg template" do
        get :user_reg    
        expect(response).to render_template :user_reg
      end
    end
    
  #user_regに@userを渡せているか
    # describe 'GET #user_reg' do
    #   it "assigns the requested user to @user" do
    #   user =
    #   get :user_reg,params:{user:user}
    #   expect(assigns(:user)).to eq user
    #   end
    # end
  #user_reg2のビューが表示されるか
      describe 'GET #user_reg2' do
        it "renders the :user_reg2 template" do
          get :user_reg2,params:{user:{"nickname"=>"みしま", "email"=>"mkwkswwdaf@outlook.jp", "password"=>"1111111", "password_confirmation"=>"1111111", "last_name"=>"三島", "first_name"=>"将暉", "last_name_kana"=>"ミシマ", "first_name_kana"=>"コウダイ","birthday"=>{"birthday(1i)"=>"1995","birthday(2i)"=>"08","birthday(3i)"=>"29"}}}
          expect(response).to render_template :user_reg2
        end
    end

  #入力フォームに値が入っていない場合、user_regにリダイレクトされるか
      describe 'GET #user_reg2' do
        it "redirect_to user_reg without params is nothing" do
          get :user_reg2,params:{user:{"nickname"=>"", "email"=>"mkwkswwdaf@outlook.jp", "password"=>"1111111", "password_confirmation"=>"1111111", "last_name"=>"三島", "first_name"=>"将暉", "last_name_kana"=>"ミシマ", "first_name_kana"=>"コウダイ","birthday"=>{"birthday(1i)"=>"1995","birthday(2i)"=>"08","birthday(3i)"=>"29"}}}
          expect(response).to redirect_to "/signup/user_reg"
        end
      end
     
  #user_reg3のビューが表示されるか
    describe 'GET #user_reg3' do
      it "renders the :user_reg3 template" do
        get :user_reg3
        expect(response).to render_template :user_reg3
      end
  end

  #user_reg4のビューが表示されるか
  describe 'GET #user_reg4' do
    it "renders the :user_reg4 template" do
      get :user_reg4
      expect(response).to render_template :user_reg4
    end
end

  #user_reg5のビューが表示されるか
  describe 'GET #user_reg5' do
    it "renders the :user_reg5 template" do
      get :user_reg5
      expect(response).to render_template :user_reg5
    end
end

  #createアクションが実行されて、doneメソッドが発動されるか
  describe 'POST #create' do
    it "excusion create and done" do
      post :create,params:{"nickname"=>"まさき","email"=>"mddaf@outlook.jp", "password"=>"1111111", "password_confirmation"=>"1111111", "last_name"=>"三島", "first_name"=>"将暉", "last_name_kana"=>"ミシマ", "first_name_kana"=>"コウダイ","birthday"=>"1995-08-29",user:{"phone_number"=>"12344678901"}}
      expect(response).to redirect_to done_signup_index_path
    end
  end
  

end
