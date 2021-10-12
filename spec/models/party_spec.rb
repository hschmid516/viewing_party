require 'rails_helper'

RSpec.describe Party do
  it { should have_many(:guests) }
  it { should have_many(:users).through(:guests) }
end
