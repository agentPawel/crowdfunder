class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @projects_owned = current_user.owned_projects
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy

   redirect_to projects_url
 end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
