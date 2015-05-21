json.array! @dishes do |dish|
  json.id dish.id
  json.name dish.name
  json.content dish.content
  json.restaurant_name dish.restaurant_name
  json.picture dish.picture
  json.created_at dish.created_at
end