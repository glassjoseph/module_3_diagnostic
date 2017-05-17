class NrelService

  def self.find_stations(zipcode)
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zipcode}&fuel_type=ELEC,LPG&api_key=#{ENV['nrel_api_key']}")

    response = JSON.parse(response.body, symbolize_names: true)
    Station.create_stations(response)
  end
end
