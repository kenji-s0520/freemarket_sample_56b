#yoshikawa 商品出品ページ Items_controller#createのテスト

require 'rails_helper'

  describe ItemsController do
    describe 'POST #create' do
      # it 'count up item' do
      #   post :create,params:{item:{name:"アディダス",description:"黒の25.5cmで、アディダススタンスミスモデルです！ほとんど未使用です！",category_id:"249",brand_id:"アディダス",size:"別途記載",status:"未使用に近い",ship_person:"着払い(購入者負担)",ship_method:"着払い(購入者負担)",ship_area:"クロネコヤマト",ship_days:"1~2日で発送",price:"12345"}}
      #   params = { images_attributes: [ FactoryBot.attributes_for( :image ) ] }
      #   expect {
      #     post :create,
      #     item: FactoryBot.attributes_for( :item ).merge( params )
      #     }.to change( Item, :count ).by( 1 ).and change( Image, :count ).by( 1 )
      # end

      it 'can not save not count' do
        post :create,params:{item:{name:"",description:"黒の25.5cmで、アディダススタンスミスモデルです！ほとんど未使用です！",category_id:"249",brand_id:"アディダス",size:"別途記載",status:"未使用に近い",ship_person:"着払い(購入者負担)",ship_method:"着払い(購入者負担)",ship_area:"クロネコヤマト",ship_days:"1~2日で発送",price:"12345" }}
        expect{ subject }.not_to change(Item, :count)
      end

      it 'can not save renders new' do
        user = create(:user)
        sign_in user
        post :create,params:{item:{name:"",description:"黒の25.5cmで、アディダススタンスミスモデルです！ほとんど未使用です！",category_id:"249",brand_id:"アディダス",size:"別途記載",status:"未使用に近い",ship_person:"着払い(購入者負担)",ship_method:"着払い(購入者負担)",ship_area:"クロネコヤマト",ship_days:"1~2日で発送",price:"12345" }}
        expect(response).to render_template :new
      end
    end
  end