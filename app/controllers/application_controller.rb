class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :redirect_anon, :current_user

  def current_user
    # puts session[:user_id]
    @_current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @_current_user = nil
  end

  def redirect_anon
    unless current_user
      flash[:alert] = "Sorry! You must be logged in to view this page."
      redirect_to '/login'
    end
  end

end
