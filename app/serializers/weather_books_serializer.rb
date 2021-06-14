class WeatherBooksSerializer
  include FastJsonapi::ObjectSerializer
  set_type :books
  attributes :forecast, :temperature, :total_books_found

  attribute :books do |object|
    object.books_array do |book|
      {
        isbn: object.isbn,
        title: object.title,
        publisher: object.publisher
      }
    end
  end
end
