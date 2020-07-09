FactoryBot.define do
  factory :question do
    description { 'Resposta teste.'}
    points { 5 }

    questionnaire
  end
end