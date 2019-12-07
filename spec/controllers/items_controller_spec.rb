require 'rails_helper'

  describe ItemsController do

#show
#@imagesが期待した値になっているか
#@userが期待した値になっているか
#@itemsが期待した値になっているか

  



#showのビューが表示されるか
  #   describe 'GET #show' do
  #     it "renders the :show templete" do
  #       get :show, params:{id:"1"}
  #       expect(response).to render_templete "items/items"
  #     end
  #   end
  # end

    describe 'GET #new' do
      it "renders the :new template" do
        user = create(:user)
        sign_in user
        get :new
        expect(response).to render_template :new
      end
    end


    describe 'GET #toppage' do
      it "populates an array of itemns ordered by create_at DESC" do
        items = create_list(:item,5)
        get :toppage
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
      end

      it "renders the :toppage tempalate" do
        get :toppage
        expect(response).to render_template :toppage
      end
    end

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
