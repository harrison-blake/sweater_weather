require 'rails_helper'

RSpec.describe ImageFacade do
  describe "happy path" do
    describe "method get_image" do
      it 'tests the structure of data returned' do
        location = 'denver,co'
        image = ''

        VCR.use_cassette('background_image_facade') do
          image = ImageFacade.get_image(location)
        end

        expect(image).to be_an(Image)
        expect(image.id).to eq(nil)
        expect(image.location).to eq(location)
        expect(image.image_url).to be_a(String)
        expect(image.source).to be_a(String)
        expect(image.author).to be_a(String)
      end
    end
  end
end
