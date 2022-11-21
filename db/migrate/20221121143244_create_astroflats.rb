class CreateAstroflats < ActiveRecord::Migration[7.0]
  def change
    create_table :astroflats do |t|
      t.string :address
      t.integer :surface_area
      t.integer :price_per_night
      t.string :flat_name
      t.integer :number_of_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
