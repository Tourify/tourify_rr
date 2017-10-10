# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)
#
dvb = Organization.create!(name: "DVB", display_name: "Visitor's Burea")

admin1 = Admin.create!(username: "Ginnie", password: "ducks", organization: dvb)

main_tour = Tour.create!(name: "Main route", description: "This is the main route as defined by the DVB", distance: 1.2, time_in_mins: 60, organization: dvb, admin: admin1)
