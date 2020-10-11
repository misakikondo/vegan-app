FactoryBot.define do
  factory :comment do
    contents { '美味しそうですね' }

    association :user
    association :recipe
  end
end
