class ApplicationController < ActionController::Base

    layout "ventures"

    include Pundit::Authorization

    after_action :verify_authorized, unless: :devise_controller?
    around_action :set_user_time_zone, if: :current_user

    private

    def set_user_time_zone(&block)
        puts "set_user_time_zone #{current_user.id} #{current_user.time_zone}"
        Time.use_zone(current_user.time_zone, &block)
        # Time.zone = current_user.time_zone if current_user
    end



end
