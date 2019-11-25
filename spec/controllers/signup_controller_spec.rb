#mishima ユーザー新規登録 signup_controllerのテスト
require 'rails_helper'

  describe SignupController do
    describe 'GET #user_reg' do
      it "renders the :user_reg template" do
        get :user_reg    
        expect(response).to render_template :user_reg
      end
    end
    
    describe 'GET #user_reg2' do
      it "assigns the requested " 
    end



    end
