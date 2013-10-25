class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create, :my_posts]

  def new
    @user = User.new
  end

  def show
    @user = current_user

  end

  def create
    @user = User.create(params[:user])
    if @user.errors.empty?
      sign_in(@user)

      redirect_to sessions_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    if @user.errors.empty?
      sign_in(@user)

      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    # Project.delete(params[:id])
    # redirect_to
  end

  def my_posts
    @projects = Project.where({user_id: current_user.id})
    @skills = Skill.where({user_id: current_user.id})

    @projects.each do |p, _|
      p[:user_name] = current_user.user_name
    end

    @skills.each do |s, _|
      s[:user_name] = current_user.user_name
    end
  end

end
