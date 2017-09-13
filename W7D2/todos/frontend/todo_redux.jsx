import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import configureStore from './store/store';
import Root from './components/root';

// Delete later
import { receiveTodos, receiveTodo, removeTodo , fetchTodos } from './actions/todo_actions';
import { allTodos } from './reducers/selectors';
// Delete later

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  // Delete later
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
  window.removeTodo = removeTodo;
  window.fetchTodos = fetchTodos;
  // Delete later


  ReactDOM.render(<Root store={ store }/>, document.getElementById('root'));
});
