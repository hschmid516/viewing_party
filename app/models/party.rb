class Party < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :users, through: :guests
end
