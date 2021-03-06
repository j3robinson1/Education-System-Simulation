class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
   # before_action :authenticate_user!
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :current_password, :password, :password_confirmation, :school_id) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :password, :password_confirmation, :school_id) }
  end
end
