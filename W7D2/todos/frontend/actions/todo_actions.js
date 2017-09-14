import APIUtil from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';


export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});

export const fetchTodos = () => dispatch => (
  APIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = formTodo => dispatch => (
  APIUtil.createTodo(formTodo)
    .then(
      dbTodo => dispatch(receiveTodo(dbTodo)),
      err => dispatch(receiveErrors(err.responseJSON))
    ).then(
      () => dispatch(clearErrors()))
);

export const updateTodo = todo => dispatch => (
  APIUtil.updateTodo(todo)
    .then(
      dbTodo => dispatch(receiveTodo(dbTodo)),
      err => dispatch(receiveErrors(err.responseJSON))
    ).then(
      () => dispatch(clearErrors()))
);

export const dbRemoveTodo = btntodo => dispatch => (
  APIUtil.removeTodo(btntodo)
    .then(
      dbTodo => dispatch(removeTodo(dbTodo)),
      err => dispatch(receiveErrors(err.responseJSON))
    ).then(
      () => dispatch(clearErrors())
    )
);
