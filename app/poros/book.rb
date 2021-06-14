class Book
  attr_reader :id,
              :isbn,
              :title,
              :publisher

  def initialize(book)
    @isbn = book[:isbn]
    @title = book[:title]
    @publisher = book[:publisher]
  end
end
