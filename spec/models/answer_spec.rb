require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'description must be required' do
    answer = build(:answer, correct: true, description: "")
    expect(answer).to_not be_valid
    expect(answer.errors[:description]).to include("não pode ficar em branco")
  end

  it 'correct must be required' do
    answer = build(:answer, correct: "", description: 'Esse é um teste de resposta')
    expect(answer).to_not be_valid
    expect(answer.errors[:correct]).to include("não está incluído na lista")
  end
end
