import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
import errorsReducer from './errors_reducer';

export default combineReducers ({
  todos: todosReducer,
  errors: errorsReducer
});
