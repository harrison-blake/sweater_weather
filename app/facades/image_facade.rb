class ImageFacade
  def self.get_image(query)
    parsed = ImageService.get_image(query)
    Image.new(parsed[:results][0], query)
  end
end
