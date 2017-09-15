export const selectAllPokemon = state => (
  Object.values(state.entities.pokemon)
);

export const selectPokemonById = state => (
   state.entities.pokemon[state.ui.pokeDisplay]
);

export const selectCachedItems = state => (
  state.entities.items
);

export const selectAllErrors = state => (
  Object.values(state.errors)
);
