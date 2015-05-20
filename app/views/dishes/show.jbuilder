json.id @dish.id
json.name @dish.name
json.content @dish.content

json.comments @dish.comments do |comment|
  json.content comment.content
  json.created_at comment.created_at
  json.user_id comment.user_id
end