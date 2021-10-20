require 'rails_helper'

RSpec.describe 'User registration' do
  before :each do
    visit registration_path
    fill_in 'user[email]', with: 'rick.sanchez@thecitadel.com'
    fill_in 'user[name]', with: 'Rick'
    fill_in 'user[password]', with: 'SealTeamRicks'
    fill_in 'user[password_confirmation]', with: 'SealTeamRicks'

    click_on 'Register'
  end

  it 'creates a new user' do
    expect(page).to have_content("Welcome, Rick!")
    expect(current_path).to eq(dashboard_index_path)
  end

  it 'errors if email is taken' do
    visit registration_path

    fill_in 'user[email]', with: 'rick.sanchez@thecitadel.com'
    fill_in 'user[name]', with: 'Morty'
    fill_in 'user[password]', with: 'theRealMorty'
    fill_in 'user[password_confirmation]', with: 'theRealMorty'

    click_on 'Register'

    expect(page).to have_content('Fields are missing or invalid. Try again')
    expect(current_path).to eq(registration_path)
  end

  it 'errors if password conformation is wrong' do
    visit registration_path

    fill_in 'user[email]', with: 'rick@thecitadel.com'
    fill_in 'user[name]', with: 'Rick'
    fill_in 'user[password]', with: 'SealTeamRicks'
    fill_in 'user[password_confirmation]', with: 'wrongpassword'

    click_on 'Register'

    expect(page).to have_content('Password and confirmation must match. Try again')
    expect(current_path).to eq(registration_path)
  end
end
