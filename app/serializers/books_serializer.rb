class BooksSerializer
  include FastJsonapi::ObjectSerializer
  attributes :forecast, :temperature, :total_books_found

  attribute :books do |object|
    object.books do |book|

      {
        isbn: object.isbn,
        title: object.title,
        publisher: object.publisher
      }
    end
  end
end
