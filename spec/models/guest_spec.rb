require 'rails_helper'

RSpec.describe Guest do
  it { belongs_to :user}
  it { belongs_to :party}
end
