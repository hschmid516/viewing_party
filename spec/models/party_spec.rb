require 'rails_helper'

RSpec.describe Party do
  it { has_many :guests}
end
