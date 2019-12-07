#ujiie  items_controllerのテスト
require 'rails_helper'

  describe ItemsController do

#buy
  #購入できるか
    describe 'POST #buy' do
      it "redirect_to  card#new" do
        user = create(:user)
        sign_in user
        post :buy,params:{id:"1"}
        expect(response).to redirect_to new_card_path
      end
    end
  end