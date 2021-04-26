require 'rails_helper'

  describe 'happy path' do
    it "should build a salaries PORO based on given data" do
      response = Faraday.get("https://api.teleport.org/api/urban_areas/slug:chicago/salaries")
      parsed = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      salaries = Salaries.new(parsed)

    end
  end
