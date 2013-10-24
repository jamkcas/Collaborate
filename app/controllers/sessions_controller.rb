class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:index, :new, :create]

  def index

  end

  def new

  end

  def create
    @user = User.find_by_user_name(params[:user_name])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)

      redirect_to projects_path
    else
      flash[:errors] = "Username or password is incorrect."
      render :new
    end
  end

  def destroy
    sign_out

    redirect_to new_session_path
  end
end
