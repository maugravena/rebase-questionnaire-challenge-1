FactoryBot.define do
  factory :user do
    name { 'Joao Henrique'}
    sequence(:email) { |n| "email#{n}@test.com.br" }
  end
end
