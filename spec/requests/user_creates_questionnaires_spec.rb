require 'rails_helper'

describe 'users can create questionnaires' do
  context '#create' do
    let(:user) { create(:user) }

    let(:questionnaire_params) do
      {
        id: user.id,
        questionnaire: {
          name: 'Lógica',
          description: 'Teste os seus conhecimentos',
          limit_time: 2
        }
      }
    end

    it 'returns success response' do
      post '/api/v1/questionario', params: questionnaire_params

      expect(response).to have_http_status(:created)
    end

    it 'should create the questionnaire' do
      expect { post '/api/v1/questionario', params: questionnaire_params }.to change { Questionnaire.count }.by(1)
    end

    it 'should create with name, description and limit_time' do
      post '/api/v1/questionario', params: questionnaire_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq(questionnaire_params[:name])
      expect(json[:description]).to eq(questionnaire_params[:description])
      expect(json[:limit_time]).to eq(questionnaire_params[:limit_time])
    end
  end
end
