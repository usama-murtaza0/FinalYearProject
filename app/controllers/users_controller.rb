class UsersController < ApplicationController
  before_action :find_user, except: [:index]

  def index
    @users = User.order("created_at DESC")
  end
  
  def show
  end

  def products
  end

  def orders
  end

  def orders
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to new_user_session_path 
    else
      render 'edit'
    end
  end
  
  def deactivate
    @user.deactivated = true
    @user.save
    redirect_to users_path
  end

  def activate
    @user.deactivated = false
    @user.save
    redirect_to users_path
  end

  def order_status
    @user.order_status = true
  end
  
  private

  def find_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :contact, :physical_store_address, :picture)
  end

end
