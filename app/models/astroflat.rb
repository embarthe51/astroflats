class Astroflat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :flat_name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates :price_per_night, presence: true, numericality: { only_integer: true }

  validates :photo, content_type: ['image/jpeg', 'image/jpg', 'image/png'],
                                    size: { between: 1.kilobyte..1.megabytes, message: 'Must less than 1 MB' }
end
