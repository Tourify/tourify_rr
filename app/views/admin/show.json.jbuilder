json.admin do
  json.id @admin.id
  json.username @admin.username
  json.tours @admin.tours do |tour|
    json.name tour.name
  end
end
