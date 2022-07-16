class UsersController < ApplicationController
  
  def index
    authorize User
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    authorize @user
  end

end
