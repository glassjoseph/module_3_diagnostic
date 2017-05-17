require 'rails_helper'

RSpec.describe do
  it "has correct attributes" do
    station = Station.create(name: "Gas Station",
                   address: "Street, City, State, Zip",
                   fuel_types: "ELEC",
                   distance: 0.5,
                   access_days_time: "24/7")

    expect(station).to respond_to(:name)
    expect(station).to respond_to(:address)
    expect(station).to respond_to(:fuel_types)
    expect(station).to respond_to(:distance)
    expect(station).to respond_to(:access_days_time)

    expect(station.name).to be_a(String)
    expect(station.address).to be_a(String)
    expect(station.fuel_types).to be_a(String)
    expect(station.distance).to be_a(Float)
    expect(station.access_days_time).to be_a(String)
 end
end
