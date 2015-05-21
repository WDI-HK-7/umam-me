json.array! @dishes do |dish|
  json.id dish.id
  json.name dish.name
  json.content dish.content
  json.created_at dish.created_at
end