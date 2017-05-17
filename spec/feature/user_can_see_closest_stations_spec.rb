# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane   ELEC, LPG (Propane)
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

require 'rails_helper'

RSpec.feature "User can see closest stations" do
  it "user can search for closest stations" do
    visit '/'
    click_on "Locate"

    #

    # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&fuel_type=ELEC,LPG&api_key=ENV["nrel_api_key"]

    # GET /api/alt-fuel-stations/v1/nearest.format?parameters
    # GET /api/alt-fuel-stations/v1/nearest.json?    &api_key=YOUR_KEY_HERE'
    # expect(current_path).to eq('/search')
    # expect(current_path).to have_content('/search')


  end
end
