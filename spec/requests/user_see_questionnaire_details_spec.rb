require 'rails_helper'

describe 'users can see questionnaire details' do
  context '#show' do
    let(:questionnaire) { create(:questionnaire) }

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

    it 'invalid id returns 404' do
      get api_v1_questionnaire_path(0)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:not_found)
      expect(json[:message]).to eq("Registro não encontrado")
    end
  end
end
