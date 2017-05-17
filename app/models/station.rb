class Station < ActiveRecord::Base


  def self.create_stations(response)
    response[:fuel_stations].each do |station|
      Station.find_or_create_by(name: station[:station_name],
                   address: "#{station[:street_address]}, #{station[:city]}, #{station[:state]}, #{station[:zip]}",
                   fuel_types: station[:fuel_type_code],
                   distance: station[:distance],
                   access_days_time: station[:access_days_time])
    end
  end

end
