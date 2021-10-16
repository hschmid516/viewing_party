require 'rails_helper'

RSpec.describe 'discover index page' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit discover_index_path
  end

  scenario 'it has a top 40 movie button' do
    VCR.use_cassette('top_40_movies') do
      click_on 'Find Top Rated Movies'

      expect(current_path).to eq(movies_path)
      
    end
  end
end
