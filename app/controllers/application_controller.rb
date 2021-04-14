class ApplicationController < ActionController::Base
  include Pagy::Backend
  protected

  def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end


  def after_sign_in_path_for(resource)
    if current_user.admin == true
      rails_admin_path
    else
      root_path
    end
  end
end
