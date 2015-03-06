class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method(:user)

  def authenticate_user
    redirect_to '/login' unless user
  end
end
