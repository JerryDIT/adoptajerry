class ApplicationController < ActionController::Base
  include JsEnv
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_maker

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  private

  def current_maker
    @current_maker ||= Maker.find(session[:maker_id]) if session[:maker_id]
  end

  def current_user
    current_maker
  end
end
