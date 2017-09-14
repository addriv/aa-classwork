import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_POKEMON:
      const pokemon = action.payload.pokemon;
      pokemon.item_ids = action.payload.items.map(item => item.id);
      return merge({}, state, {[pokemon.id]: pokemon});
    default:
      return state;
  }
};
