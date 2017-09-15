json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense

  if @pokemon.image_url.include?('.svg')
    json.image_url "assets/#{@pokemon.image_url}"
  else
    json.image_url @pokemon.image_url
  end

  json.extract! @pokemon, :moves, :poke_type
end

json.items @pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
