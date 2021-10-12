require 'rails_helper'

RSpec.describe Friendship do
  it { should belong_to(:user) }
end
