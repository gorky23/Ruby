FactoryBot.define do
  factory :friend do
    name { Faker::Lorem.characters(number: 3) }
    surname { Faker::Lorem.characters(number: 5) }
    email { Faker::Lorem.characters(number: 5) }
    #surname { true }
    #email { true }
    place { :school }
  end
end