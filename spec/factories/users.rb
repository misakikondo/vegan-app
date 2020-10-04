FactoryBot.define do
      factory :user do
        nickname              { Faker::Name.initials(number: 6) }
        email                 { Faker::Internet.free_email }
        password              { Faker::Internet.password(min_length: 6) }
        password_confirmation { password }
        birth                 { Faker::Date.between(from: '1930-01-01', to: Date.today) }
      end
    end
