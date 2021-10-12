require 'rails_helper'

RSpec.describe User do
  it { has_many :friends}
  it { has_many :guests}
  it { has_many(:parties).through (:guests)}
end
