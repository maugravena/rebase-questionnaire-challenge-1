FactoryBot.define do
  factory :answer do
    description { 'Resposta teste.'}
    correct { true }

    question
  end
end