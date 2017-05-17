require 'rails_helper'

RSpec.feature "User can see closest stations" do
  it "user can search for closest electric and propane stations" do
    visit '/'

    fill_in "q", with: "80203"
    click_on "Locate"
    expect(current_path).to eq('/search')

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
