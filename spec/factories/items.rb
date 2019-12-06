FactoryBot.define do
  factory :item do
    name        {"マンチカン"}
    price       {"200000"}
    description {"子猫です"}
    size        {"小"}
    status       {"生まれたて"}
    category_id  {"1"}
    brand_id     {"2"}
    ship_method  {"a"}
    ship_person  {"大"}
    ship_area    {"29"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end