import { combineReducers } from 'redux';
import { entitiesReducer } from './entities';
import { uiReducer } from './ui';

export const rootReducer = combineReducers({
  ui: uiReducer,
  entities: entitiesReducer,
});
