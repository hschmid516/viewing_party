require 'rails_helper'

RSpec.describe Party do
  it { should have_many(:guests) }
  it { should have_many(:users).through(:guests) }

  before :each do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @party1 = create(:party)
    @party2 = create(:party)
    @user1.friendships.create(friend: @user2)
    @user1.friendships.create(friend: @user3)
    @guest1 = @party1.guests.create(user: @user1, host: true)
    @guest2 = @party1.guests.create(user: @user2, host: false)
    @guest3 = @party1.guests.create(user: @user3, host: false)
  end

  it 'can find host' do
    expect(@party1.find_host).to eq(@user1.name)
  end

  it 'can find invited guests' do
    expect(@party1.invited).to eq([@guest2, @guest3])
  end
end
