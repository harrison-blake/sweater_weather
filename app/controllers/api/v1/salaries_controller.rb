class Api::V1::SalariesController < ApplicationController
  def index
    destination = params[:destination]
    response = Faraday.get("https://api.teleport.org/api/urban_areas/slug:#{destination}/salaries/")
    parsed = JSON.parse(response.body, symbolize_names: true)
    salaries = Salaries.new(parsed)
  end
end
