class ApplicationController < ActionController::Base  
protect_from_forgery with: :exception

before_action :current_cart, :configure_permitted_parameters, if: :devise_controller?
before_action :categories, :set_cart

  def after_sign_in_path_for(user)
    if current_user.user_type == "Admin"
      current_user.deactivated = false
      @suggestions = Suggestion.all
      users_path(@user)
    elsif current_user.user_type == "Customer"
      current_user.deactivated = false
      products_path
    elsif current_user.user_type == "Vendor"
      if current_user.deactivated
        flash[:alert] = "Your profile is deactivated. Admin is processing your profile."
        user_path(current_user.id)
      else
        user_path(current_user.id)
      end
    end
  end

  def set_cart
    if current_user
      @current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
    end
  end

  def categories
    @categories ||= Category.all
  end

  private


  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation, :user_type, :picture, :contact, :state, :city, :postal_code, :address)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :email, :password, :current_password, :picture, :user_type, :contact, :state, :city, :postal_code, :address)}
    end
end
