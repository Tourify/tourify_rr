dcvb = Organization.create!(name: "DCVB", display_name: "DURHAM, NC", org_photo: "https://static1.squarespace.com/static/56eff436c2ea5144e9b6dce0/5861b28bbe6594106ff76705/5861b2aa03596eeb527fe719/1482883865229/Downtown-Durham-NC.jpg", description: "Welcome to Durham, an entrepreneurial city with rich history and diverse culture.", url: "https://www.durham-nc.com/", content_credit: "Durham Convention & Visitors Bureau")

admin1 = Admin.create!(username: "dcvbadmin", password: "bullcity", organization: dcvb)

main_tour = Tour.create!(name: "Downtown Durham History Walk", description: "Learn unique facts while exploring national landmarks, historic buildings, and local businesses.", distance: 1.2, time_in_mins: 60, organization: dcvb, admin: admin1, main_tour_photo: "https://jaredpattersonblog.files.wordpress.com/2017/10/dsc_0009.jpg")

#
# stop1 = Stop.create(stop_num: 1, name: 'Durham Visitor Info  Center', description: 'Experience experts are on hand to assist visitors and newcomers with directions, maps, and literature. Also home to Durham’s official marketing agency, the Durham Convention & Visitors Bureau. The Info Center is housed in the historic Trust Building, a 1905 Beaux Arts-style building and tallest office building in the state at the time of its construction.', location: '212 W Main St #101', tour: main_tour)
#
# stop2 = Stop.create(stop_num: 2, name: 'Main Street', description: 'A series of architecturally and historically significant properties, many with lofts/residences along the second story.', location: 'Main St inside Downtown Loop')
#
# stop3 = Stop.create(stop_num: 3, name: 'Old Hill Building', description: '1925 Georgian revival Old Hill Building commissioned by John Sprunt Hill.', location: '300 Block of W Main St')
#
# stop4 = Stop.create(stop_num: 4, name: 'Temple Building', description: '1909 Spanish colonial-style Temple Building built with leftover materials from the 1909 Watts Hospital.', location: '302 W Main St')

tourify_owners = Organization.create!(name: "Tourify owners", display_name: "Our town", )

tourify_testers = Organization.create!(name: "Beta testers", display_name: "Your town", )
