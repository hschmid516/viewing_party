require 'rails_helper'

RSpec.describe Guest do
  it { should belong_to(:user) }
  it { should belong_to(:party) }
end
