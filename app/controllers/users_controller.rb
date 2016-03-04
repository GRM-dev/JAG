class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @profile = Profile.create
    @user.profile_id = @profile.id
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfuly registered"
    else
      redirect_to new_user_path, alert: "Registration failed. Try again later"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
