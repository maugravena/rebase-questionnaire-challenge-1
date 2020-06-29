require 'rails_helper'

describe 'users can create ansers' do
  context '#create' do
    let(:user) do
      User.create!(name: "Joana", email: "joana@teste.com" )
    end

    let(:questionnaire) do
      Questionnaire.create!(name: 'Lógica', description: 'É um teste', limit_time: 2, user: user )
    end

    let(:questions) do
      Question.create!(description: 'É um teste', points: 2, questionnaire: questionnaire )
    end

    context 'with valid params' do
      let(:answers_params) do
        {
          id: questions.id,
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
          id: questions.id,
          answers: {
            correct: false
          }
        }
      end

      it 'returns unprocessable entity response' do
        post '/api/v1/resposta', params: answers_params

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the error message' do
        post '/api/v1/resposta', params: answers_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:errors][:description]).to include("can't be blank")
      end
    end
  end
end
