require 'rails_helper'

RSpec.describe 'Dashboard' do
  context 'logged in' do
    before :each do
      @user1 = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      visit dashboard_index_path
    end

    it 'has button to discover movies' do
      click_on 'Discover Movies'

      expect(current_path).to eq(discover_index_path)
    end

    it 'has a friends section' do
      expect(page).to have_content('Friends')
    end

    it "can add friends" do
      expect(page).to have_content('You currently have zero friends')

      fill_in :email, with: @user2.email
      click_on "Add Friend"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content(@user2.name)
      expect(page).to_not have_content('You currently have zero friends')
    end

    it 'errors when wrong email is given' do
      fill_in :email, with: 'wrong@email.com'
      click_on "Add Friend"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Your 'friend' gave you the wrong email...try again")
    end

    it 'has a viewing parties section' do
      party1 = create(:party, movie_id: 238)
      party2 = create(:party, movie_id: 238)
      @user1.friendships.create(friend: @user2)
      @user1.friendships.create(friend: @user3)

      party1.guests.create(user: @user1, host: true)
      party1.guests.create(user: @user2, host: false)
      party1.guests.create(user: @user3, host: false)

      party2.guests.create(user: @user1, host: false)
      party2.guests.create(user: @user2, host: true)
      party2.guests.create(user: @user3, host: false)
      @user1.reload
      visit dashboard_index_path

      expect(page).to have_content('Viewing Parties')

      within("#party-#{party1.id}") do
        expect(page).to have_content(party1.duration)
        expect(page).to have_content(party1.day)
        expect(page).to have_content(party1.time)
        expect(page).to have_content(party1.title)
        expect(page).to have_content("Host: #{@user1.name}")
        within("#invited") do
          expect(page).to have_content(@user2.name)
          expect(page).to have_content(@user3.name)
        end
      end

      within("#party-#{party2.id}") do
        expect(page).to have_content(party2.duration)
        expect(page).to have_content(party2.day)
        expect(page).to have_content(party2.time)
        expect(page).to have_content(party2.title)
        expect(page).to have_content("Host: #{@user2.name}")
        within("#invited") do
          expect(page).to have_content(@user1.name)
          expect(html).to include("<b>#{@user1.name}</b>")
          expect(page).to have_content(@user3.name)
        end
      end
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


# save_and_open_page
