require 'rails_helper'

describe 'Users API' do
  describe 'Happy Path' do
    it 'can create a new user' do

      user_params = ({
                  email: 'testemail@test.com',
                  password: 'test',
                  password_confirmation: 'test'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end

      created_user = User.last

      expect(response).to be_success
      expect(created_user.email).to eq(user_params[:email])
      expect(created_user.password).to eq(user_params[:password])
      expect(created_user.password_confirmation).to eq(user_params[:password_confirmation])
      expect(created_user.api_key).not_to eq(nil)
    end
  end
end
