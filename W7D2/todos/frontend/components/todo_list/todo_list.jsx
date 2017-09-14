import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

export default class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    this.props.fetchTodos();
  }

  render(){
    const todoListItems = this.props.todos.map((todo) => (
      <TodoListItem item={todo} removeTodo={this.props.dbRemoveTodo}
        key={todo.id} updateTodo={this.props.updateTodo}/>
    ));

    return (
      <div>
        <TodoForm createTodo={ this.props.createTodo } errors={ this.props.errors } />
        <ul>
          { todoListItems }
        </ul>
      </div>
    );
  }
}
