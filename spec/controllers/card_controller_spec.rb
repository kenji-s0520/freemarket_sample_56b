#ujiie ユーザー新規登録 card_controllerのテスト
require 'rails_helper'

  describe CardController do

#new

  #カードが登録できるか
    describe 'GET #new' do
      it "redirect_to  create" do
        user = create(:user)
        sign_in user
        get :new
        expect(response).to have_http_status "200"
      end
    end
    
#show
  
  # #showのビューが表示されるか
  #     describe 'GET #show' do
  #       it "renders the :show template" do
  #         user = create(:user)
  #         sign_in user
  #         get :show,params:{card:{"card_id"=>"", "customer_id"=>""}}
  #         expect(response).to render_template :show
  #       end
  #   end

end
