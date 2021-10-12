require 'rails_helper'

RSpec.describe Party do
  it { should have_many(:guests) }
end
