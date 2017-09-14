# json.partial! 'api/pokemons/pokemon', pokemon: @pokemon

json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense
  json.image_url "assets/#{@pokemon.image_url}"
  json.extract! @pokemon, :moves, :poke_type
end

json.items @pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
