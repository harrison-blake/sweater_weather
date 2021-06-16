require 'rails_helper'

describe 'Users API' do
  describe 'Happy Path' do
    it "returns a 201 status and correct structure response" do
      user_params = ({
                  email: 'testemail@test.com',
                  password: 'test',
                  password_confirmation: 'test'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
    end

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
      expect(created_user.api_key).not_to eq(nil)
    end
  end
  describe 'Sad Path' do
    it "doesn't create a new user with a non unique email and has a 400 response" do
      user = User.create!(email: 'testemail@test.com',
                       password: 'test',
          password_confirmation: 'test'
      )

      user_params = ({
                  email: 'testemail@test.com',
                  password: 'test',
                  password_confirmation: 'test'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_success
      expect(error[:error]).to eq("Email has already been taken")
    end

    it "doesn't create a new user with no email given and has a 400 response" do
      user_params = ({
                  password: 'test',
                  password_confirmation: 'test'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_success
      expect(error[:error]).to eq("Email can't be blank and Email is invalid")
    end

    it "doesn't create a new user with mismatching passwords and has a 400 response" do
      user_params = ({
                    email: "test@email.com",
                  password: 'test',
                  password_confirmation: 'test1'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_success
      expect(error[:error]).to eq("Password confirmation doesn't match Password")
    end

    it "doesn't create a new user with no password and has a 400 response" do
      user_params = ({
                    email: "test@email.com",
                  password_confirmation: 'test1'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_success
      expect(error[:error]).to eq("Password can't be blank and Password confirmation doesn't match Password")
    end
  end

  describe "Edge Case" do
    it "doesn't create a new user when email doesn't have correct format" do
      user_params = ({
                    email: "testemail.com",
                  password: 'test',
                  password_confirmation: 'test'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('new_user') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_success
      expect(error[:error]).to eq("Email is invalid")
    end
  end
end
