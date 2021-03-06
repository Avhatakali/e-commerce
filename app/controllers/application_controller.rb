class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:second_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:status])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
  end
end
