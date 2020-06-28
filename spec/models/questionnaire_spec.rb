require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  let(:user) do
    User.create!(name: "Joana", email: "joana@teste.com" )
  end

  it 'name must be required' do
    questionnaire = Questionnaire.new(description: 'Esse é um teste', limit_time: 2)
    expect(questionnaire).to_not be_valid
    expect(questionnaire.errors[:name]).to include("can't be blank")
  end

  it 'description must be required' do
    questionnaire = Questionnaire.new(name: 'Matematica', limit_time: 2)

    expect(questionnaire).to_not be_valid
    expect(questionnaire.errors[:description]).to include("can't be blank")
  end

  it 'limit_time must be required' do
    questionnaire = Questionnaire.new(name: 'Portugues', description: 'Esse é um teste')

    expect(questionnaire).to_not be_valid
    expect(questionnaire.errors[:limit_time]).to include("can't be blank")
  end

  it 'name must be unique' do
    questionnaire1 = Questionnaire.create!(name: 'Lógica',
                                          description: 'Esse é um teste',
                                          limit_time: 2,
                                          user: user)
    questionnaire2 = Questionnaire.new(name: 'Lógica', description: 'Esse é um teste', limit_time: 2)

    expect(questionnaire2).to_not be_valid
    expect(questionnaire2.errors[:name]).to include("should be unique")
  end
end
