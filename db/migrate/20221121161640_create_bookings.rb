class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :arrival_date
      t.datetime :departure_date
      t.float :total_price
      t.references :user, null: false, foreign_key: true
      t.references :astroflat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
