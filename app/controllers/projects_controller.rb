class ProjectsController < ApplicationController
  skip_before_filter :authorize, only: [:index]

  def index
    @projects = Project.all
    @user = current_user
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @project_user = User.find(@project.user)
  end

  def create
    @project = Project.create(params[:project])
    if @project.errors.empty?
      @project.user = current_user
      @project.save
      redirect_to projects_path(@project)
    else
      flash[:errors] = @project.errors.full_messages
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to project_path(@project)
  end

  def destroy
    Project.delete(params[:id])
    redirect_to projects_path
  end

end
