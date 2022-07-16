class ApplicationController < ActionController::Base
    layout "ventures"
    include Pundit::Authorization
    after_action :verify_authorized
end
