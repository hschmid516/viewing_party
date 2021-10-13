require 'rails_helper'

RSpec.describe 'User registration' do
  before :each do
    visit registration_path
  end

  it 'creates a new user' do
    fill_in 'user[email]', with: 'rick.sanchez@thecitadel.com'
    fill_in 'user[name]', with: 'Rick'
    fill_in 'user[password]', with: 'SealTeamRicks'
    fill_in 'user[password_confirmation]', with: 'SealTeamRicks'

    click_on 'Register'

    expect(page).to have_content("Welcome, Rick!")
    expect(current_path).to eq(dashboard_index_path)
  end
end
