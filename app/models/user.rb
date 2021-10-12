class User < ApplicationRecord
  has_many :friendships
  has_many :guests
  has_many :parties, through: :guests
end
