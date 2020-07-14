FactoryBot.define do
  factory :questionnaire do
    name { 'Lógica' }
    description { 'questionario de teste.' }
    limit_time { 5 }

    user
  end
end
