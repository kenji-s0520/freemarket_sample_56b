#ujiie ユーザー新規登録 card_controllerのテスト
require 'rails_helper'

  describe CardController do

#new

  #newのビューが表示されるか
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

end
