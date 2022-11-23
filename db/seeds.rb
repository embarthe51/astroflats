# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# t.string "address"
# t.integer "surface_area"
# t.integer "price_per_night"
# t.string "flat_name"
# t.integer "number_of_guests"
# t.text "content"
puts "coucou"
Astroflat.destroy_all
User.destroy_all
User.create(first_name: "Emeline", email: "blablabla@gmail.com", password: "123456")

Astroflat.create(
    flat_name: "Appartment under the ice",
    content: "Great appatment on Mars under ice, don't be afraid, it isn't cold as you can think !",
    address: "Utopia planitia, Mars planet",
    surface_area: 500,
    price_per_night: 25000,
    number_of_guests: 10,
    user: User.where(email: "blablabla@gmail.com").first
  )
Astroflat.create(
    flat_name: "Jupiter floating villa",
    content: "Have a unique experience in our floating villa in jupiter, sensations guaranteed",
    address: "South Equatorial belt, Jupiter planet",
    surface_area: 1000,
    price_per_night: 50000,
    number_of_guests: 15,
    user: User.where(email: "blablabla@gmail.com").first
  )
Astroflat.create(
    flat_name: "Neptunian rocket",
    content: "In a rocket create for the neptunian conditions, you can live a crazy experience on the far away planet",
    address: " Center of Neptune planet",
    surface_area: 40,
    price_per_night: 100000,
    number_of_guests: 5,
    user: User.where(email: "blablabla@gmail.com").first
  )
Astroflat.create(
    flat_name: "Trip with view in ISS",
    content: "If you dream of seeing the earth from above, a trip to the ISS is perfect for you",
    address: "ISS",
    surface_area: 388,
    price_per_night: 100000,
    number_of_guests: 10,
    user: User.where(email: "blablabla@gmail.com").first
  )
Astroflat.create(
    flat_name: "In the moon like Amstrong",
    content: "Living the same trip as Neil Amstrong in the moon, in his astronaut suit, visit the US flat, and stay in an incredible house",
    address: "Mare Tranquillitatis, Moon",
    surface_area: 400,
    price_per_night: 40000,
    number_of_guests: 8,
    user: User.where(email: "blablabla@gmail.com").first
  )
Astroflat.create(
    flat_name: "Camping in a Saturne ring",
    content: "You think camping on Saturne is impossible? Now is possible",
    address: "ring A, Saturne",
    surface_area: 60,
    price_per_night: 90000,
    number_of_guests: 4,
    user: User.where(email: "blablabla@gmail.com").first
  )
