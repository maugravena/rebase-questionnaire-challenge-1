require 'rails_helper'

describe 'users can create ansers' do
  context '#create' do
    let(:question) { create(:question) }

    context 'with valid params' do
      let(:answers_params) do
        {
          id: question.id,
          answers: {
            description: 'Essa é uma resposta teste',
            correct: true
          }
        }
      end

      it 'returns success response' do
        post '/api/v1/resposta', params: answers_params

        expect(response).to have_http_status(:created)
      end

      it 'should create the answers' do
        expect { post '/api/v1/resposta', params: answers_params }.to change { Answer.count }.by(1)
      end

      it 'should create with description and correct' do
        post '/api/v1/resposta', params: answers_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:description]).to eq(answers_params[:description])
        expect(json[:correct]).to eq(answers_params[:correct])
      end
    end

    context 'with invalid params' do
      let(:answers_params) do
        {
          id: question.id,
          answers: {
            correct: false
          }
        }
      end

      it 'returns unprocessable entity response' do
        post '/api/v1/resposta', params: answers_params

        expect(response).to have_http_status(:precondition_failed)
      end

      it 'returns the error message' do
        post '/api/v1/resposta', params: answers_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:message]).to eq("A validação falhou: descrição não pode ficar em branco")
      end
    end
  end
end
