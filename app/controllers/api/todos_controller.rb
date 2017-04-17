# app/controllers/api/todos_controller.rb
module API
class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    todos = $redis.get("todos")
    logger.debug(todos)
    if todos.nil?
      todos = Todo.all.to_json
      $redis.set("todos", todos)
      $redis.expire("todos", 3.hour.to_i)
    end
    @todos = JSON.load todos
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
end
