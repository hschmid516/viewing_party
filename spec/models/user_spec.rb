require 'rails_helper'

RSpec.describe User do
  it { should have_many(:friendships) }
  it { should have_many(:guests) }
  it { should have_many(:parties).through(:guests) }
end
