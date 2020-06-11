class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, only: [:create]
  add_flash_types :info, :warning

  before_action :add_parameters_to_users, if: :devise_controller?

  def add_parameters_to_users
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
  end
end
