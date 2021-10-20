class Party < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :users, through: :guests
  validates :duration, numericality: { only_integer: true }
  validates :duration, :day, :time, presence: true

  def find_host
    guests.find_by(host: true).user.name
  end

  def invited
    guests.where(host: false)
  end
end
