require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:user) do
    User.create!(name: "Joana", email: "joana@teste.com" )
  end
  let(:questionnaire) do
    Questionnaire.create!(name: 'Lógica', description: 'É um teste', limit_time: 2, user: user )
  end
  let(:questions) do
    Questions.create!(description: 'É um teste', points: 2, questionnaire: questionnaire )
  end

  it 'description must be required' do
    answer = Answer.new(correct: true)
    expect(answer).to_not be_valid
    expect(answer.errors[:description]).to include("can't be blank")
  end

  it 'correct must be required' do
    answer = Answer.new(description: 'Esse é um teste de resposta')

    expect(answer).to_not be_valid
    expect(answer.errors[:correct]).to include("can't be blank")
  end
end
