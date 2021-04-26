require 'rails_helper'

describe 'Salries API' do
  describe 'Happy Path' do
    it 'returns forecast data in the correct format' do

      get "/api/v1/salaries?destination=chicago"

      expect(response).to be_success
    end
  end
end
