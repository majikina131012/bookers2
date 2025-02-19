class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def change_locale
    session[:locale] = params[:locale]
    redirect_back(fallback_location: root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  # def set_locale
  #   I18n.locale = prams[:locale] || I18n.default_locale
  # end 

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
