class CommentsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    @task = Task.find(params[:task_id])
    @comments = @task.comments.all
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    comment = @task.comments.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to project_task_path(@task)
    else
      render 'edit'
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params.merge(:user_id => current_user.id))
    if @comment.save
      redirect_to project_task_path(@project, @task)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    redirect_to project_task_path(@project, @task)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
