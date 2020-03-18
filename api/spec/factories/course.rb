FactoryBot.define do
  factory :course   do
    name { Faker::Food.dish }
    details { Faker::Food.description }
  end
end
