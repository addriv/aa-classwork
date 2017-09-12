import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
import Util from '../../util/util';

const TodoList = ( { todos, receiveTodo } ) => {
  const todoListItems = todos.map((todo) => (
    TodoListItem(todo)
  ));

  // let largestId = 1;
  // if (todos.length > 0) largestId = todos.slice(-1)[0].id;

  return (
    <div>
      <TodoForm receiveTodo={receiveTodo} Util={ Util }/>
      <ul>
        { todoListItems }
      </ul>
    </div>
  );
};

export default TodoList;


// export default class TodoList extends React.Component {
//   // constructor(props) {
//   //   super(props);
//   //   // this.todos = todos;
//   // }
//   //
//   // render(){
//   //   return (
//   //     <ul>
//   //       this.props.todos.map((todo) => (
//   //         <li>{todo.title}</li>
//   //       ));
//   //     </ul>
//   //   );
//   // }
//
//
// }
