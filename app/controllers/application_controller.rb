class ApplicationController < ActionController::Base
  include JsEnv
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :city, :bio, :twitter_url, :website]
    devise_parameter_sanitizer.for(:account_update) << [:name, :city, :bio, :twitter_url, :website]
  end

  def set_locale
    available = ENV['LOCALES'].split(' ')
    I18n.locale = if maker_signed_in? && current_maker.locale.present?
                    current_maker.locale
                  elsif session[:locale].present?
                    session[:locale]
                  else
                    if locale = http_accept_language.preferred_language_from(available)
                      locale
                    elsif locale = http_accept_language.compatible_language_from(available)
                      locale
                    else
                      I18n.default_locale
                    end
                  end
  end

end
