require 'rails_helper'

RSpec.describe 'Dashboard' do
  context 'logged in' do
    before :each do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
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

  context 'not logged in' do
    it "will not allow things and stuff without proper authorization" do

      visit dashboard_index_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You must be logged in to access this page! Access denied!')
    end
  end
end
