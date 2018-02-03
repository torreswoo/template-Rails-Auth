class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # [devise]
  # permit username parameter
  before_action :configure_permitted_parameters, if: :devise_controller?

  # [Authority]
  before_action :authenticate_user!

  ### helper
  helper_method :current_user
  helper_method :user_signed_in?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :username, :name, :department])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :username, :name, :department])
  end

  # role & auth
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :danger => t('not_auth')
  end
end
