class UsersController < ApplicationController
  
  before_action :set_user, except: [:index]

  def index
    authorize User
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:time_zone)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

end
