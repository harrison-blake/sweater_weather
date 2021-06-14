class BooksService
  def self.books_by_location(location)
    response = Faraday.get("http://openlibrary.org/search.json") do |request|
      request.params['q'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
