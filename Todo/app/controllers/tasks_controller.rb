class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @tasks = Task.all
    @task = Task.create(task_params)
    redirect_to '/'
  end

  private
  def task_params
    params.require(:task).permit(:name, :memo, :position)
  end
end
