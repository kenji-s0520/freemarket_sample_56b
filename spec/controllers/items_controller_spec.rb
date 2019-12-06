require 'rails_helper'

  describe ItemsController do
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

  end