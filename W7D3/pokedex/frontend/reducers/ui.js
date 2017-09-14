import {RECEIVE_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const _defaultState = {
  pokeDisplay: -1,
  errors: {},
  loading: {}
};

export const uiReducer = (state = _defaultState, action) => {
  Object.freeze(state);
  switch( action.type ) {
    case RECEIVE_POKEMON:
      return merge({}, state, {pokeDisplay: action.payload.pokemon.id});
    default:
      return state;
  }
};
