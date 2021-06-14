class BookWithWeather
  attr_reader :id,
              :isbn,
              :title,
              :publisher

  def initialize(book)
    @id = nil
    @isbn = book[:isbn]
    @title = book[:title]
    @publisher = book[:publisher]
  end
end
