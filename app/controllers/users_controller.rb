class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      current_user = @user
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:email, :handle, :name, :password,
                                 :password_confirmation, :profile_pic)
  end
end
