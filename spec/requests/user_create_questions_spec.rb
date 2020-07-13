require 'rails_helper'

describe 'users can create questions' do
  context '#create' do

    let(:questionnaire) {create(:questionnaire)}

    context 'with valid params' do
      let(:questions_params) do
        {
          id: questionnaire.id,
          questions: {
            description: 'Qual a sua idade?',
            points: 2
          }
        }
      end

      it 'returns success response' do
        post '/api/v1/pergunta', params: questions_params

        expect(response).to have_http_status(:created)
      end

      it 'should create the questions' do
        expect { post '/api/v1/pergunta', params: questions_params }.to change { Question.count }.by(1)
      end

      it 'should create with description and points' do
        post '/api/v1/pergunta', params: questions_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:description]).to eq(questions_params[:description])
        expect(json[:points]).to eq(questions_params[:points])
      end
    end

    context 'with invalid params' do
      let(:questions_params) do
        {
          id: questionnaire.id,
          questions: {
            points: 2
          }
        }
      end

      it 'returns unprocessable entity response' do
        post '/api/v1/pergunta', params: questions_params

        expect(response).to have_http_status(:precondition_failed)
      end

      it 'returns the error message' do
        post '/api/v1/pergunta', params: questions_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:message]).to eq("A validação falhou: descrição não pode ficar em branco")
      end
    end
  end
end
