class Api::TodosController < ApplicationController
  def show
    render json: Todo.find(params[:id])
  end

  def index
    @todos = Todo.all
    render json: @todos
  end

  def update
    @todo = Todo.find_by_id(params[:id])
    if @todo
      if @todo.update_attributes(todo_params)
        render json: @todo
      else
        render json: @todo.errors.full_messages, status: 422
      end
    else
      render json: { errors: "Could not find this todo" }, status: 404
    end
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end
end
