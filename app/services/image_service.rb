class ImageService
  def self.get_image(query)
    response = Faraday.get("https://api.unsplash.com/search/photos") do |request|
      request.params['client_id'] = '3XtVYUVVPnp6p23iszXvo-hbhAe6LrXr1BgFEZw-ZYs'
      request.params['query'] = query
    end

    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
