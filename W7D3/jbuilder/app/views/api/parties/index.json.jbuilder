json.array! @parties do |party|
  json.partial! party
  json.guests party.guests, :name, :age, :favorite_color
end
