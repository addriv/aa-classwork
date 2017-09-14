export const fetchAllPokemons = () => (
  $.ajax({
    method: 'GET',
    url: '/api/pokemons'
  })
);

export const fetchPokemon = pokemonId => (
  $.ajax({
    method: 'GET',
    url: `/api/pokemons/${pokemonId}`
  })
);
