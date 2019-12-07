FactoryBot.define do
  factory :image  do
    image             {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/computer_programming_man.png'))}
    item
  end
end
