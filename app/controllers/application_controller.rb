class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue
	session[:user_id] = nil
      end
    end

    def require_login
      unless current_user
        redirect_to signin_path, alert: t('require_signin') and return
      end
    end
end
