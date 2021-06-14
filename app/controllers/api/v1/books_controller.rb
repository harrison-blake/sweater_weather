class Api::V1::BooksController < ApplicationController
  def search
    data = BooksService.books_by_location(params[:location])

    num = data[:numFound]
    books = []

    data[:docs].each do |book_info|
      books << BookWithWeather.new(book_info)
    end

    render json: BooksSerializer.new(books)
  end
end
