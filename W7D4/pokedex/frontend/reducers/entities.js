import { combineReducers } from 'redux';
import { pokemonReducer } from './pokemon';
import {itemsReducer} from './items';

export const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemsReducer
});
