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
    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(dashboard_path)
  end
end
