#mishima ユーザー新規登録 signup_controllerのテスト
require 'rails_helper'

  describe SignupController do
    
#user_regアクション
  #ビューが表示されるか
    describe 'GET #user_reg' do
      it "renders the :user_reg template" do
        get :user_reg    
        expect(response).to render_template :user_reg
      end
    end
    
  # #@userが作成できているか
  #   describe 'GET #user_reg2' do
  #     it "assigns the requested user to @user" do
  #       user = build(:user,nickname:"",email:"",password:"",password_confirmation:"",last_name:"",first_name:"",last_name_kana:"",first_name_kana:"",birthday:"",phone_number:"")
  #       get :user_reg
  #       expect(assigns(:user)).to eq user
  #     end
  #   end

# user_reg2アクション
#   #user_reg2
#     describe 'GET #user_reg2' do
#       it "assigns the requested user" do
#         user = create(:user,phone_number:"")
#         get :user_reg2, params: {nickname:user.nickname,email:user.email,password:user.password,password_confirmation:user.password_confirmation,last_name:user.last_name,last_name_kana:user.last_name_kana,first_name_kana:user.first_name_kana,birthday:user.birthday}
      
#       end
#     end 
  
  #user_reg2のビューが表示されるか
      describe 'GET #user_reg2' do
        it "renders the :user_reg2 template" do
          user = create(:user)
          
          get :user_reg2,  params: {nickname:user.nickname}
          expect(response).to render_template :user_reg2
        end
    end

    # ,email:user.email,password:user.password,password_confirmation:user.password_confirmation,last_name:user.last_name,last_name_kana:user.last_name_kana,first_name_kana:user.first_name_kana,birthday:user.birthday


    end
