require 'rails_helper'

describe "user can search for nearest fuel station" do
  scenario "by location" do
    visit '/'
    select "Turing", from: :location
    click_button 'Find Nearest Station'

    expect(current_path).to eq(search_path)

    within(".nearest_station_info") do
      expect(page).to have_css('.name')
      expect(page).to have_css('.address')
      expect(page).to have_css('.fuel_type')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.access_times')
      expect(page).to have_css('.estimated_travel_time')
      expect(page).to have_css('.directions')
    end

    expect(page).to have_content('Head southeast on 17th St toward Larimer St')
  end
end
