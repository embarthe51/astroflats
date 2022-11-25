class Astroflat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependant: :destroy

  has_one_attached :photo

  validates :flat_name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates :price_per_night, presence: true, numericality: { only_integer: true }


  # validation d' image PRESENTE OBLIGATOIRE. A décommenter pour obliger l'ajout d'une photo
  # validates :photo, attached: true, content_type: ['image/jpeg', 'image/jpg', 'image/png'],
  #                                   size: { between: 1.kilobyte..1.megabytes, message: 'Must less than 1 MB' }

  # validation d' image PRESENTE NON OBLIGATOIRE. A décommenter pour rendre enlever obligation d'ajout d'une photo
  # validates :photo, content_type: ['images/jpeg', 'images/jpg', 'images/png'],
  #                   size: { between: 1.kilobyte..1.megabytes, message: 'Must less than 1 MB' }

  def future_bookings?
    today = Date.today
    boolean_response = false
    if bookings.any?
      bookings.each do |item|
        item.arrival_date > today ? boolean_response = false : boolean_response = true
      end
    end
    boolean_response
  end

  def future_bookings_string
    future_bookings? ? "future bookings \u{1F4C5}" : "available"
  end
end
