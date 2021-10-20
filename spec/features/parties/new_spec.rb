require 'rails_helper'

RSpec.describe 'Parties#new', :vcr do
  before :each do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @user4 = create(:user)
    @user1.friendships.create(friend: @user2)
    @user1.friendships.create(friend: @user3)
    @user1.friendships.create(friend: @user4)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    visit movie_path(238)
    click_button 'Create Viewing Party for Movie'
  end

  it "can create a new viewing party" do
    expect(current_path).to eq(new_party_path)
    expect(page).to have_field('duration', with: '175')

    fill_in :title, with: 'The Godfather'
    fill_in :duration, with: 500
    fill_in :day, with: '12/12/2021'
    fill_in :time, with: '07:15'
    check @user2.name
    check @user3.name
    click_button 'Create Party'

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content('The Godfather')
    expect(page).to have_content(500)
    expect(page).to have_content('12/12/21')
    expect(page).to have_content('7:15 AM')
    expect(page).to have_content("Host: #{@user1.name}")
    within("#invited") do
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
      expect(page).to_not have_content(@user4.name)
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
    visit dashboard_index_path

    expect(page).to have_content('The Godfather')
  end
end
