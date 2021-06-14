require 'rails_helper'

describe 'Books API' do
  describe 'Happy Path' do
    it 'returns book data in the correct format' do
      get '/api/v1/book-search?location=denver,co'

      expect(response).to be_success
    end
  end
end
