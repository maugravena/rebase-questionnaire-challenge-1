require 'rails_helper'

describe 'users can see questionnaire details' do
  context '#show' do
    let(:user) do
      User.create!(name: "Joana", email: "joana@teste.com")
    end

    let(:questionnaire) do
      Questionnaire.create!(
        name: 'Lógica',
        description: 'É um teste',
        limit_time: 2,
        user: user
                            )
    end

    it 'returns success response' do
      get '/api/v1/questionario', params: { id: questionnaire.id }

      expect(response).to have_http_status(:ok)
    end

    it 'returns the questionnaire details' do
      get '/api/v1/questionario', params: { id: questionnaire.id }

      json = JSON.parse(response.body, symbolize_names: true).first

      expect(json[:name]).to eq(questionnaire.name)
      expect(json[:description]).to eq(questionnaire.description)
      expect(json[:limit_time]).to eq(questionnaire.limit_time)
    end
  end
end
