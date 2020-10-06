FactoryBot.define do
  factory :recipe do
    recipes_name              { Faker::Name.initials}
    explains                  { Faker::Lorem.paragraph}
    level_id                 { 3 }
    cookingtime_id           { 3 }
  association :user
  association :level
  association :cookingtime

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
end
end