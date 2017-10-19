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
#
# stop1 = Stop.create(stop_num: 1, name: 'Durham Visitor Info  Center', description: 'Experience experts are on hand to assist visitors and newcomers with directions, maps, and literature. Also home to Durham’s official marketing agency, the Durham Convention & Visitors Bureau. The Info Center is housed in the historic Trust Building, a 1905 Beaux Arts-style building and tallest office building in the state at the time of its construction.', location: '212 W Main St #101', tour: main_tour)
#
# stop2 = Stop.create(stop_num: 2, name: 'Main Street', description: 'A series of architecturally and historically significant properties, many with lofts/residences along the second story.', location: 'Main St inside Downtown Loop')
#
# stop3 = Stop.create(stop_num: 3, name: 'Old Hill Building', description: '1925 Georgian revival Old Hill Building commissioned by John Sprunt Hill.', location: '300 Block of W Main St')
#
# stop4 = Stop.create(stop_num: 4, name: 'Temple Building', description: '1909 Spanish colonial-style Temple Building built with leftover materials from the 1909 Watts Hospital.', location: '302 W Main St')

# TODO: Add float to long and lat values, make unique all fields in database that need it, 
