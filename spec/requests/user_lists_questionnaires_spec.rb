require 'rails_helper'

describe 'listing questionnaires' do
  context '#index' do
    it 'returns questionnaires' do
      questionnaire1 = create(:questionnaire)
      questionnaire2 = create(:questionnaire, name: 'questionario 2')

      get '/api/v1/questionario'

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json_response[0][:name]).to eq(questionnaire1.name)
      expect(json_response.second[:name]).to eq(questionnaire2.name)
      expect(response.body).to include(questionnaire1.name)
    end

    it 'returns empty array without questionnaires' do
      get '/api/v1/questionario'
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to be_empty
    end
  end
end
