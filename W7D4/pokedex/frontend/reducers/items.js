import { RECEIVE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

export const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_POKEMON:
      const items = {};
      action.payload.items.forEach(item => {
        items[item.id] = item;
      });
      return merge({}, state, items);
    default:
      return state;
  }
};
