class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [{ role_users_attributes: %i[user_id role_id] }])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [{ role_users_attributes: %i[user_id role_id] }])
  end
end
