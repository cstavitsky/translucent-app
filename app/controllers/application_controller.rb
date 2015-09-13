class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def sat_through_wed
    Time.now.saturday? || Time.now.sunday? || Time.now.monday? || Time.now.tuesday? || Time.now.wednesday?
  end
  helper_method :sat_through_wed

  def thurs_through_sat
    Time.now.thursday? || Time.now.friday? || Time.now.saturday?
  end
  helper_method :thurs_through_sat

  def authorize
    redirect_to '/login' unless current_user
  end
end
