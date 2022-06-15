class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :update_sanitized_params, if: :devise_controller?

  # def update_sanitized_params
  #   devise_parameter_sanitizer {|u| u.permit(:user_name, :email, :password, :password_confirmation, :contact, :user_type, :physical_store_address, :picture)}
  # end    
end
