class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

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
      redirect_to user_path(@user.id)
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

end
