require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  it 'name must be required' do
    questionnaire = build(:questionnaire, name: "", limit_time: 2, description: "É um teste")

    expect(questionnaire).to_not be_valid
    expect(questionnaire.errors[:name]).to include("não pode ficar em branco")
  end

  it 'description must be required' do
    questionnaire = build(:questionnaire, name: "Joao Sena", limit_time: 2, description: "")

    expect(questionnaire).to_not be_valid
    expect(questionnaire.errors[:description]).to include("não pode ficar em branco")
  end

  it 'limit_time must be required' do
    questionnaire = build(:questionnaire, name: "Joao Sena", limit_time: nil, description: "É um teste")

    expect(questionnaire).to_not be_valid
    expect(questionnaire.errors[:limit_time]).to include("não pode ficar em branco")
  end

  it 'name must be unique' do
    questionnaire1 = create(:questionnaire, name: 'Lógica',description: 'Esse é um teste',
                                          limit_time: 2)
    questionnaire2 = build(:questionnaire, name: 'Lógica', description: 'Esse é um teste', 
                            limit_time: 2)

    expect(questionnaire2).to_not be_valid
    expect(questionnaire2.errors[:name]).to include("should be unique")
  end
end
