class SkillsController < ApplicationController
  skip_before_filter :authorize, only: [:index]

  def index
    # Collecting all the projects that are open
    @projects = Project.where({status: true}).last(5)

    # Adding user name to each project
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
    @skills = Skill.where({status: true})

    # Adding user name to each skill
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
    @skill = Skill.new
  end

  def create
    @skill = Skill.create(params[:skill])
    if @skill.errors.empty?
      # Adding current user id to the user_id foreign key in skills table
      @skill.user = current_user
      @skill.save

      redirect_to skills_path
    else
      flash[:errors] = @skill.errors.full_messages
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update_attributes(params[:skill])

    redirect_to skills_path
  end

  def destroy
    Skill.delete(params[:id])

    redirect_to projects_path
  end

end
