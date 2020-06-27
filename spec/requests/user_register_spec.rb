require 'rails_helper'

describe 'users can sign up' do
  context '#create' do
    let(:user_params) do
      {
        user: {
          name: 'Jonh Doe',
          email: 'jonhdoe@example.com'
        }
      }
    end

    it 'returns success response' do
      post '/api/v1/usuario', params: user_params

      expect(response).to have_http_status(:created)
    end

    it 'should create the users' do
      expect { post '/api/v1/usuario', params: user_params }.to change { User.count }.by(1)
    end

    it 'should create with name and email' do
      post '/api/v1/usuario', params: user_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq(user_params[:name])
      expect(json[:email]).to eq(user_params[:email])
    end
  end
end
