class User < ApplicationRecord
  has_many :friendships
  has_many :guests
  has_many :parties, through: :guests
  has_many :friends, through: :friendships
end
