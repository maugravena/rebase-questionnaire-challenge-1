FactoryBot.define do
  factory :question do
    description { 'Questão teste'}
    points { 5 }

    questionnaire
  end
end
