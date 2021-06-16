require 'rails_helper'

describe 'Sessions API' do
  describe 'Happy Path' do
    it "returns correct user data in the correct structure" do
      user_params = {
                  email: 'testemail111@test.com',
                  password: 'test',
                  api_key: 'bb2a52d9c78f9f38bdc1fef922041fbd'
                }

      headers = {"CONTENT_TYPE" => "application/json"}

      User.create!(email: 'testemail111@test.com',
                       password: 'test',
          password_confirmation: 'test'
      )

      VCR.use_cassette('user_login') do
        post '/api/v1/sessions', headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
    end
  end

  describe "Sad Path" do
    it "doesn't return a user when email doesn't match any user and returns a 400 response" do
      user_params = {
                  password: 'test',
                  password_confirmation: 'test'
                }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/sessions', headers: headers, params: user_params.to_json
      end

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_success
      expect(error[:error]).to eq("credentials are bad")
    end
  end
end
