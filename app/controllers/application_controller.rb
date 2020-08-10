class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    helper_method :ozToLbs, :getBabyWinner
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || babies_path
    end

    def ozToLbs(oz)
        lbs = oz.to_f / 16.0
        lbsSplit = lbs.to_s.split('.')
        ozDecimal = sprintf(".%s", lbsSplit[1]).to_f * 16

        return sprintf("%s lbs %d oz", lbsSplit[0], ozDecimal)
    end

    def getBabyWinner(baby_id)
        pool = Pool.where(baby_id: baby_id, winner: true).limit(1).first
        return pool
    end

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
        end
end
