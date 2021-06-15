class Image
  attr_reader :id,
              :location,
              :image_url,
              :source,
              :author

  def initialize(image, location)
    @id = nil
    @location = location
    @image_url = image[:urls][:full]
    @source = image[:links][:html]
    @author = image[:user][:name]
  end
end
