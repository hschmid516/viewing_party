class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :parties, through: :guests
  has_many :friends, through: :friendships

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password
end
