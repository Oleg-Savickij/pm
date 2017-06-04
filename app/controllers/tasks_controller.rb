class TasksController < ApplicationController
  protect_from_forgery with: :exception
  load_and_authorize_resource

  def show
    @project = Project.find(params[:project_id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to project_task_path(@task)
    else
      render 'edit'
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :status, :user_id)
  end

end
