require 'rails_helper'

RSpec.describe Book do
  describe 'happy path' do
    it "should build a book PORO based on given data" do
      location = 'denver,co'
      book_data = BooksService.books_by_location(location)[:docs][0]

      book = Book.new(book_data)

      expect(book.isbn).to be_a(Array)
      expect(book.title).to be_a(String)
      expect(book.isbn).to be_a(Array)
    end
  end
end
