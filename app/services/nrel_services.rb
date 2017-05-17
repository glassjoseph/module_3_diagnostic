class NrelServices

  def self.find_stations(zipcode)
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&fuel_type=ELEC,LPG&api_key=ENV['nrel_api_key']")

    response = JSon.parse(response.body, symbolize_keys: true)
  end



end
