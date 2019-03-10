class ApplicationController < ActionController::Base
  before_action :current_user, except: [:is_logged_in?, :log_in]

  def require_login
    redirect_to login_path unless is_logged_in?
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_logged_in?
    session[:user_id].present? && @current_user.present?
  end
end
