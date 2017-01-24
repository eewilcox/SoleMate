class UsersController < ApplicationController

  def index
    if current_user.admin?
      @users = User.all
    else
      flash[:notice] =  "Only Admin can see this page"
      redirect_to shoes_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.shoes.destroy_all
      @user.reviews.destroy_all
      @user.destroy
      redirect_to users_path
    else
      flash[:notice] =  "Only Admin can delete users"
      redirect_to shoes_path
    end
  end
end
