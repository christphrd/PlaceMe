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
