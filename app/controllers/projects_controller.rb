class ProjectsController < ApplicationController
  skip_before_filter :authorize, only: [:index]

  def index
    # Collecting all the projects that are open
    @projects = Project.where({status: true})

    # Adding user name, email, and image source to each project
    @projects.each do |p, _|
      p[:user_name] = User.find(p.user_id).user_name
      p[:email] = User.find(p.user_id).email
      if p.category == 'Technology'
        p[:image] = '/techIcon.jpg'
      elsif p.category == 'Arts'
        p[:image] = '/artIcon.jpg'
      elsif p.category == 'Science'
        p[:image] = '/scienceIcon.jpg'
      end
    end

    # Collecting all the skills that are open
    @skills = Skill.where({status: true}).last(5)

    # Adding user name, email, and image source to each skill
    @skills.each do |s, _|
      s[:user_name] = User.find(s.user_id).user_name
      s[:email] = User.find(s.user_id).email
      if s.category == 'Technology'
        s[:image] = '/techIcon.jpg'
      elsif s.category == 'Arts'
        s[:image] = '/artIcon.jpg'
      elsif s.category == 'Science'
        s[:image] = '/scienceIcon.jpg'
      end
    end

    # Setting user variable to current user for welcome message
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
      # Adding current user id to the user_id foreign key in projects table
      @project.user = current_user
      @project.save

      redirect_to projects_path
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

    redirect_to my_posts_path
  end

  def destroy
    Project.delete(params[:id])

    redirect_to my_posts_path
  end

end
