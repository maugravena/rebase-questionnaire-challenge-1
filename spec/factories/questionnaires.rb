FactoryBot.define do
  factory :questionnaire do
    name { 'Joao Henrique'}
    description { 'questionario de teste.'}
    limit_time { 5 }

    user
  end
end