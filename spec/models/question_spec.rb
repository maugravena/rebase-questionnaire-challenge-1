require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) do
    User.create!(name: "Joana", email: "joana@teste.com")
  end
  let(:questionnaire) do
    Questionnaire.create!(name: 'Lógica', description: 'É um teste', limit_time: 2, user: user)
  end

  it 'description must be required' do
    question = Question.new(points: 2)
    expect(question).to_not be_valid
    expect(question.errors[:description]).to include("can't be blank")
  end

  it 'points must be required' do
    question = Question.new(description: 'Teste os seus conhecimentos')

    expect(question).to_not be_valid
    expect(question.errors[:points]).to include("can't be blank")
  end
end
