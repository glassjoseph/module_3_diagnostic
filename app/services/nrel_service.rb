class NrelService

  def self.find_stations(zipcode)
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zipcode}&fuel_type=ELEC,LPG&api_key=#{ENV['nrel_api_key']}")

    response = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    response[:fuel_stations].each do |station|
      Station.create(name: station[:station_name],
                     address: "#{station[:street_address]}, #{station[:city]}, #{station[:state]}, #{station[:zip]}",
                     fuel_types: station[:fuel_type_code],
                     distance: station[:distance],
                     access_days_time: station[:access_days_time])
  end




end
