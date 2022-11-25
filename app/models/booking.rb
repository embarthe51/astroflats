class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :astroflat

  def total_days_booked
    (departure_date.to_datetime - arrival_date.to_datetime).to_i
  end

  def total_price
    astroflat.price_per_night * total_days_booked
  end

  def total_price_formated_string
    "#{total_price} \u{1F4B0}"
  end
end
