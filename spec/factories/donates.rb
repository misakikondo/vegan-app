FactoryBot.define do
  factory :donate do
    price { Faker::Number.within(range: 500..100_000) }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
  end
end
