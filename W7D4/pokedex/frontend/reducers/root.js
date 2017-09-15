import { combineReducers } from 'redux';
import { entitiesReducer } from './entities';
import { errorsReducer } from './errors';
import { uiReducer } from './ui';
import { loadingReducer } from './loading';

export const rootReducer = combineReducers({
  entities: entitiesReducer,
  ui: uiReducer,
  errors: errorsReducer,
  loading: loadingReducer
});
