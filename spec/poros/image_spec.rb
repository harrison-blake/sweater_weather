require 'rails_helper'

RSpec.describe Image do
  describe 'happy path' do
    it "should build a Image PORO based on given data" do
      data = []
      location = 'Denver,CO'

      VCR.use_cassette('background_image') do
        data = ImageService.get_image(location)
      end

      image = Image.new(data[:results][0], location)

      expect(image).to be_a(Image)
      expect(image.id).to eq(nil)
      expect(image.location).to be_a(String)
      expect(image.image_url).to be_a(String)
      expect(image.source).to be_a(String)
      expect(image.author).to be_a(String)
    end
  end
end
