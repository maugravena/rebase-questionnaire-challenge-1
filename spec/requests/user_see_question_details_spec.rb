require 'rails_helper'

describe 'user can see question details' do
  context '#show' do
    let(:question) { create(:question) }


    it 'returns success response' do
      get api_v1_question_path(question)

      expect(response).to have_http_status(:ok)
    end

    it 'return the question details' do
      answer_first = create(:answer, question: question)
      answer_second = create(:answer, question: question)
      
      get api_v1_question_path(question.id)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:id]).to eq(question.id)
      expect(json[:description]).to eq(question.description)
      expect(json[:points]).to eq(question.points)
      expect(json[:answers][0][:id]).to eq(answer_first.id)
      expect(json[:answers][1][:id]).to eq(answer_second.id)
    end

    it 'invalid id returns 404' do
      get api_v1_question_path(0)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:not_found)
      expect(json[:message]).to eq("Couldn't find Question with 'id'=0")
    end
  end
end
