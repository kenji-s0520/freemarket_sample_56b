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
  #newアクションが実行されて、showアクションが発動されるか
  describe 'POST #new' do
    it "excusion new and show" do
      session[:card_id] = "car_80cfac4b845d53b08d6b5564af2f"
      session[:customer_id] = "cus_5c67222c2483606557049e2d91c4"
      expect(response).to have_http_status "200"
    end
  end

  describe 'POST #create' do
  it "redirect_to  new" do
  user = create(:user)
  sign_in user
  post :create,params:{"payjp-token" => ""}
  expect(response).to redirect_to new_card_path
  end
end

end