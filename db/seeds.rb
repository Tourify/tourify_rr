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

# stop1 = TourStop.create(name: 'Durham Visitor Info  Center', description: 'Experience experts are on hand to assist visitors and newcomers with directions, maps, and literature. Also home to Durham’s official marketing agency, the Durham
# Convention & Visitors Bureau. The Info Center is housed in the historic Trust Building, a 1905 Beaux Arts-style building and tallest office building in the state at the time of its construction.', location: '212 W Main St #101', next_direction: 'HEAD WEST ON MAIN ST')
# stop2 = TourStop.create(name: 'Main Street', description: 'A series of architecturally and historically significant properties, many with lofts/residences along the second story.', location: 'Main St inside Downtown Loop')
# stop3 = TourStop.create(name: 'Old Hill Building', description: '1925 Georgian revival Old Hill Building commissioned by John Sprunt Hill.', location: '300 Block of W Main St')
# stop4 = TourStop.create(name: 'Temple Building', description: '1909 Spanish colonial-style Temple Building built with leftover materials from the 1909 Watts Hospital.', location: '302 W Main St')
# stop5 = TourStop.create(name:'1904 Beaux Arts-style building', location: '315 W Main St')
# stop6 = TourStop.create(name: 'Snow Building', description: 'One of Durham’s finest art deco structures, built in 1933. Its elevator was the last in the state run by a full-time operator.', location: '331 W Main St')
# stop7 = TourStop.create(name: 'Five Points/Muirhead Plaza', description: 'Includes site of 1906 invention
# of BC Headache Powder.', location: 'Intersection of W Main, E Chapel
# Hill, and Morris Sts')

# {"organization": {
#   "name": "Durham Convention & Visitor's Bureau",
#   "display_name": "DCVB"
#   }
# }

# {"tour": {
# 	"name": "Main Route",
# 	"description": "This is the main route as defined by the DVB",
# 	"distance": "1.2",
# 	"time_in_mins": "60"
# 	}
# }
