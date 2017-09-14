import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';
import { allTodos } from './selectors';

// reducers/todos_reducer.js
const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

// const newTodos = [
//   {
//     id: 1,
//     title: 'new wash car',
//     body: 'with soap',
//     done: false
//   },
//   {
//     id: 2,
//     title: 'new wash dog',
//     body: 'with shampoo',
//     done: true
//   }
// ];

const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState1 = {};
      action.todos.forEach((todo) => {
        newState1[todo.id] = todo;
      });
      return newState1;
    case RECEIVE_TODO:
      const newState2 = Object.assign({}, state);
      newState2[action.todo.id] = action.todo;
      return newState2;
    case REMOVE_TODO:
      const newState3 = {};
      Object.keys(state).forEach((key) => {
        if (state[key].id !== action.todo.id) newState3[state[key].id] = state[key];
      });
      return newState3;
    default:
      return state;
  }
};

export default todosReducer;
