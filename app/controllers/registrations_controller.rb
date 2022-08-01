class RegistrationsController < Devise::RegistrationsController

    def after_update_path_for(resource)
        user_path(resource)
    end

    private
  
    def sign_up_params
        params.require(:user).permit(:email, :password, :username, :time_zone, :password_confirmation, :current_password)
    end

    def account_update_params
        params.require(:user).permit(:email, :password, :username, :time_zone, :password_confirmation, :current_password)
    end

end
