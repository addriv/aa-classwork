import { RECEIEVE_POKEMON_ERRORS, CLEAR_POKEMON_ERRORS } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

export const errorsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIEVE_POKEMON_ERRORS:
      return merge({}, state, action.errors);
    case CLEAR_POKEMON_ERRORS:
      return {};
    default:
      return state;
  }
};
