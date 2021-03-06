json.id @tour.id
json.name @tour.name
json.description @tour.description
json.stop_count @tour.stops.count
json.main_tour_photo @tour.main_tour_photo
json.distance @tour.distance
json.time_in_mins @tour.time_in_mins
json.stops_coordinates @tour.stops.sort_by { |stop| stop.stop_num }.each do |stop|
  json.stop_num stop.stop_num
  json.gps_long stop.gps_long
  json.gps_lat stop.gps_lat
end

json.stops @tour.stops.sort_by { |stop| stop.stop_num }.each do |stop|
  json.stop_num stop.stop_num
  json.name stop.name
  json.description stop.description
  json.location stop.location
  json.directions_to_next_stop stop.directions_to_next_stop
  json.travel_tip stop.travel_tip
  json.gps_long stop.gps_long
  json.gps_lat stop.gps_lat
  json.learn_more_URL stop.learn_more_URL
  json.image_current stop.image_current
  json.image_historic stop.image_historic
  json.badge stop.badge
end
