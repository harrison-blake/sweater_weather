require 'rails_helper'

RSpec.describe BooksService do
  describe "happy path" do
    it 'tests the structure of our api data for open library endpoint' do
      location = 'Denver,CO'
      data = BooksService.books_by_location(location)

      expect(data).to be_a(Hash)
      expect(data[:numFound]).to be_a(Integer)
      expect(data[:docs]).to be_a(Array)
      expect(data[:docs][0]).to be_a(Hash)
      expect(data[:docs][0][:title]).to be_a(String)
      expect(data[:docs][0][:isbn]).to be_a(Array)
      expect(data[:docs][0][:publisher]).to be_a(Array)
    end
  end
end
