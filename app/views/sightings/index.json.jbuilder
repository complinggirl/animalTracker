json.array!(@sightings) do |sighting|
  json.extract! sighting, :id, :longitude, :latitude, :date, :date
  json.url sighting_url(sighting, format: :json)
end
