require 'rails_helper'

RSpec.feature "User can see closest stations" do
  it "user can search for closest electric and propane stations" do
    visit '/'
    # And I fill in the search form with 80203
    # And I click "Locate"
    # Then I should be on page "/search" with parameters visible in the url
    fill_in "q", with: "80203"
    click_on "Locate"
# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&fuel_type=ELEC,LPG&api_key=ENV["nrel_api_key"]

    expect(current_path).to eq('/search')

    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to_not have_content("Fuel Types: BD")
    expect(page).to_not have_content("Fuel Types: CNG")
    expect(page).to_not have_content("Fuel Types: HY")
    expect(page).to_not have_content("Fuel Types: LNG")

    expect(page).to have_content("Name: UDR")
    expect(page).to have_content("Address: 800 Acoma St, Denver, CO, 80204")
    expect(page).to have_content("Fuel Types: ELEC")
    expect(page).to have_content("Distance: 0.31422")
    expect(page).to have_content("Access Times: 24 hours daily")

  end
end
