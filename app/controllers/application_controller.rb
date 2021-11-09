class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  protected

  # Devise methods
  # Authentication key(:username) and password field will be added automatically by devise.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: :email
    devise_parameter_sanitizer.permit :account_update, keys: :email
  end
end
