import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import { receiveTodo, removeTodo, fetchTodos, createTodo,
  updateTodo, dbRemoveTodo } from '../../actions/todo_actions';

const mapStateToProps = (state) => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: (todo) => dispatch(createTodo(todo)),
  updateTodo: (todo) => dispatch(updateTodo(todo)),
  dbRemoveTodo: (todo) => dispatch(dbRemoveTodo(todo))
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
