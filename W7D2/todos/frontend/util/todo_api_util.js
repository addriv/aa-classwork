const APIUtil = {
  fetchTodos: function fetchTodos() {
    return $.ajax({
      method: 'GET',
      url: 'api/todos'
    });
  },

  createTodo: function createTodo(todo) {
    return $.ajax({
      method: 'POST',
      url: 'api/todos',
      data: { todo },
      dataType: "JSON"
    });
  },

  updateTodo: function updateTodo(todo) {
    return $.ajax({
      method: 'PATCH',
      url: `api/todos/${todo.id}`,
      data: { todo }
    });
  },

  removeTodo: function removeTodo(todo) {
    return $.ajax({
      method: 'DELETE',
      url: `api/todos/${todo.id}`
    });
  }
};

export default APIUtil;
