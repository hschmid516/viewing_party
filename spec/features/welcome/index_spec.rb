require 'rails_helper'

RSpec.describe 'Welcome#index' do
  before :each do
    @us1 = User.create!(email: 'noreply@gmail.com', password: 'passy15', name: 'Lorde JJ')
    visit root_path
  end

  it "has a welcome message and description" do
    expect(page).to have_content('Welcome to our Viewing Party!')
    expect(page).to have_content('Wanna watch a movie with your friends?! We are here to help!')
  end

  it "has a login link and form" do
    fill_in :email, with: @us1.email
    fill_in :password, with: @us1.password

    click_on "Log In"

    expect(current_path).to eq(dashboard_index_path)
  end

  it 'shows error if credentials are incorrect or incomplete' do
    click_on "Log In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sorry, your credentials are bad. Pitter Patter let's get at er")

    fill_in :email, with: @us1.email
    fill_in :password, with: 'wrongpassword'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sorry, your credentials are bad. Pitter Patter let's get at er")
  end

  it "has a registration link" do
    click_on "New to Viewing Party? Register Here"

    expect(current_path).to eq(registration_path)
  end

  it "has a logout option" do
    fill_in :email, with: @us1.email
    fill_in :password, with: @us1.password

    click_on "Log In"
    click_on "Log Out"

    expect(current_path).to eq(root_path)
  end
end
