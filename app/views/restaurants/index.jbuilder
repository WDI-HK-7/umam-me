json.array! @restaurants do |restaurant|
  json.name restaurant.name
  json.location restaurant.location
  json.cuisine restaurant.cuisine
  json.price restaurant.price
end