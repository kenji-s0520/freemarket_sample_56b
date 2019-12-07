# yoshikawa itemモデルのテスト用のサンプルを作成
FactoryBot.define do
  factory :item  do
    name              {"スタンスミス"}
    description       {"黒の25.5cmで、アディダススタンスミスモデルです！ほとんど未使用です！"}
    category_id       {"249"}
    brand_id          {"アディダス"}
    size              {"別途記載"}
    status            {"未使用に近い"}
    ship_person       {"着払い(購入者負担)"}
    ship_method       {"着払い(購入者負担)"}    
    ship_area         {"クロネコヤマト"}  
    ship_days         {"1~2日で発送"}  
    price             {"12345"} 
  end

  factory :item_with_image, class: Item do
    image             {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/computer_programming_man.png'))}

    after( :create ) do |item|
      create :image, parent: item
    end
  end  
end



