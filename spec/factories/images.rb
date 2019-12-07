FactoryBot.define do
  factory :image do
    id     {"1"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/cat2.jpeg'))}
    item
  end
end
