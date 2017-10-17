json.organization do
  json.id @organization.id
  json.description @organization.description
  json.url @organization.url
  json.logo_url @organization.logo_url
  json.display_name @organization.display_name
  json.org_photo @organization.org_photo
  json.tours @organization.tours do |tour|
    json.tour_name tour.name
    json.description tour.description
    json.main_tour_photo tour.main_tour_photo
  end
  json.admins @organization.admins do |admin|
    json.username admin.username
  end
end
