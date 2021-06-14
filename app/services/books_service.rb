class BooksService
  def self.long_and_lat(location)
    response = Faraday.get("http://openlibrary.org/search.json") do |request|
      request.params['q'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
