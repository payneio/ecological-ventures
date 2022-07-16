class ApplicationController < ActionController::Base
    layout "ventures"
    include Pundit::Authorization
    after_action :verify_authorized, unless: :devise_controller?
end
