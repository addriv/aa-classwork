import React from 'react';
import App from './app';
import { Provider } from 'react-redux';
import TodoList from './todo_list/todo_list';

const Root = ({ store }) => (
  <Provider store={ store }>
    <div>
      <App />
    </div>
  </Provider>
);

export default Root;
