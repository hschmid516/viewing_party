require 'rails_helper'

RSpec.describe 'Dashboard' do
  before :each do
    visit dashboard_index_path
  end

  it 'has button to discover movies' do
    click_on 'Discover Movies'

    expect(current_path).to eq(discover_index_path)
  end

  it 'has a friends section' do
    expect(page).to have_content('Friends')
  end

  it 'has a viewing parties section' do
    expect(page).to have_content('Viewing Parties')
  end
end
