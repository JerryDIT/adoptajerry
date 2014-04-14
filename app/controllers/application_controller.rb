class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_maker

  private
  def current_maker
    @current_maker ||= Maker.find(session[:maker_id]) if session[:maker_id]
  end
end
