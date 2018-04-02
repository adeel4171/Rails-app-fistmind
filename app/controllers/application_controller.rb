class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_client!
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :role_ids])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password])
  end 

  def after_sign_in_path_for(user)
   
   home_path
  end

end
