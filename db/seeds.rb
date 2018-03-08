# chris = User.create(first_name: "Chris", last_name: "Diep", email: "diep.christopher@gmail.com")
# rick = User.create(first_name: "Rick", last_name: "Nilon", email: "r.nilon92@gmail.com")
# nyc = Place.create(city: "New York City", country: "United States")
# tokyo = Place.create(city: "Tokyo", country: "Japan")
# sf = Place.create(city: "San Francisco", country: "United States")
url = "https://api.teleport.org/api/urban_areas/"
major_cities = RestClient.get(url)
cities_hash = JSON.parse(major_cities)
cities_list_arr = cities_hash["_links"]["ua:item"]

cities_list_arr.each do |city|
  Place.create(city: city["name"])
end

# cities_list_arr.each do |city|
#   city_unparsed = RestClient.get("#{city['href']}")
#   city_hash = JSON.parse(city_unparsed)
#   country = city_hash["_links"]["ua:countries"][0]["name"]
#   # continent = city_hash["_links"]["ua:continent"]["name"]
#   # Place.create(city: city["name"], country: country, continent: continent)
#   Place.create(city: city["name"], country: country)
# end


cities_list_arr.each do |city|
  photos_unparsed = RestClient.get("#{city['href']}images")
  photos_hash = JSON.parse(photos_unparsed)
  img_url = photos_hash["photos"][0]["image"]["web"]
  Photo.create(url: img_url, place_id: Place.find_by(city: city["name"]).id)
end
