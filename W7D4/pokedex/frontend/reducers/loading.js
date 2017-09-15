import { START_LOADING_ALL_POKEMON,
         START_LOADING_SINGLE_POKEMON,
         RECEIVE_ALL_POKEMON,
         RECEIVE_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';

export const loadingReducer = (state = false, action) => {
  Object.freeze(state);
  switch(action.type) {
    case START_LOADING_ALL_POKEMON:
    case START_LOADING_SINGLE_POKEMON:
      return true;
    case RECEIVE_ALL_POKEMON:
    case RECEIVE_POKEMON:
      return false;
    default:
      return state;
  }
};
