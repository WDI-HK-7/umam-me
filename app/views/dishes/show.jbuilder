json.id @dish.id
json.name @dish.name
json.picture @dish.picture
json.content @dish.content
json.restaurant_name @dish.restaurant_name

json.comments @comments do |comment|
  json.content comment.content
  json.created_at comment.created_at
  json.user_id comment.user_id
end
