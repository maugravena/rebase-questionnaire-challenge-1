require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'description must be required' do
    question = build(:question, points: 2, description: "")

    expect(question).to_not be_valid
    expect(question.errors[:description]).to include("não pode ficar em branco")
  end

  it 'points must be required' do
    question = build(:question, points: nil, description: 'Teste os seus conhecimentos')

    expect(question).to_not be_valid
    expect(question.errors[:points]).to include("não pode ficar em branco")
  end
end
