json.array! @dishes do |dish|
  json.id dish.id
  json.name dish.name
  json.content dish.content
  json.picture dish.picture
  json.restaurant_name dish.restaurant_name
  json.created_at dish.created_at
end