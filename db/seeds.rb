url = "https://api.teleport.org/api/urban_areas/"
major_cities = RestClient.get(url)
cities_hash = JSON.parse(major_cities)
cities_list_arr = cities_hash["_links"]["ua:item"]

cities_list_arr.each do |city|
  Place.create(city: city["name"])
end


cities_list_arr.each do |city|
  photos_unparsed = RestClient.get("#{city['href']}images")
  photos_hash = JSON.parse(photos_unparsed)
  img_url = photos_hash["photos"][0]["image"]["web"]
  Photo.create(url: img_url, place_id: Place.find_by(city: city["name"]).id)
end
