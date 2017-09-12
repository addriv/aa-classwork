import React from 'react';

const TodoListItem = (item) => (
  <li key={item.id}>{item.title}</li>
);

export default TodoListItem;
