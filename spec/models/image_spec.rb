require 'rails_helper'

RSpec.describe Image, type: :model do
	describe Image do
    it "画像が保存できていないとバリデーションで弾かれる" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end
  end
end
