class ApplicationController < ActionController::Base  
protect_from_forgery with: :exception

before_action :current_cart, :check_user, :configure_permitted_parameters, if: :devise_controller?
before_action :categories

  def after_sign_in_path_for(user)
    if current_user.user_type == "Admin"
      @suggestions = Suggestion.all
      users_path(@user)
    elsif current_user.user_type == "Customer"
      products_path
    else
      user_path(current_user.id)
    end
  end

  def categories
    @categories = Category.all
  end

  private

  def check_user
    sign_out current_user if current_user && current_user.disabled?
  end

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
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password, :user_type, :picture, :contact, :state, :city, :postal_code, :address)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :email, :password, :current_password, :picture, :user_type, :contact, :state, :city, :postal_code, :address)}
    end
end
