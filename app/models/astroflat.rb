class Astroflat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :flat_name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates :price_per_night, presence: true, numericality: { only_integer: true }
end
