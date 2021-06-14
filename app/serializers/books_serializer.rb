class BooksSerializer
  include FastJsonapi::ObjectSerializer
  attributes :isbn, :title, :publisher
end
